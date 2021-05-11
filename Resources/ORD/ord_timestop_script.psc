Scriptname ORD_TimeStop_Script extends activemagiceffect  


; -----

Float Property ORD_UpdateRate Auto
GlobalVariable Property ORD_Enc_TimeStandsStill_Global_Time Auto
GlobalVariable Property GameHour Auto
Message Property ORD_Enc_TimeStandsStill_Message Auto
GlobalVariable Property ORD_Enc_TimeStandsStill_Global_Ticks Auto

; -----

Int TickCount = 0

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float CurrentGameHour = GameHour.GetValue()
	If (CurrentGameHour < (ORD_Enc_TimeStandsStill_Global_Time.GetValue() + 0.25) || (CurrentGameHour < 0.25 && CurrentGameHour + 24 < (ORD_Enc_TimeStandsStill_Global_Time.GetValue() + 0.25)))
		; less than 15 minutes after the stopped time
		ORD_Enc_TimeStandsStill_Message.Show()
		RegisterForUpdate(ORD_UpdateRate)
	EndIf

EndEvent

; -----

Event OnUpdate()

	If TickCount < ORD_Enc_TimeStandsStill_Global_Ticks.GetValue()
		GameHour.SetValue(ORD_Enc_TimeStandsStill_Global_Time.GetValue())
		TickCount += 1
	Else
		UnregisterForUpdate()
	EndIf

EndEvent

; -----