Scriptname ORD_QuestRunnerRobbers_Script extends activemagiceffect  

; -----

Quest Property ORD_Quest Auto
ReferenceAlias Property ORD_QuestTarget Auto

Message Property ORD_Message Auto
Message Property ORD_Message_Fail Auto
Float Property ORD_DelayUntilCheck Auto

VisualEffect Property ORD_VFX Auto

GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property ORD_Global_NextActivate Auto
Float Property ORD_DayMultLockoutMin Auto
Float Property ORD_DayMultLockoutMax Auto

; -----

ObjectReference MarkedObject

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float DaysPassed = GameDaysPassed.GetValue()
	If ORD_Global_NextActivate.GetValue() < DaysPassed
		ORD_Quest.Start()
		Utility.Wait(ORD_DelayUntilCheck)
		If !ORD_Quest.IsRunning()
			; quest did not find a target, abandon ship
			If ORD_Message_Fail
				ORD_Message_Fail.Show()
			EndIf
			Dispel()
		Else
			; display visuals
			ORD_Message.Show()
			MarkedObject = ORD_QuestTarget.GetRef()
			ORD_VFX.Play(MarkedObject)

			; advance deadline
			Float DayMultLockout = Utility.RandomFloat(ORD_DayMultLockoutMin, ORD_DayMultLockoutMax)
			ORD_Global_NextActivate.SetValue(DaysPassed + DayMultLockout)

		EndIf
	Else
		; could start quest, but it will not happen because the deadline is not yet met
		Dispel()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Quest.Stop()
	ORD_VFX.Stop(MarkedObject)

EndEvent

; -----