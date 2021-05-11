Scriptname ORD_TimeStandsStill_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Enc_TimeStandsStill_Global_Time Auto
GlobalVariable Property GameHour Auto
GlobalVariable Property ORD_Enc_TimeStandsStill_Global_Time_RemoveAb Auto
Message Property ORD_Enc_TimeStandsStill_Message_Duration Auto
GlobalVariable Property ORD_Enc_TimeStandsStill_Global_Ticks Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Enc_TimeStandsStill_Global_Time.SetValue(GameHour.GetValue())
	ORD_Enc_TimeStandsStill_Global_Time_RemoveAb.SetValue(GameHour.GetValue() + 1)
	If ORD_Enc_TimeStandsStill_Global_Time_RemoveAb.GetValue() > 24
		ORD_Enc_TimeStandsStill_Global_Time_RemoveAb.Mod(-24)
	EndIf
	If ORD_Enc_TimeStandsStill_Global_Time.GetValue() > 23.9
		ORD_Enc_TimeStandsStill_Global_Time.SetValue(23.9)	; prevents continuous overflows
	EndIf
	Int DurationDesired = ORD_Enc_TimeStandsStill_Message_Duration.Show()
	If DurationDesired == 0
		ORD_Enc_TimeStandsStill_Global_Ticks.SetValue(60)
		; 3 minutes
	ElseIf DurationDesired == 1
		ORD_Enc_TimeStandsStill_Global_Ticks.SetValue(120)
		; 6 minutes
	ElseIf DurationDesired == 2
		ORD_Enc_TimeStandsStill_Global_Ticks.SetValue(240)
		; 12 minutes
	ElseIf DurationDesired == 3
		ORD_Enc_TimeStandsStill_Global_Ticks.SetValue(480)
		; 24 minutes
	ElseIf DurationDesired == 4
		ORD_Enc_TimeStandsStill_Global_Ticks.SetValue(940)
		; 48 minutes
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Enc_TimeStandsStill_Global_Time.SetValue(-1)
	ORD_Enc_TimeStandsStill_Global_Time_RemoveAb.SetValue(-1)
	ORD_Enc_TimeStandsStill_Global_Ticks.SetValue(-1)

EndEvent

; -----