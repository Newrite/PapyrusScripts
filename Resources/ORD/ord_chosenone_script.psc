Scriptname ORD_ChosenOne_Script extends activemagiceffect  

; -----

Message Property ORD_Alt_ChosenOne_Message Auto
GlobalVariable Property ORD_Alt_InnateMagic_Global_Count_Cap Auto
GlobalVariable Property ORD_Alt_InnateMagic_Global_Count_CapBase Auto
GlobalVariable Property ORD_Alt_InnateMagic_Global_Count_CapChosenOne Auto
GlobalVariable Property ORD_Alt_ChosenOne_Global_Choice auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Int Choice = ORD_Alt_ChosenOne_Message.Show()
	If Choice == 0
		ORD_Alt_InnateMagic_Global_Count_Cap.SetValue(ORD_Alt_InnateMagic_Global_Count_CapChosenOne.GetValue())
	Else
		ORD_Alt_ChosenOne_Global_Choice.SetValue(Choice)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Alt_InnateMagic_Global_Count_Cap.SetValue(ORD_Alt_InnateMagic_Global_Count_CapBase.GetValue())
	ORD_Alt_ChosenOne_Global_Choice.SetValue(-1)

EndEvent

; -----