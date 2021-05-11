Scriptname ORD_Ultraviolence_Script extends activemagiceffect  

; -----

Spell Property ORD_Two_Ultraviolence_Spell_Proc Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akCaster.DamageAV("Stamina",100)
	ORD_Two_Ultraviolence_Spell_Proc.Cast(akCaster)

EndEvent

; -----