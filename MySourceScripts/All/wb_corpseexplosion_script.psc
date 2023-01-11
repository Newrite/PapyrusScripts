Scriptname WB_CorpseExplosion_Script extends activemagiceffect  

; -----

GlobalVariable Property WB_Conjuration_CorpseExplosion_Global_BaseHP Auto
Float Property WB_DmgMult Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float HPDamage = WB_Conjuration_CorpseExplosion_Global_BaseHP.GetValue() * WB_DmgMult * (100 - akTarget.GetActorValue("MagicResist")) / 100
	If HPDamage > 0
		akTarget.DamageActorValue("Health", HPDamage)
	EndIf

EndEvent

; -----