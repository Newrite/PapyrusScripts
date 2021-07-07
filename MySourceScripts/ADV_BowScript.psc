Scriptname ADV_BowScript extends activemagiceffect

Actor Property PlayerRef Auto hidden
Spell Property SpellToCast Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    PlayerRef = akCaster
    RegisterForAnimationEvent(PlayerRef, "arrowRelease")

EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

    If asEventName == "arrowRelease"
        SpellToCast.Cast(PlayerRef as objectreference, none)
    EndIf
EndEvent