Scriptname ORD_GrindhouseProc_Script extends activemagiceffect  

; -----

String Property ORD_Stat Auto
Float Property ORD_Goal Auto

; -----

Float TheDifference

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.1)	; prevents a race condition if triggered back to back with fast weapons
	TheDifference = ORD_Goal - akTarget.GetActorValue(ORD_Stat)
	akTarget.ModActorValue(ORD_Stat, TheDifference)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.ModActorValue(ORD_Stat, -TheDifference)

EndEvent

; -----