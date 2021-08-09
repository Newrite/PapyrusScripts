scriptName ManaDrain extends activemagiceffect

float manaDrainVar = 0.0
bool registerStage = true

Event OnEffectStart(Actor akTarget, Actor akCaster)
	registerStage = true
	RegisterForSingleUpdate(1.0)
endEvent

Event OnUpdate()
	if registerStage == false
		UnregisterForUpdate()
		return
	else
		manaDrainVar = (game.GetPlayer().GetActorValue("magicka") / game.GetPlayer().GetActorValuePercentage("magicka")) / 100 * 3
		game.GetPlayer().DamageActorValue("magicka", manaDrainVar)
	endif
	RegisterForSingleUpdate(1.0)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	registerStage = false
endEvent