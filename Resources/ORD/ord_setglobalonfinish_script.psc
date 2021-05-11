Scriptname ORD_SetGlobalOnFinish_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Global Auto
Float Property ORD_Value Auto

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Global.SetValue(ORD_Value)

EndEvent

; -----