scriptName MRL_decurse extends activemagiceffect

Event OnEffectStart(Actor akTarget, Actor akCaster)

		float EnchantingSkillAdvance = akCaster.GetActorValue("EnchantingSkillAdvance") as Float
		float varDecurse = ((EnchantingSkillAdvance / 50.0) * (EnchantingSkillAdvance / 50.0)) * 10.0
		if varDecurse < 10.0 
			varDecurse = 10.0
		endif
		if (EnchantingSkillAdvance < 10.0) && (EnchantingSkillAdvance > 0)
			akCaster.ModActorValue("EnchantingSkillAdvance", -EnchantingSkillAdvance)
		endif
		if EnchantingSkillAdvance >= 10.0
			akCaster.ModActorValue("EnchantingSkillAdvance", -varDecurse)
		endif
		
endEvent