Scriptname MRL_SneakGougeStrike extends ActiveMagicEffect

function OnEffectStart(actor akTarget, actor akCaster)
    Debug.SendAnimationEvent(akTarget, "StaggerStart")
    Utility.WaitMenuMode(0.5)
    Debug.SendAnimationEvent(akTarget, "StaggerStart")
endFunction

