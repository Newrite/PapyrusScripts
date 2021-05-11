ScriptName MRL_DecurseSleep Extends ActiveMagicEffect

float _LastSleptHours_ = 0.0

int _SleepHours_ = 0

actor cursedActor

int Function GetDate() Global
	return Math.Floor(Utility.GetCurrentGameTime())
EndFunction

Event OnSleepStart( float start_time, float end_time )
	float delta = (end_time - start_time) * 24.0
	float f_floor = Math.Floor(delta)
	float f_nod = delta - f_floor
	_LastSleptHours_ = f_floor
	if ( f_nod > 0.9 )
		_LastSleptHours_ += 1.0
	endif
	_SleepHours_ = Math.Floor(_LastSleptHours_)
EndEvent

Event OnSleepStop( bool abInterrupted )	
	if _SleepHours_ == 0
		return
	endif
	if ( abInterrupted == True )
		return
	endif
	
	float EnchantingSkillAdvance = cursedActor.GetActorValue("EnchantingSkillAdvance") as Float
	float decurseValue = _SleepHours_ as Float * 20.0
	if EnchantingSkillAdvance <= decurseValue
		cursedActor.ModActorValue("EnchantingSkillAdvance", -EnchantingSkillAdvance)
	else
		cursedActor.ModActorValue("EnchantingSkillAdvance", -decurseValue)
	endif
	
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	cursedActor = akCaster
	RegisterForSleep()
EndEvent