Scriptname ORD_BackupPlan_Script extends activemagiceffect  

; -----

Spell Property ORD_Sne_BackupPlan_Spell_TripwireProc Auto
Float Property ORD_OutOfCombatDuration Auto

; -----

Bool CanDoTripwire

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	CanDoTripwire = false
	RegisterforSingleUpdate(ORD_OutOfCombatDuration)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If CanDoTripwire
		ORD_Sne_BackupPlan_Spell_TripwireProc.Cast(akTarget)
	EndIf

EndEvent

; -----

Event OnUpdate()

	CanDoTripwire = true

EndEvent

; -----