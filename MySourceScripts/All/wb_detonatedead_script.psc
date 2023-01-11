Scriptname WB_DetonateDead_Script extends activemagiceffect  

; ------

Spell Property WB_S_C050_DetonateDead_Spell_PC Auto
GlobalVariable Property WB_Conjuration_CorpseExplosion_Global_BaseHP Auto

; ------

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.RestoreActorValue("Health", 9999)
	WB_Conjuration_CorpseExplosion_Global_BaseHP.SetValue(akTarget.GetActorValue("Health"))
	WB_S_C050_DetonateDead_Spell_PC.Cast(akCaster, akTarget)
	akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateStart)
	akTarget.SetAlpha (0.0,True)
	akTarget.AttachAshPile()
	akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateEnd)

EndEvent

; ------
