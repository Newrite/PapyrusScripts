Scriptname ORD_GreasedLightning_Script extends activemagiceffect  


; -----

Float Property ORD_Delay Auto
Hazard Property ORD_Sne_GreasedLightning_Hazard Auto
Int Property ORD_OilCount Auto
Actor Property PlayerRef Auto

; -----

Int OilCount = 0

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForUpdate(ORD_Delay)

EndEvent

; -----

Event OnUpdate()

	PlayerRef.PlaceAtMe(ORD_Sne_GreasedLightning_Hazard).SetActorCause(PlayerRef)
	OilCount += 1
	If OilCount >= ORD_OilCount
		Dispel()
	EndIf

EndEvent

; -----