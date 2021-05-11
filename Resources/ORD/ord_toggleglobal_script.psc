Scriptname ORD_ToggleGlobal_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Global Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Global.SetValue(1)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Global.SetValue(0)

EndEvent

; -----