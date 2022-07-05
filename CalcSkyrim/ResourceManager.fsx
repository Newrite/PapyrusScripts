//Формулы для ресурс менеджера, расход ресурсов на атаки и прыжок
module ResourceManager

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
let private fGlobalMult = 0.75 //Общий множитель
let private fGlobalWeightMult = 1.0//Множитель влияния веса
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
    //let weight = 0.5 * equippedWeaponWeight actor.Weapon * calculateAttackMult actor.AttackSpendAV
    let weight = equippedWeaponWeight actor.Weapon * calculateAttackMult actor.AttackSpendAV
    let infamy = actor.Infamy
    let powerAttackMult = calculatePowerAttackMult isPowerAttack actor.PowerAttackSpendAV
    let calcFlat flatValue =
        flatValue + (1.0 - (weight * 3.0 / 100.0))
    let calcValue powerMult flatValue =
        if infamy > 1.0 then
            (weight * infamy) + (weight * infamy * powerMult) + calcFlat flatValue
        else
            weight + (weight * powerMult) + calcFlat flatValue
    if powerAttackMult > 0.0 then
        calcValue powerAttackMult 5.0
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
    | Drawn arrow -> arrow.WeightValue + drainValueRanged actor * fGlobalMult
    | Reload bolt ->
        match actor.CrossbowPerk with //Ловкая перезарядка уменьшает трату ресурса на перезарядку арбалета
        | true -> bolt.WeightValue + drainValueRanged actor * 0.7 * fGlobalMult
        | false -> bolt.WeightValue + drainValueRanged actor * fGlobalMult
    | Jump ->
        if actor.Infamy > 1.0 then
            fGlobalJumpValueBase * actor.Infamy
        else
            fGlobalJumpValueBase