scriptName MRL_DecurseBook extends activemagiceffect

bool registerStage = true
actor cursedActor
Float mag = 0.0

Event OnEffectStart(Actor akTarget, Actor akCaster)

		registerStage = true
		mag = Self.GetMagnitude()
		cursedActor = akCaster
		RegisterForSingleUpdate(1.0)
		
endEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	registerStage = false
endEvent

Event OnUpdate()
	if registerStage == false
		UnregisterForUpdate()
		return
	else
		float EnchantingSkillAdvance = cursedActor.GetActorValue("EnchantingSkillAdvance") as Float
		if EnchantingSkillAdvance >= 1.0
			cursedActor.ModActorValue("EnchantingSkillAdvance", -mag)
		endif
	endif
	RegisterForSingleUpdate(1.0)
EndEvent