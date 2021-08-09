GLOBALMULT = 1.0
GLOBALWEIGHTMULT = 1.5
POWERMOD = 2.0
POWERVALUE = 00.0

function GetWeightInfluence(Weight)
    return Weight * GLOBALWEIGHTMULT
end

function GetPowerAttackMult(PowerAttack)
    if PowerAttack
        if POWERVALUE >= 100.0
            return 0.0
        end
        return POWERMOD * (1.0 - (POWERVALUE / 100.0))
    end
    return 0.0
end

function GetDrainValue(Weight, PowerAttackMult, infamy)
    if infamy > 1.0
        return ((Weight / 1.5 * infamy) + ((Weight / 1.5 * infamy) * PowerAttackMult)) * GLOBALMULT
    else
        return ((Weight / 1.5)  + ((Weight / 1.5) * PowerAttackMult)) * GLOBALMULT
    end
end

function CalcResource(Weight, PowerAttack, infamy)
    WeightValue = GetWeightInfluence(Weight)
    PowerAttackInf = GetPowerAttackMult(PowerAttack)
    return GetDrainValue(WeightValue, PowerAttackInf, infamy)
end