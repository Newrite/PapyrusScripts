Scriptname ORD_InnateMagicFixer_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Alt_InnateMagic_Global_Fixed Auto
GlobalVariable Property ORD_Alt_InnateMagic_Global_Count_Cap Auto
GlobalVariable Property ORD_Alt_InnateMagic_Global_Count_Current Auto
GlobalVariable Property ORD_Alt_ChosenOne_Global_Choice auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(1.0)
	Debug.Notification("HELP")
	If ORD_Alt_InnateMagic_Global_Fixed.GetValue() == 0
		If ORD_Alt_InnateMagic_Global_Count_Cap.GetValue() == 7
			ORD_Alt_InnateMagic_Global_Count_Cap.SetValue(5)
		Else
			ORD_Alt_InnateMagic_Global_Count_Cap.SetValue(3)
		EndIf
		If ORD_Alt_InnateMagic_Global_Count_Current.GetValue() > ORD_Alt_InnateMagic_Global_Count_Cap.GetValue()
			ORD_Alt_InnateMagic_Global_Count_Current.SetValue(ORD_Alt_InnateMagic_Global_Count_Cap.GetValue())
		EndIf
		ORD_Alt_InnateMagic_Global_Fixed.SetValue(1)
	EndIf

EndEvent

; -----
