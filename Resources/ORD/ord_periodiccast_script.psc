Scriptname ORD_PeriodicCast_Script extends activemagiceffect  


; -----

Spell Property ORD_SpellToCast Auto
Float Property ORD_UpdateRate Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	ORD_SpellToCast.Cast(GetTargetActor())
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----