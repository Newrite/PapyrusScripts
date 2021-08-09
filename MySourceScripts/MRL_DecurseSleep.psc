ScriptName MRL_DecurseSleep Extends ActiveMagicEffect

float LastSleptHours = 0.0

int SleepHours = 0

Actor CursedActor

Event OnSleepStart(float StartTime, float EndTime)

	float delta = (EndTime - StartTime) * 24.0
	float f_floor = Math.Floor(delta)
	float f_nod = delta - f_floor

	LastSleptHours = f_floor

	if f_nod > 0.9
		LastSleptHours += 1.0
	endif

	SleepHours = Math.Floor(LastSleptHours)

EndEvent

Event OnSleepStop(bool abInterrupted)	

	Utility.Wait(1.0)

	if SleepHours == 0
		return
	endif

	if abInterrupted
		return
	endif
	
	float EnchantingSkillAdvance = CursedActor.GetActorValue("EnchantingSkillAdvance") as Float
	float decurseValue = SleepHours as Float * 20.0

	if EnchantingSkillAdvance <= decurseValue
		CursedActor.ModActorValue("EnchantingSkillAdvance", -EnchantingSkillAdvance)
	else
		CursedActor.ModActorValue("EnchantingSkillAdvance", -decurseValue)
	endif
	
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	CursedActor = akCaster
	RegisterForSleep()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForSleep()
EndEvent