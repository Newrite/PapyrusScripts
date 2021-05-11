Scriptname ORD_ArcaneThesis_New_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Alt_ArcaneThesis_Global_Status Auto
FormList Property ORD_Alt_ArcaneThesis_FormList Auto
Spell Property ORD_Alt_ArcaneThesis_Spell_Power_Learn Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.AddSpell(ORD_Alt_ArcaneThesis_Spell_Power_Learn,false)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.RemoveSpell(ORD_Alt_ArcaneThesis_Spell_Power_Learn)
	ORD_Alt_ArcaneThesis_FormList.Revert()
	ORD_Alt_ArcaneThesis_Global_Status.SetValue(0)

EndEvent

; -----