Scriptname ORD_LambToTheSlaughter_Script extends activemagiceffect  

; -----

Quest Property ORD_LambToTheSlaughter_Quest Auto
Float Property ORD_Delay Auto
Float Property ORD_XPPerHealthMult Auto
Idle Property ORD_EndIdle Auto
Float Property ORD_EndPush Auto
Float Property ORD_XPCapHealth Auto

; -----

Float InitialHealth

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_LambToTheSlaughter_Quest.IsRunning()
		ORD_LambToTheSlaughter_Quest.Stop()
	EndIf
	InitialHealth = akTarget.GetActorValue("Health")
	RegisterForSingleUpdate(ORD_Delay)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.SetRestrained(false)
	If ORD_LambToTheSlaughter_Quest.IsRunning()
		ORD_LambToTheSlaughter_Quest.Stop()
	EndIf
	Float NewHealth = akTarget.GetActorValue("Health")
	If NewHealth < InitialHealth
		If (InitialHealth - NewHealth) > ORD_XPCapHealth
			Game.AdvanceSkill("Illusion", ORD_XPCapHealth * ORD_XPPerHealthMult)
		Else
			Game.AdvanceSkill("Illusion", (InitialHealth - NewHealth) * ORD_XPPerHealthMult)
		EndIf
	EndIf
	If ORD_EndIdle
		akTarget.PlayIdle(ORD_EndIdle)
	EndIf
	If ORD_EndPush
		akCaster.PushActorAway(akTarget, ORD_EndPush)
	EndIf


EndEvent

; -----

Event OnUpdate()

	ORD_LambToTheSlaughter_Quest.Start()
	GetTargetActor().SetRestrained(true)

EndEvent

; -----