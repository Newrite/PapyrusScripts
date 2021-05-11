Scriptname ORD_Evangelist_Hit_Script extends activemagiceffect  

; -----

FormList Property ORD_Res_Evangelist_FormList Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Spell SpellToCast = ORD_Res_Evangelist_FormList.GetAt(0) as Spell
	SpellToCast.Cast(akTarget)

EndEvent

; -----