Scriptname MRL_EnchUpdateGlobals extends ActiveMagicEffect
{Обновляет глобальные переменне раз в 5 секунд, нужно для рассчета шанса крита игрока, обновляет также глобалки которые отвечают за описание.}

GlobalVariable Property gCritChance Auto
GlobalVariable Property gCritMult Auto
GlobalVariable Property gEnchDamage Auto
GlobalVariable Property gEnchDamageCritChance Auto

bool _register = false
actor caster
string sCritChance = "TwoHandedSkillAdvance"
string sCritMult = "OneHandedSkillAdvance"
string sEnchDamage = "DestructionSkillAdvance"
string sEnchDamageCritChance = "ConjurationSkillAdvance"

int[] Function getStats()
    int[] stats = new int[3]
    stats[0] = caster.GetActorValue(sCritChance) as Int
    stats[1] = caster.GetActorValue(sCritMult) as Int
    stats[2] = caster.GetActorValue(sEnchDamage) as Int
    stats[3] = caster.GetActorValue(sEnchDamageCritChance) as Int
    return stats
EndFunction

;/
    stats[0] - Шанс крита
    stats[1] - Мультипликатор крита
    stats[2] - Мультипликатор эффективности чар на оружии (не относится к криту stats[3] - Шанс критической эффективности чар на оружии (по-умолчанию 1.5х)
/;

Function setGlobals(int[] stats)
    if stats[0] < 100
        gCritChance.SetValueInt(stats[0])
    else
        gCritChance.SetValueInt(100)
    endIf
    if stats[1] < 200
        gCritChance.SetValueInt(stats[1])
    else
        gCritChance.SetValueInt(200)
    endIf
    if stats[2] < 200
        gCritChance.SetValueInt(stats[2])
    else
        gCritChance.SetValueInt(200)
    endIf
    if stats[3] < 100
        gCritChance.SetValueInt(stats[3])
    else
        gCritChance.SetValueInt(100)
    endIf
EndFunction

Function updateGlobals()
    setGlobals(getStats())
EndFunction

Event OnEffectStart(Actor akCaster, Actor akTarget)
    _register = true
    caster = akTarget
    RegisterForSingleUpdate(5.0)
endEvent

Event OnUpdate()
    if !_register
        UnregisterForUpdate()
        return
    else
        updateGlobals()
    endIf
    RegisterForSingleUpdate(5.0)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	_register = false
endEvent