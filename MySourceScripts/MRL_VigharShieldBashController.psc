Scriptname MRL_VigharShieldBashController extends ActiveMagicEffect

Spell Property AbsorbSpell Auto

Float Property DamageAmount Auto

String Property ActorValueToDamage Auto

Actor Target
ObjectReference TargetRef

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if asEventName == "bashRelease"
        if Target.GetActorValue(ActorValueToDamage) as Float >= DamageAmount
            AbsorbSpell.Cast(Target)
            Target.ModActorValue(ActorValueToDamage, -DamageAmount)
        endif
    endif
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Target = akTarget
    TargetRef = akTarget as ObjectReference
    RegisterForAnimationEvent(TargetRef, "bashRelease")
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    UnregisterForAnimationEvent(TargetRef, "bashRelease")
EndEvent