Scriptname ORD_Afterglow_Script extends activemagiceffect  

; -----

Sound Property ORD_Res_Afterglow_Marker Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Res_Afterglow_Marker.Play(akTarget)

EndEvent

; -----