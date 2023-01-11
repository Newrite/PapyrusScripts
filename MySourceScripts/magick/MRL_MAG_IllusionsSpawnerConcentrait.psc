Scriptname MRL_MAG_IllusionsSpawnerConcentrait extends ActiveMagicEffect

Int Property LevelMod = 0 Auto
Keyword Property DualCastEffect Auto
Spell Property BaseAbility Auto
Spell Property DualCastAbility Auto
Faction Property IllusionsFaction Auto

Actor Illusion

Event OnEffectStart(Actor akTarget, Actor akCaster)
  
  Illusion = akTarget.PlaceActorAtMe(akTarget.GetBaseObject() as ActorBase, LevelMod)
  Illusion.Disable()

  Illusion.AddToFaction(IllusionsFaction)
  Illusion.SetPlayerTeammate(true, false)
  Illusion.Enable()

  Utility.WaitMenuMode(0.25)
  if akTarget.HasMagicEffectWithKeyword(DualCastEffect)
    Illusion.AddSpell(DualCastAbility)
  else
    Illusion.AddSpell(BaseAbility)
  endif

  if akTarget.IsHostileToActor(akCaster)
    Illusion.StartCombat(akTarget)
  endif

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If akCaster
		While akCaster.IsInKillmove() || Illusion.IsInKillmove()
			Utility.Wait(0.1)
		EndWhile
	EndIf
	Illusion.Delete()

EndEvent
