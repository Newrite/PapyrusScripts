#Enchantment
const ENCH_MULT = 1.15 * 1.50 * 1.25 * 1.15

function getEnchPower(baseValue, perkMult = 1.0)
    return baseValue * ENCH_MULT * perkMult
end

function damageWithRequiemTier(damage, tier, resistPerArmor, armor)
    return damage * (((armor * resistPerArmor) / 100) + tier)
end