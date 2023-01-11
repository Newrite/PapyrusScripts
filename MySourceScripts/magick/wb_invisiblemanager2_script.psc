Scriptname WB_InvisibleManager2_Script extends activemagiceffect  

; -----

FormList Property WB_AlterationMetamagic_SpellTwine_FormList Auto
FormList[] Property WB_AlterationMetamagic_SpellTwine_FormList_X Auto

; -----

Event OnSpellCast(Form akSpell)

	Int i = WB_AlterationMetamagic_SpellTwine_FormList.Find(akSpell)
	If i >= 0
		(WB_AlterationMetamagic_SpellTwine_FormList_X[i].GetAt(0) as Spell).Cast(GetTargetActor())
	EndIf

EndEvent

; -----