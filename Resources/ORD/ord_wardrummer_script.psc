Scriptname ORD_WarDrummer_Script extends activemagiceffect  

; -----

Float Property ORD_Max Auto
Float Property ORD_DelayUntilDispel Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_DelayUntilDispel)
	akTarget.RestoreActorValue("Health", (1 - akTarget.GetActorValuePercentage("Health")) * ORD_Max)

EndEvent

; -----

Event OnUpdate()

	Dispel()

EndEvent

; -----