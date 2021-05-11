Scriptname ORD_Wolfkin_Proc_NoPower extends activemagiceffect  

; -----

GlobalVariable Property ORD_Two_Wolfkin_Global_Count Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Two_Wolfkin_Global_Count.SetValue(0)

EndEvent

; -----