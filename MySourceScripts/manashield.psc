scriptName ManaShield extends activemagiceffect

float tempHealth = 0.0
float tempHealthPercent = 0.0
float currentHealth = 0.0
bool registerStage = true

Event OnEffectStart(Actor akTarget, Actor akCaster)
	registerStage = true
	tempHealth = game.GetPlayer().GetActorValue("health")
	tempHealthPercent = game.GetPlayer().GetActorValuePercentage("health")
	RegisterForSingleUpdate(0.5)
endEvent

Event OnUpdate()
	if registerStage == false
		UnregisterForUpdate()
		return
	else
		if game.GetPlayer().GetActorValuePercentage("health") < tempHealthPercent
			currentHealth = game.GetPlayer().GetActorValue("health")
				if currentHealth < tempHealth
					game.GetPlayer().DamageActorValue("magicka", (tempHealth - currentHealth) / 0.7 * 0.3)
				endif
		endif
		tempHealth = game.GetPlayer().GetActorValue("health")
		tempHealthPercent = game.GetPlayer().GetActorValuePercentage("health")
	endif
	RegisterForSingleUpdate(0.5)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	registerStage = false
endEvent