Scriptname ORD_MindSpiders_Script extends activemagiceffect  

; -----

Activator Property FXEmptyActivator Auto
Quest Property ORD_MindSpiders_Quest Auto
Float Property ORD_Delay Auto
Float Property ORD_XPPerHealthMult Auto
Float Property ORD_EndPush Auto
Float Property ORD_XPCapHealth Auto
Idle Property ORD_PlayIdle Auto

; -----

Float InitialHealth
ObjectReference TheBox
ObjectReference TheBoxFloor
Actor TargetActor
Bool HasStarted = false
Bool Up = true

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_MindSpiders_Quest.IsRunning()
		ORD_MindSpiders_Quest.Stop()
	EndIf
	InitialHealth = akTarget.GetAV("Health")
	TargetActor = akTarget
	RegisterForSingleUpdate(ORD_Delay)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If ORD_MindSpiders_Quest.IsRunning()
		ORD_MindSpiders_Quest.Stop()
	EndIf
	Float NewHealth = akTarget.GetAV("Health")
	If NewHealth < InitialHealth
		If (InitialHealth - NewHealth) > ORD_XPCapHealth
			Game.AdvanceSkill("Illusion", ORD_XPCapHealth * ORD_XPPerHealthMult)
		Else
			Game.AdvanceSkill("Illusion", (InitialHealth - NewHealth) * ORD_XPPerHealthMult)
		EndIf
	EndIf
	If ORD_EndPush
		akCaster.PushActorAway(akTarget, ORD_EndPush)
	EndIf
	Utility.Wait(0.1)
	akTarget.StopTranslation()
	TheBox.Delete()


EndEvent

; -----

Event OnUpdate()

;	If !HasStarted
;		HasStarted = true
		ORD_MindSpiders_Quest.Start()
;		TheBox = TargetActor.PlaceAtMe(FXEmptyActivator)
;		TheBoxFloor = TargetActor.PlaceAtMe(FXEmptyActivator)
;		TheBox.MoveTo(TargetActor, 0, 0, 64)
;		TheBox.MoveTo(TargetActor, 0, 0, 16)
;		TargetActor.TranslateToRef(TheBox, 5) 
;		RegisterForSingleUpdate(5.0)
;	Else
;		If Up
;			TargetActor.TranslateToRef(TheBoxFloor, 1)
;			Up = false
;		Else
;			TargetActor.TranslateToRef(TheBox, 1)
;			Up = true
;		EndIf
;		RegisterForSingleUpdate(5.0)
;	EndIf

EndEvent

; -----

Event OnDying(Actor akKiller)

	TargetActor.StopTranslation()
	Dispel()

EndEvent

; -----