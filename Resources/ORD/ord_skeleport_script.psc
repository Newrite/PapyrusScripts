Scriptname ORD_Skeleport_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
GlobalVariable Property ORD_Exclusion Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_Exclusion == NONE || ORD_Exclusion.GetValue() == 0
		akTarget.MoveTo(PlayerRef)
	EndIf

EndEvent

; -----

