Scriptname ORD_One_LimitBreak_Charging_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_One_LimitBreak_Global_Count Auto
GlobalVariable Property ORD_One_Eruption_Global_Count_Max Auto
Message Property ORD_One_LimitBreak_Message Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_One_LimitBreak_Global_Count.Mod(1)
	If ORD_One_LimitBreak_Global_Count.GetValue() >= ORD_One_Eruption_Global_Count_Max.GetValue()
		ORD_One_LimitBreak_Message.Show()
	EndIf

EndEvent

; -----