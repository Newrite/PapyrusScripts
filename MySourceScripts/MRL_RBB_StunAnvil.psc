Scriptname MRL_RBB_StunAnvil extends ActiveMagicEffect
{Меняет значения переменных блока и возврвщает их обратно.}

GlobalVariable Property Counter Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Counter.SetValueInt(0)
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
    Debug.Notification("Наковальня Стуна закончила своё действие")
EndEvent