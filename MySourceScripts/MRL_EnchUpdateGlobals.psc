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

float[] Function getStats()
    float[] stats = new float[4]
    stats[0] = caster.GetActorValue(sCritChance) as float
    stats[1] = caster.GetActorValue(sCritMult) as float
    stats[2] = caster.GetActorValue(sEnchDamage) as float
    stats[3] = caster.GetActorValue(sEnchDamageCritChance) as float
    ;Debug.Notification("Return Get Stats: " + stats)
    return stats
EndFunction

;/
    stats[0] - Шанс крита
    stats[1] - Мультипликатор крита
    stats[2] - Мультипликатор эффективности чар на оружии (не относится к криту
    stats[3] - Шанс критической эффективности чар на оружии (по-умолчанию 1.5х)
/;

Function setGlobals(float[] stats)
    ;Debug.Notification("Set Globals: " + stats)
    if stats[0] < 100.0
        gCritChance.SetValue(stats[0])
    else
        gCritChance.SetValue(100.0)
    endIf
    if stats[1] < 200.0
        gCritMult.SetValue(stats[1])
    else
        gCritMult.SetValue(200.0)
    endIf
    if stats[2] < 200.0
        gEnchDamage.SetValue(stats[2])
    else
        gEnchDamage.SetValue(200.0)
    endIf
    if stats[3] < 100.0
        gEnchDamageCritChance.SetValue(stats[3])
    else
        gEnchDamageCritChance.SetValue(100.0)
    endIf
EndFunction

Function updateGlobals()
    ;Debug.Notification("Update Globals")
    setGlobals(getStats())
EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
    _register = true
    caster = akTarget
    RegisterForSingleUpdate(5.0)
endEvent

Event OnUpdate()
    ;Debug.Notification("On Update: " + _register)
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