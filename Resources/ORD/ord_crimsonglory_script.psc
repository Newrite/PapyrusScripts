Scriptname ORD_CrimsonGlory_Script extends activemagiceffect  

; -----

Float Property ORD_Mult Auto
Float Property ORD_Cap Auto
Int Property ORD_Blood Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float DamageDealt = akTarget.GetActorValue("Health") * ORD_Mult
	If DamageDealt > ORD_Cap
		akTarget.DamageActorValue("Health",ORD_Cap)
	Else
		akTarget.DamageActorValue("Health",DamageDealt)
	EndIf
	If ORD_Blood
		Game.TriggerScreenBlood(ORD_Blood)
	EndIf

EndEvent

; -----
