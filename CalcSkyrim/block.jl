fShieldBaseFactor = 50.0 # fShieldBaseFactor [GMST:000130FE] базовый % заблокированного урона для щита
fShieldScalingFactor = 0.05 # fShieldScalingFactor [GMST:0003189B] влияение базовой брони щита на % заблокированного урона

fBlockWeaponBase = 40.0 # fBlockWeaponBase [GMST:00045C4F] базовый % заблокированного урона для оружия
fBlockWeaponScaling = 0.07 # fBlockWeaponScaling [GMST:00045C50] влияение базовой урона оружия ВРАГА на % заблокированного урона

fBlockPowerAttackMult = 0.5 # fBlockPowerAttackMult [GMST:0004E609]

# Максимальный % урона который может заблокировать блок равен максимальному % физического сопротивления от брони (то есть 80%)

#Формула для щита
function BlockShield(BaseShieldArmor, PerkMult = 1.0, PowerAttack = false)
    if PowerAttack
        return (fShieldBaseFactor + fShieldScalingFactor * BaseShieldArmor) * PerkMult * fBlockPowerAttackMult
    else
        return (fShieldBaseFactor + fShieldScalingFactor * BaseShieldArmor) * PerkMult
    end
end

#Формула для оружия
function BlockWeapon(EnemyBaseWeaponDamage, PerkMult = 1.0, PowerAttack = false)
    if PowerAttack
        return (fBlockWeaponBase + fBlockWeaponScaling * EnemyBaseWeaponDamage) * PerkMult * fBlockPowerAttackMult
    else
        return (fBlockWeaponBase + fBlockWeaponScaling * EnemyBaseWeaponDamage) * PerkMult
    end
end

BlockPerkMult = 1.6 # Крепкая хватка 1.2 + самый первый перк 1.4 = 1.6 (будет аддитивно), другие перки бонуса не дают
EnchAlchBlessMult = 2.0 # 2.0 = 100% эффективность блока с банок \ чантов \ блессов, они все аддитивные

# Максимальный % урона который может заблокировать блок равен максимальному % физического сопротивления от брони (то есть 80%)

# 162 = базовый урон даэдрического молота
BlockWeapon(162, BlockPerkMult * EnchAlchBlessMult) # 164.288% заблокированного урона не силовой
BlockWeapon(162, BlockPerkMult * EnchAlchBlessMult, true) # 82.144% заблокированного урона силовой

# 53 = +- броня сыромятного щита
BlockShield(53, BlockPerkMult * EnchAlchBlessMult) # 168.48000000000002% заблокированного урона не силовой
BlockShield(53, BlockPerkMult * EnchAlchBlessMult, true) # 84.24000000000001% заблокированного урона силовой