Scriptname MRL_DisableSneak extends ActiveMagicEffect

Idle Property SneakStop Auto

Event OnEffectStart(Actor akTarget, Actor akCaster) 
    RegisterForSingleUpdate(2.5)
EndEvent

Event OnUpdate()
    actor target = GetTargetActor()
    if target.IsSneaking() && target.IsInCombat()
        while target.GetAnimationVariableBool("IsAttacking")
            Utility.WaitMenuMode(0.2)
        endWhile
        target.PlayIdle(SneakStop)
    endif
EndEvent