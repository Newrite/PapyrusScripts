Scriptname ORD_StartStopQuest_Script extends activemagiceffect  

; -----

Quest Property ORD_QuestToStart Auto
Float Property ORD_WaitBeforeStart = 0.0 Auto
Sound Property ORD_Marker Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Marker.Play(akTarget)
	If akTarget == Game.GetPlayer()
		If ORD_WaitBeforeStart
			RegisterForSingleUpdate(ORD_WaitBeforeStart)
		Else
			ORD_QuestToStart.Start()
		EndIf
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If akTarget == Game.GetPlayer()
		ORD_QuestToStart.Stop()
	EndIf

EndEvent

; -----

Event OnUpdate()

	ORD_QuestToStart.Start()

EndEvent

; -----