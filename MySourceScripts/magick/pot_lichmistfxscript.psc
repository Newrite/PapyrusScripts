Scriptname POT_LichMistFXScript extends ActiveMagicEffect  

VisualEffect Property FXDragonPriestParticlesEffect  Auto  

Race Property ArgonianRace  Auto  
Race Property KhajiitRace  Auto
FormList Property RacesElf  Auto  
Race Property OrcRace  Auto    

Actor FXTarget

	EVENT OnEffectStart(Actor akTarget, Actor akCaster)
		FXTarget = akTarget
		ActorBase TargetBase = FXTarget.GetLeveledActorBase()

		if (FXTarget.GetRace() == ArgonianRace)
			FXDragonPriestParticlesEffect.Play(FXTarget)

		elseif(FXTarget.GetRace() == KhajiitRace)
			if (TargetBase.GetSex() == 0)
				FXDragonPriestParticlesEffect.Play(FXTarget)

			else
				FXDragonPriestParticlesEffect.Play(FXTarget)

			endif

		elseif(FXTarget.GetRace() == OrcRace)
			if (TargetBase.GetSex() == 0)
				FXDragonPriestParticlesEffect.Play(FXTarget)
			else
				FXDragonPriestParticlesEffect.Play(FXTarget)
			endif
		elseif(RacesElf.HasForm(FXTarget.GetRace()))
			if (TargetBase.GetSex() == 0)
				FXDragonPriestParticlesEffect.Play(FXTarget)

			elseif(TargetBase.GetSex() == 1)
				FXDragonPriestParticlesEffect.Play(FXTarget)

			endif
		else
			if (TargetBase.GetSex() == 0)
				FXDragonPriestParticlesEffect.Play(FXTarget)

			else
				FXDragonPriestParticlesEffect.Play(FXTarget)
			endif
		endif
	ENDEVENT
	
	EVENT OnEffectFinish(Actor akTarget, Actor akCaster)
		FXDragonPriestParticlesEffect.Stop(FXTarget)
	EndEvent