Scriptname ORD_SMASH_Script extends activemagiceffect  

; -----

ImagespaceModifier Property ORD_Two_BruteForce_Imod Auto
Float Property ORD_ShakeForce Auto
Float Property ORD_ShakeDur Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If PlayerRef == NONE
		ORD_Two_BruteForce_Imod.Apply()
	ElseIf akTarget.GetDistance(PlayerRef) < 512
		ORD_Two_BruteForce_Imod.Apply()
	EndIf
	akTarget.RampRumble(ORD_ShakeForce / 4, ORD_ShakeDur / 2)

EndEvent

; -----