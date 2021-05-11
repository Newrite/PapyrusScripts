Scriptname ORD_Stormblast_Script extends activemagiceffect  

; -----

Float Property ORD_UpdateRateMin Auto
Float Property ORD_UpdateRateMax Auto
GlobalVariable Property ORD_Des_Stormblast_Global_Trigger Auto
Message Property ORD_Des_Stormblast_Message Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(Utility.RandomFloat(ORD_UpdateRateMin, ORD_UpdateRateMax))

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(0.5)	;race condition
	ORD_Des_Stormblast_Global_Trigger.SetValue(0)

EndEvent

; -----

Event OnUpdate()

	If ORD_Des_Stormblast_Global_Trigger.GetValue() == 0
		ORD_Des_Stormblast_Global_Trigger.SetValue(1)
		ORD_Des_Stormblast_Message.Show()
	EndIf
	RegisterForSingleUpdate(Utility.RandomFloat(ORD_UpdateRateMin, ORD_UpdateRateMax))

EndEvent

; -----