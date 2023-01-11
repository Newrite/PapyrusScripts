Scriptname POT_LichEyesFXScript extends ActiveMagicEffect  

VisualEffect Property POT_EyeGlowMale  Auto  
VisualEffect Property POT_EyeGlowFemale Auto
VisualEffect Property POT_EyeGlowKhajiitMale Auto
VisualEffect Property POT_EyeGlowKhajiitFemale Auto
VisualEffect Property POT_EyeGlowArgonian Auto
VisualEffect Property POT_EyeGlowElfMale  Auto  
VisualEffect Property POT_EyeGlowElfFemale  Auto  
VisualEffect Property POT_EyeGlowOrcMale  Auto  
VisualEffect Property POT_EyeGlowOrcFemale  Auto

Race Property ArgonianRace  Auto  
Race Property KhajiitRace  Auto
FormList Property RacesElf  Auto  
Race Property OrcRace  Auto    

Actor FXTarget

	EVENT OnEffectStart(Actor akTarget, Actor akCaster)
		FXTarget = akTarget
		ActorBase TargetBase = FXTarget.GetLeveledActorBase()

		if (FXTarget.GetRace() == ArgonianRace)
			POT_EyeGlowArgonian.Play(FXTarget)

		elseif(FXTarget.GetRace() == KhajiitRace)
			if (TargetBase.GetSex() == 0)
				POT_EyeGlowKhajiitMale.Play(FXTarget)

			else
				POT_EyeGlowKhajiitFemale.Play(FXTarget)

			endif

		elseif(FXTarget.GetRace() == OrcRace)
			if (TargetBase.GetSex() == 0)
				POT_EyeGlowOrcMale.Play(FXTarget)
			else
				POT_EyeGlowOrcFemale.Play(FXTarget)
			endif
		elseif(RacesElf.HasForm(FXTarget.GetRace()))
			if (TargetBase.GetSex() == 0)
				POT_EyeGlowElfMale.Play(FXTarget)

			elseif(TargetBase.GetSex() == 1)
				POT_EyeGlowElfFemale.Play(FXTarget)

			endif
		else
			if (TargetBase.GetSex() == 0)
				POT_EyeGlowMale.Play(FXTarget)

			else
				POT_EyeGlowFemale.Play(FXTarget)
			endif
		endif
	ENDEVENT
	
	EVENT OnEffectFinish(Actor akTarget, Actor akCaster)
		POT_EyeGlowMale.Stop(FXTarget)
		POT_EyeGlowFemale.Stop(FXTarget)
		POT_EyeGlowKhajiitMale.Stop(FXTarget)
		POT_EyeGlowKhajiitFemale.Stop(FXTarget)
		POT_EyeGlowArgonian.Stop(FXTarget)
		POT_EyeGlowElfMale.Stop(FXTarget)
		POT_EyeGlowElfFemale.Stop(FXTarget)
		POT_EyeGlowOrcMale.Stop(FXTarget)
		POT_EyeGlowOrcFemale.Stop(FXTarget)
	EndEvent
