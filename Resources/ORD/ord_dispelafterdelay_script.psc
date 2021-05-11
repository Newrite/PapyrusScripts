Scriptname ORD_DispelAfterDelay_Script extends activemagiceffect  

; -----

Float Property ORD_DelayUntilDispel Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_DelayUntilDispel)

EndEvent

; -----

Event OnUpdate()

	Dispel()

EndEvent

; -----