Scriptname ORD_HornOfSovngarde_Script extends activemagiceffect  

; -----

Quest Property ORD_Performer_Quest_HornOfSovngarde Auto
Message Property ORD_Spe_Perform_Message_HornOfSovngarde_Fail Auto
Float Property ORD_DelayUntilCheck Auto
Spell Property ORD_Spe_HornOfSovngarde_Spell_Stop Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Performer_Quest_HornOfSovngarde.Start()
	Utility.Wait(ORD_DelayUntilCheck)
	If !ORD_Performer_Quest_HornOfSovngarde.IsRunning()
		ORD_Spe_Perform_Message_HornOfSovngarde_Fail.Show()
	Else
		akTarget.AddSpell(ORD_Spe_HornOfSovngarde_Spell_Stop, false)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Performer_Quest_HornOfSovngarde.Stop()
	akTarget.RemoveSpell(ORD_Spe_HornOfSovngarde_Spell_Stop)

EndEvent

; -----