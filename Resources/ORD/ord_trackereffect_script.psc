Scriptname ORD_TrackerEffect_Script extends activemagiceffect  

; -----

Spell Property ORD_Spell_QuestRunner Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Spell_QuestRunner.Cast(akTarget)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.DispelSpell(ORD_Spell_QuestRunner)

EndEvent

; -----