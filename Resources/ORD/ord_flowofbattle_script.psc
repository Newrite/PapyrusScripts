Scriptname ORD_FlowOfBattle_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Two_TidalRhythm_Global_State Auto
GlobalVariable Property ORD_Two_TidalRhythm_Global_CycleDuration Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Two_TidalRhythm_Global_State.SetValue(0)
	RegisterForSingleUpdate(ORD_Two_TidalRhythm_Global_CycleDuration.GetValue())

EndEvent

; -----

Event OnUpdate()

	ORD_Two_TidalRhythm_Global_State.SetValue((1.0 - ORD_Two_TidalRhythm_Global_State.GetValue()) as Int)
	RegisterForSingleUpdate(ORD_Two_TidalRhythm_Global_CycleDuration.GetValue())

EndEvent

; -----