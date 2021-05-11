Scriptname ORD_HoldPosition_Script extends activemagiceffect  

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.KeepOffsetFromActor(akCaster, 72, 0, 0, 0, 0, 90, 48, 32)

EndEvent

; -----