Scriptname ORD_GameOfFate_Script extends activemagiceffect  

; -----

Quest Property ORD_GameOfFate_Quest Auto
GlobalVariable Property ORD_Loc_GameOfFate_Global_Count Auto

; -----

ObjectReference MarkedTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	OnUpdate()

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_GameOfFate_Quest.Stop()
	ORD_Loc_GameOfFate_Global_Count.SetValue(0)

EndEvent

; -----

Event OnUpdate()

	If !ORD_GameOfFate_Quest.IsRunning()
		ORD_GameOfFate_Quest.Start()
		RegisterForSingleUpdate(5.0)
	EndIf

EndEvent

; -----