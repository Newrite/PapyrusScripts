Scriptname FXSkeletonNecroScript_Summon extends ActiveMagicEffect  
{handles the fx for the necro skeleton}

VisualEffect Property FXNecroSkeletonMultiEffect auto
VisualEffect Property FXSkeletonNecroEyeGlowEffect auto
EffectShader Property SkeletonNecroDeathFXS auto

Actor selfRef

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster	
		FXNecroSkeletonMultiEffect.play(selfRef, -1)
		FXSkeletonNecroEyeGlowEffect.play(selfRef, -1)
	ENDEVENT

	Event OnEffectFinish(Actor akTarget, Actor akCaster)		
		FXNecroSkeletonMultiEffect.Stop(selfRef)
		FXSkeletonNecroEyeGlowEffect.Stop(selfRef)
	ENDEVENT
	
	EVENT OnDying(actor myKiller)	
		FXNecroSkeletonMultiEffect.stop(selfRef)
		FXSkeletonNecroEyeGlowEffect.stop(selfRef)
		SkeletonNecroDeathFXS.play(selfRef)
		
	ENDEVENT
	