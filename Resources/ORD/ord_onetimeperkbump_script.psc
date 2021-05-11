Scriptname ORD_OneTimePerkBump_Script extends activemagiceffect  

; -----

Int Property ORD_Points Auto
GlobalVariable Property ORD_Activated Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_Activated.GetValue() == 0
		Game.AddPerkPoints(ORD_Points)
		ORD_Activated.SetValue(1)
	EndIf

EndEvent

; -----