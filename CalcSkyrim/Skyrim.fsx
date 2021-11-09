module GameSettings =
    
    //block
    let fShieldBaseFactor = 50.0 //fShieldBaseFactor [GMST:000130FE] базовый % заблокированного урона для щита
    let fShieldScalingFactor = 0.05 //fShieldScalingFactor [GMST:0003189B] влияние базовой брони щита на % заблокированного урона
    let fBlockWeaponBase = 40.0 //fBlockWeaponBase [GMST:00045C4F] базовый % заблокированного урона для оружия
    let fBlockWeaponScaling = 0.07 //fBlockWeaponScaling [GMST:00045C50] влияние базовой урона оружия ВРАГА на % заблокированного урона
    let fBlockPowerAttackMult = 0.5 //fBlockPowerAttackMult [GMST:0004E609] итоговое значение умножается на этот коэфициент если блокируется силовая атака

    //enchanting
    let fEnchantingSkillFactor = 1.25 //fEnchantingSkillFactor [GMST:0010C4DA] влияние навыка зачарования на эффективность накладываемых чар, 1.25 означает что чары на 100 навыка будут на 25% сильнее чем при 0

    //alchemy
    let fAlchemySkillFactor = 1.1 //fAlchemySkillFactor [GMST:0010C4D9] влияние навыка алхимии на эффективность создаваемых зелий, 1.1 означает что зелья на 100 навыка будут на 10% сильнее чем при 0
    let fAlchemyIngredientInitMult = 4.0 //Базовый мультипликатор силы ингридиентов

//Формулы блока
module Block =
//75 50
    //Формула для щита
    let shieldPercentBlocked baseShieldArmor perkMult isPowerAttack =
        if isPowerAttack then
            (GameSettings.fShieldBaseFactor + GameSettings.fShieldScalingFactor *   baseShieldArmor) * perkMult * GameSettings.fBlockPowerAttackMult
        else
            (GameSettings.fShieldBaseFactor + GameSettings.fShieldScalingFactor *   baseShieldArmor) * perkMult

    //Формула для оружия
    let weaponPercentBlocked enemyBaseWeaponDamage perkMult isPowerAttack =
        if isPowerAttack then
            (GameSettings.fBlockWeaponBase + GameSettings.fBlockWeaponScaling *     enemyBaseWeaponDamage) * perkMult * GameSettings.fBlockPowerAttackMult
        else
            (GameSettings.fBlockWeaponBase + GameSettings.fBlockWeaponScaling * enemyBaseWeaponDamage) *  perkMult

//Формулы зачарования
module Enchanting =

    //Описание зачарований в игре, его множитель со взятым перком и базовая сила
    type Enchantments =
        | FireDamage
        | FireResist

        member self.Multiplay =
            match self with
            | FireDamage -> 1.25
            | FireResist -> 1.5

        member self.BaseMagnitude =
            match self with
            | FireDamage -> 10.0
            | FireResist -> 8.0

    //Общий множитель зачарования
    let private fEnchMult = 1.15 * 1.5 * 1.15 * GameSettings.fEnchantingSkillFactor

    //Формула конечной силы зачарования
    let enchantmentPower havePerk (enchantment: Enchantments) =
        match havePerk with
        | true -> enchantment.BaseMagnitude * fEnchMult * enchantment.Multiplay
        | false -> enchantment.BaseMagnitude * fEnchMult

//Формулы алхимии
module Alchemy =

    //Описание эффекта в ингридиенте и игридиента
    type Effect =
        { Magnitude: float
          IsRestoreValue: bool; }

    type Ingridient =
        { Effects: Effect list }

    //Общий множитель с настроек игры и с первом перком
    let private fAlchemyBaseMult = GameSettings.fAlchemySkillFactor * GameSettings.fAlchemyIngredientInitMult
    //Множители с перков алхимии
    let private fPerkAlchemicalLore = 1.5
    let private fPerkCatalysus = 1.2 * 1.154
    let private fPerkImprovedeLixirs = 1.25
    let private fPerkPurificationProcess = 1.3
    let private fPerksMult = fPerkAlchemicalLore * fPerkCatalysus * fPerkImprovedeLixirs * fPerkPurificationProcess
    //Дополнительный множитель для эффекта восстановления здоровья \ запаса сил \ магии
    let private fRestoreValueMult = 1.25 * 1.25

    //Формула конечной силы эффектов в ингридиенте
    let alchemyMaxIngredientPower ingridient =
        ingridient.Effects
        |>List.map (fun effect ->
            if effect.IsRestoreValue then
                effect.Magnitude * fAlchemyBaseMult * fPerksMult * fRestoreValueMult
            else
                effect.Magnitude * fAlchemyBaseMult * fPerksMult)

//Формулы для ресурс менеджера, расход ресурсов на атаки и прыжок
module ResourceManager =

    //Описание оружия
    type Weapon =
        { Weight: float
          Damage: float; }
    //Описание актера
    type Actor =
        { Infamy: float
          PowerAttackSpendAV: float;
          AttackSpendAV: float;
          Weapon: Weapon;
          CrossbowPerk: bool; }
    //Описание веса стрел \ болтов
    type AmmoWeight =
        | None
        | Light
        | Medium
        | Heavy
        | Massive

        member self.WeightValue =
            match self with
            | None -> 0.0
            | Light -> 1.5
            | Medium -> 3.0
            | Heavy -> 4.5
            | Massive -> 6.0
    //Перечисление действий
    type Action =
        | Attack
        | PowerAttack
        | Drawn of AmmoWeight
        | Reload of AmmoWeight
        | Jump

    //Глобальные множители
    let private fGlobalMult = 1.0 //Общий множитель
    let private fGlobalWeightMult = 1.25//Множитель влияния веса
    let private fGlobalJumpValueBase = 10.0//Значение затраты на прыжок
    let private fPowerMod = 2.0//Множитель расхода силовых

    //Формула рассчета влияния веса
    let private equippedWeaponWeight weapon =

        if weapon.Weight > 0.0 then
            weapon.Weight * fGlobalWeightMult
        else
            weapon.Damage / 5.0 * fGlobalWeightMult

    //Рассчет множителя обычной атаки
    let private calculateAttackMult attackValue =
        if attackValue > 90.0 then
            1.0 - (90.0 / 100.0)
        elif attackValue <= 0.0 then
            1.0
        else
            1.0 - (attackValue / 100.0)
    
    //Рассчет множителя силовой атаки
    let private calculatePowerAttackMult isPowerAttack powerValue =

        if isPowerAttack then
            if powerValue > 90.0 then
                fPowerMod * (1.0 - (90.0 / 100.0))
            else
                fPowerMod * (1.0 - (powerValue / 100.0))
        else
            0.0

    //Рассчет расхода ресурса для оружия ближнего боя
    let private drainValueMelee actor isPowerAttack =

        let weight = 0.5 * equippedWeaponWeight actor.Weapon * calculateAttackMult actor.AttackSpendAV
        let infamy = actor.Infamy
        let powerAttackMult = calculatePowerAttackMult isPowerAttack actor.PowerAttackSpendAV

        let calcFlat flatValue =
            flatValue + (1.0 - (weight * 2.0 / 100.0))

        let calcValue powerMult flatValue =
            if infamy > 1.0 then
                (weight * infamy) + (weight * infamy * powerMult) + calcFlat flatValue
            else
                weight + (weight * powerMult) + calcFlat flatValue

        if powerAttackMult > 0.0 then
            calcValue powerAttackMult 10.0
        else                         
            calcValue 0.0 5.0

    //Рассчет расхода ресурса для оружия дальнего боя
    let private drainValueRanged actor =

        let weight = equippedWeaponWeight actor.Weapon * calculateAttackMult actor.AttackSpendAV
        let infamy = actor.Infamy

        if infamy > 1.0 then
            weight * infamy
        else
            weight

    //Функция входной точки начала рассчета с вводными данными
    let startAction action actor =

        match action with
        | Attack -> drainValueMelee actor false * fGlobalMult
        | PowerAttack -> drainValueMelee actor true * fGlobalMult
        | Drawn arrow -> (arrow.WeightValue + drainValueRanged actor * 0.75) * fGlobalMult
        | Reload bolt ->
            match actor.CrossbowPerk with //Ловкая перезарядка уменьшает трату ресурса на перезарядку арбалета
            | true -> (bolt.WeightValue + drainValueRanged actor * 0.75) * 0.7 * fGlobalMult
            | false -> (bolt.WeightValue + drainValueRanged actor * 0.75) * fGlobalMult
        | Jump ->
            if actor.Infamy > 1.0 then
                fGlobalJumpValueBase * actor.Infamy
            else
                fGlobalJumpValueBase
