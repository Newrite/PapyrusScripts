Scriptname DLC1SoulCairnCreatureFX_Summon extends ActiveMagicEffect 
{handles the fx for the necro skeleton}
import Debug
import Utility

VisualEffect Property FXSCCreatureMultiEffect auto
VisualEffect Property FXSCCreatureEyeGlowEffect auto
EffectShader Property SCCreatureDeathFXS auto

Bool Property isSummonable = FALSE auto
{Default = FALSE}

Actor selfRef

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = target	
		if (FXSCCreatureMultiEffect)
			if (selfRef.GetSleepState() == 3)
	; 			Debug.Trace("Spriggan is sleeping! 3")
				FXSCCreatureMultiEffect.Stop(selfRef)
				;selfRef.PlaySubGraphAnimation( "KillFX" )
			else
				FXSCCreatureMultiEffect.play(selfRef as ObjectReference, -1)
			endif
		endif
		if (FXSCCreatureEyeGlowEffect)
			FXSCCreatureEyeGlowEffect.play(selfRef as ObjectReference, -1)
		endif
	ENDEVENT

	Event OnEffectFinish(Actor akTarget, Actor akCaster)		
		if(FXSCCreatureMultiEffect)
		FXSCCreatureMultiEffect.Stop(selfRef)
		endif
		if (FXSCCreatureEyeGlowEffect)
		FXSCCreatureEyeGlowEffect.Stop(selfRef)
		endif
	ENDEVENT
	
	Event OnGetUp(ObjectReference akFurniture)
		if (FXSCCreatureMultiEffect)
			FXSCCreatureMultiEffect.play(selfRef as ObjectReference, -1)
		endif
		if (FXSCCreatureEyeGlowEffect)
			FXSCCreatureEyeGlowEffect.play(selfRef as ObjectReference, -1)
		endif
	endEvent

	EVENT OnDying(actor myKiller)
;/ 		selfRef.RemoveAllItems()
 		selfRef.addItem(DLC01DeathItemMistman)
 /; 		FXSCCreatureMultiEffect.stop(selfRef)
		FXSCCreatureEyeGlowEffect.stop(selfRef)
		SCCreatureDeathFXS.play(selfRef)
		
	ENDEVENT