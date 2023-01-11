Scriptname MRL_MAG_IllusionSilence extends activemagiceffect  

Actor Target

Event OnEffectStart(Actor akTarget, Actor akCaster)
  Target = akTarget
	Target.RegisterForActorAction(1)
endEvent

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)
	if actionType == 1 && akActor == Target
		Target.InterruptCast()
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Target.UnregisterForActorAction(1)
EndEvent