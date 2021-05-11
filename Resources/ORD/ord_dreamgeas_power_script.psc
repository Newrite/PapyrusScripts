Scriptname ORD_DreamGeas_Power_Script extends activemagiceffect  

; -----

Quest Property ORD_DreamGeas_Quest Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_DreamGeas_Quest.IsRunning()
		ORD_DreamGeas_Quest.Stop()
	EndIf

EndEvent

; -----