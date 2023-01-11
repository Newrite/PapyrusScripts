Scriptname MRL_RBB_StunAnvil extends ActiveMagicEffect

GlobalVariable Property Counter Auto
Spell Property StopTime Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Counter.SetValueInt(0)
    StopTime.Cast(akCaster, akTarget)
    Debug.SendAnimationEvent(akTarget, "blockStop")
    Utility.WaitMenuMode(0.75)
    akTarget.SetAnimationVariableInt("iWantBlock", 1)
    akTarget.SetAnimationVariableBool("IsBlocking", true)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    Counter.SetValueInt(0)
    Debug.SendAnimationEvent(akTarget, "blockStop")
    akTarget.SetAnimationVariableInt("iWantBlock", 0)
    akTarget.SetAnimationVariableBool("IsBlocking", false)
    StopTime.Cast(akCaster, akTarget)
    Debug.Notification("Наковальня стуна закончила своё действие.")
EndEvent