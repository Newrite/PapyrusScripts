Scriptname ORD_SealedDoom_Conditions_Script extends activemagiceffect  

; -----

Spell Property ORD_Spell Auto
GlobalVariable Property ORD_Global Auto
Float Property ORD_Value Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Spell.Cast(akTarget)
	ORD_Global.SetValue(ORD_Value)

EndEvent

; -----