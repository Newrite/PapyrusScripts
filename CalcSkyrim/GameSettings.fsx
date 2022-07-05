module GameSettings
    
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