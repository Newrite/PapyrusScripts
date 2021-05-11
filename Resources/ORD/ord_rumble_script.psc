Scriptname ORD_Rumble_Script extends activemagiceffect  

; -----

Float Property ORD_Dur Auto
Float Property ORD_Str Auto
Float Property ORD_Falloff Auto
ImagespaceModifier Property ORD_Imod Auto
Sound Property ORD_Sound Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_Dur
		akTarget.RampRumble(ORD_Dur, ORD_Str, ORD_Falloff)
	EndIf
	If ORD_Imod
		ORD_Imod.Apply()
	EndIf
	If ORD_Sound
		ORD_Sound.Play(akTarget)
	EndIf

EndEvent

; -----