Scriptname WB_OcatosRecital_Ab_Script extends activemagiceffect  

; -----

FormList Property WB_AlterationMetamagic_OcatosRecital_FormList Auto

; -----

Spell TheSpell
Int i

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	i = 0
	While i < WB_AlterationMetamagic_OcatosRecital_FormList.GetSize()
		TheSpell = WB_AlterationMetamagic_OcatosRecital_FormList.GetAt(i) as Spell
		TheSpell.Cast(akTarget)
		i += 1
	EndWhile

EndEvent

; -----