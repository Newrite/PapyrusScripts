Scriptname SXP_TRYAOE Extends ActiveMagicEffect

zzzSXPWorkerKillActor Property XPWorker Auto
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
			XPWorker.PostVictim(VictimActor)
		EndIf
	ElseIf myKiller == Game.GetPlayer() || myKiller.IsPlayerTeammate() || myKiller.HasMagicEffectWithKeyword(MagicInfluenceFrenzy) || (StringUtil.Find(myKiller.GetRace(), "DragonRace") > 0 && !myKiller.IsHostileToActor(Game.GetPlayer()))
		XPWorker.PostVictim(VictimActor)
	EndIf
	VictimActor.RemoveSpell(SelfSpell)
	GoToState("DoNothingState")
EndEvent
EndState

State DoNothingState
EndState