Scriptname ORD_Wolfkin_Proc_Power extends activemagiceffect  

; -----

GlobalVariable Property ORD_Two_Wolfkin_Global_Count Auto
Message Property ORD_Two_Wolfkin_Message Auto
GlobalVariable Property ORD_Two_Wolfkin_Global_Count_Cutoff Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Two_Wolfkin_Global_Count.Mod(1)
	If ORD_Two_Wolfkin_Global_Count.GetValue() == ORD_Two_Wolfkin_Global_Count_Cutoff.GetValue()
		ORD_Two_Wolfkin_Message.Show()
	EndIf

EndEvent

; -----