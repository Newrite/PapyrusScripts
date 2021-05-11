Scriptname ORD_Spe_SpeakWithAnimals_Script extends activemagiceffect  

; -----

Quest Property ORD_SpeakWithAnimals_Quest Auto
Float Property ORD_WaitBeforeRestart Auto
Float Property ORD_WaitBeforeCheck Auto
Message Property ORD_Spe_SpeakWithAnimals_Message_Fail Auto
Float Property ORD_XPMult Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_SpeakWithAnimals_Quest.IsRunning()
		ORD_SpeakWithAnimals_Quest.Stop()
	EndIf

	Utility.Wait(ORD_WaitBeforeRestart)
	ORD_SpeakWithAnimals_Quest.Start()

	Utility.Wait(ORD_WaitBeforeCheck)
	If !ORD_SpeakWithAnimals_Quest.IsRunning()
		ORD_Spe_SpeakWithAnimals_Message_Fail.Show()
	Else
		Game.AdvanceSkill("Speechcraft", ORD_XPMult * akTarget.GetAV("Health"))
	EndIf
	Dispel()

EndEvent

; -----