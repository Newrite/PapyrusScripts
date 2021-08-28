GLOBALMULT = 1.0
GLOBALWEIGHTMULT = 1.25
POWERMOD = 2.0
POWERVALUE = 0.0

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

function Delta(Weight, Flat)
    return Flat * (1 - (Weight * 2.0 / 100.0))
end

function GetDrainValue(Weight, PowerAttackMult, infamy)
    if PowerAttackMult > 0.0
        if infamy > 1.0
            return ((Weight * infamy) + (Weight * infamy * PowerAttackMult) + Delta(Weight, 10.0)) * GLOBALMULT
        else
            return (Weight  + (Weight  * PowerAttackMult) + Delta(Weight, 10.0)) * GLOBALMULT
        end
    else
        if infamy > 1.0
            return ((Weight * infamy) + Delta(Weight, 5.0)) * GLOBALMULT
        else
            return (Weight + Delta(Weight, 5.0)) * GLOBALMULT
        end
    end
end

function CalcResource(Weight, PowerAttack, infamy)
    WeightValue = GetWeightInfluence(Weight)
    PowerAttackInf = GetPowerAttackMult(PowerAttack)
    return GetDrainValue(WeightValue / 2.0, PowerAttackInf, infamy)
end