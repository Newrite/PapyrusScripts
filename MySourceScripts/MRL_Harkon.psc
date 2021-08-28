Scriptname MRL_Harkon extends ActiveMagicEffect

Spell Property SpellHarkon Auto

;------
;ПЕРЕМЕННЫЕ
;------


Actor Target
ObjectReference TargetRef

;------
;ЭВЕНТЫ
;------


Event OnEffectStart(Actor akTarget, Actor akCaster)

	Target = akTarget
	TargetRef = akTarget as ObjectReference

    RegisterForAnimationEvent(TargetRef, "WeaponSwing")
	RegisterForAnimationEvent(TargetRef, "WeaponLeftSwing")

EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

    if asEventName == "WeaponSwing" || asEventName == "WeaponLeftSwing"

        SpellHarkon.Cast(Target)
        return

    endif

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

    UnregisterForAnimationEvent(TargetRef, "WeaponSwing")
	UnregisterForAnimationEvent(TargetRef, "WeaponLeftSwing")
    
EndEvent
