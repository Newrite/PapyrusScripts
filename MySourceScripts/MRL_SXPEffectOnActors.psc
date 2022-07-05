Scriptname MRL_SXPEffectOnActors Extends ActiveMagicEffect

MRL_SXPKillActorWorker Property KillExpQuest Auto
Keyword Property MagicInfluenceFrenzy Auto
Spell Property SelfSpell Auto

Actor VictimActor
Float Time

Auto State DoOnceState
	Event OnEffectStart(Actor Target, Actor Caster)
		Time = Utility.GetCurrentRealTime() 
		VictimActor = Target
	EndEvent

	Event onDying(actor myKiller)
		If !myKiller
			If VictimActor.IsHostileToActor(Game.GetPlayer()) && (Time > Utility.GetCurrentRealTime() || Utility.GetCurrentRealTime() > Time + 2.0)
				KillExpQuest.PostVictim(VictimActor)
			EndIf
		ElseIf myKiller == Game.GetPlayer() || myKiller.IsPlayerTeammate() || myKiller.HasMagicEffectWithKeyword(MagicInfluenceFrenzy) || (StringUtil.Find(myKiller.GetRace(), "DragonRace") > 0 && !myKiller.IsHostileToActor(Game.GetPlayer()))
			KillExpQuest.PostVictim(VictimActor)
		EndIf
		VictimActor.RemoveSpell(SelfSpell)
		GoToState("DoNothingState")
	EndEvent
EndState

State DoNothingState
EndState