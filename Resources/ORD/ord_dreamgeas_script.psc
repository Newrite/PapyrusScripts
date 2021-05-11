Scriptname ORD_DreamGeas_Script extends activemagiceffect  

; -----

Quest Property ORD_DreamGeas_Quest Auto
Float Property ORD_WaitBeforeRestart Auto
Float Property ORD_WaitBeforeCheck Auto
Message Property ORD_Ill_DreamGeas_Message_Fail Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_DreamGeas_Quest.IsRunning()
		ORD_DreamGeas_Quest.Stop()
	EndIf

	Utility.Wait(ORD_WaitBeforeRestart)
	ORD_DreamGeas_Quest.Start()

	Utility.Wait(ORD_WaitBeforeCheck)
	If !ORD_DreamGeas_Quest.IsRunning()
		ORD_Ill_DreamGeas_Message_Fail.Show()
	EndIf
	Dispel()

EndEvent

; -----