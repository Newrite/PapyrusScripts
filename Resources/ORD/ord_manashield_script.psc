Scriptname ORD_ManaShield_Script extends activemagiceffect  

; -----

Float Property ORD_UpdateRate Auto
Actor Property PlayerRef Auto
String Property ORD_StatToDrain Auto
Float Property ORD_DrainMult Auto
Float Property ORD_CutoffPoint Auto

; -----

Float LastHealth
Float CurrentHealth

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	LastHealth = PlayerRef.GetActorValue("Health")
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	CurrentHealth = PlayerRef.GetActorValue("Health")
	If CurrentHealth < LastHealth
		PlayerRef.DamageActorValue(ORD_StatToDrain, (LastHealth - CurrentHealth) * ORD_DrainMult)
	EndIf
	LastHealth = CurrentHealth
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----