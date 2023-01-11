Scriptname POT_BoneTyrantFXScript extends ActiveMagicEffect  

VisualEffect Property FXMagicDraugrDarkeningEffect  Auto  

Race Property ArgonianRace  Auto  
Race Property KhajiitRace  Auto
FormList Property RacesElf  Auto  
Race Property OrcRace  Auto    

Actor FXTarget

	EVENT OnEffectStart(Actor akTarget, Actor akCaster)
		FXTarget = akTarget
		ActorBase TargetBase = FXTarget.GetLeveledActorBase()

		if (FXTarget.GetRace() == ArgonianRace)
			FXMagicDraugrDarkeningEffect.Play(FXTarget)

		elseif(FXTarget.GetRace() == KhajiitRace)
			if (TargetBase.GetSex() == 0)
				FXMagicDraugrDarkeningEffect.Play(FXTarget)

			else
				FXMagicDraugrDarkeningEffect.Play(FXTarget)

			endif

		elseif(FXTarget.GetRace() == OrcRace)
			if (TargetBase.GetSex() == 0)
				FXMagicDraugrDarkeningEffect.Play(FXTarget)
			else
				FXMagicDraugrDarkeningEffect.Play(FXTarget)
			endif
		elseif(RacesElf.HasForm(FXTarget.GetRace()))
			if (TargetBase.GetSex() == 0)
				FXMagicDraugrDarkeningEffect.Play(FXTarget)

			elseif(TargetBase.GetSex() == 1)
				FXMagicDraugrDarkeningEffect.Play(FXTarget)

			endif
		else
			if (TargetBase.GetSex() == 0)
				FXMagicDraugrDarkeningEffect.Play(FXTarget)

			else
				FXMagicDraugrDarkeningEffect.Play(FXTarget)
			endif
		endif
	ENDEVENT
	
	EVENT OnEffectFinish(Actor akTarget, Actor akCaster)
		FXMagicDraugrDarkeningEffect.Stop(FXTarget)
	EndEvent
