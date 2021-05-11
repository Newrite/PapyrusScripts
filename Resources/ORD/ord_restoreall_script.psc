Scriptname ORD_RestoreAll_Script extends activemagiceffect  

; -----

Float Property ORD_Amount Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.RestoreActorValue("Health", ORD_Amount)
	akTarget.RestoreActorValue("Magicka", ORD_Amount)
	akTarget.RestoreActorValue("Stamina", ORD_Amount)

EndEvent

; -----