Scriptname ORD_CarryWeight_Script extends activemagiceffect  

; -----

Float Property ORD_CarryWeight Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	akTarget.ModActorValue("CarryWeight",ORD_CarryWeight)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.ModActorValue("CarryWeight",-ORD_CarryWeight)

EndEvent

; -----