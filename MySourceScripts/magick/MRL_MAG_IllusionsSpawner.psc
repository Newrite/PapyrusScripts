Scriptname MRL_MAG_IllusionsSpawner extends ActiveMagicEffect

Int Property LevelMod = 0 Auto
Spell Property IllusionAbility Auto
Faction Property IllusionsFaction Auto

Actor Illusion
bool IsFinish = false

Event OnEffectStart(Actor akTarget, Actor akCaster)

  RegisterForSingleUpdate(3.0)
  
  Illusion = akTarget.PlaceActorAtMe(akTarget.GetLeveledActorBase(), LevelMod)
  if !Illusion
    Illusion = akTarget.PlaceActorAtMe(akTarget.GetActorBase(), LevelMod)
  endif
  Illusion.Disable()

  Illusion.AddToFaction(IllusionsFaction)
  Illusion.SetPlayerTeammate(true, false)
  Illusion.Enable()

  Utility.WaitMenuMode(0.20)
  Illusion.AddSpell(IllusionAbility)

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
  IsFinish = true

EndEvent


Event OnUpdate()

  if !IsFinish

    actor caster = self.GetCasterActor()

	  If caster && Illusion.IsDead()
	  	While caster.IsInKillmove() || Illusion.IsInKillmove()
	  		Utility.Wait(0.1)
	  	EndWhile
      Illusion.Delete()
    else
      RegisterForSingleUpdate(3.0)
    endif

  endif
  
EndEvent