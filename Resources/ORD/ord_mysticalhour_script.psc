Scriptname ORD_MysticalHour_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Alt_MysticaHour_Global_Start Auto
GlobalVariable Property ORD_Alt_MysticaHour_Global_End Auto
GlobalVariable Property ORD_Alt_MysticaHour_Global_EndD Auto
Message Property ORD_Alt_MysticalHour_Message Auto
GlobalVariable Property GameHour Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Int StartHour = Math.Floor(GameHour.GetValue())
	ORD_Alt_MysticaHour_Global_Start.SetValue(StartHour)
	ORD_Alt_MysticaHour_Global_End.SetValue(StartHour + 1)
	If StartHour == 23
		ORD_Alt_MysticaHour_Global_EndD.SetValue(0)
	Else
		ORD_Alt_MysticaHour_Global_EndD.SetValue(StartHour + 1)
	EndIf
	ORD_Alt_MysticalHour_Message.Show(ORD_Alt_MysticaHour_Global_Start.GetValue(),ORD_Alt_MysticaHour_Global_EndD.GetValue())

EndEvent

; -----