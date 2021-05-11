Scriptname ORD_QuestRunnerThief_Script extends activemagiceffect  

; -----

Keyword Property ORD_Pic_ThiefsEye_Keyword_Debuff Auto

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

Float Property ORD_UpdateRate Auto
Spell Property ORD_Pic_ThiefsEye_Spell_Debuff Auto
Message Property ORD_Pic_ThiefsEye_Message_Disappeared Auto

GlobalVariable Property ORD_Pic_ThiefsEye_Global_DisableHasEffect Auto

Actor Property PlayerRef Auto

; -----

Actor MarkedTarget

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
			Debug.Trace("ORDINATOR DEBUG: Thief's Eye found no valid target", 0)
		Else
			; display visuals
			ORD_Message.Show()
			MarkedTarget = ORD_QuestTarget.GetActorRef()
			ORD_VFX.Play(MarkedTarget)
			Debug.Trace("ORDINATOR DEBUG: Thief's Eye target set to " + MarkedTarget, 0)

			; advance deadline
			Float DayMultLockout = Utility.RandomFloat(ORD_DayMultLockoutMin, ORD_DayMultLockoutMax)
			ORD_Global_NextActivate.SetValue(DaysPassed + DayMultLockout)

			; register for ping
			RegisterForSingleUpdate(ORD_UpdateRate)
		EndIf
	Else
		; could start quest, but it will not happen because the deadline is not yet met
		Dispel()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Quest.Stop()
	ORD_VFX.Stop(MarkedTarget)
	Debug.Trace("ORDINATOR DEBUG: Thief's Eye ended or has been dispelled from target " + MarkedTarget, 0)

EndEvent

; -----

Event OnUpdate()

	If (!MarkedTarget.HasEffectKeyword(ORD_Pic_ThiefsEye_Keyword_Debuff) || ORD_Pic_ThiefsEye_Global_DisableHasEffect.GetValue() == 1) || MarkedTarget.IsInInterior()
		ORD_Pic_ThiefsEye_Message_Disappeared.Show()
		If !MarkedTarget.HasEffectKeyword(ORD_Pic_ThiefsEye_Keyword_Debuff)
			Debug.Trace("ORDINATOR DEBUG: Thief's Eye target " + MarkedTarget + " lost magic effect with keyword " + ORD_Pic_ThiefsEye_Keyword_Debuff + ", terminating quest runner", 0)
		ElseIf MarkedTarget.IsInInterior()
			Debug.Trace("ORDINATOR DEBUG:Thief's Eye target " + MarkedTarget + " went inside, terminating quest runner", 0)
		Else
			Debug.Trace("ORDINATOR DEBUG: Thief's Eye player has been arrested, terminating quest runner", 0)
		EndIf
		Dispel()
	Else
		RegisterForSingleUpdate(ORD_UpdateRate)
	EndIf

EndEvent

; -----