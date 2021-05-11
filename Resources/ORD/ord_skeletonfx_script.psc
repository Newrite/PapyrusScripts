Scriptname ORD_SkeletonFX_Script extends activemagiceffect  

; -----

VisualEffect Property ORD_Con_BoneCollector_VFX_AbSkeleton Auto
VisualEffect Property FXDraugrMaleEyeEffect = NONE Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Con_BoneCollector_VFX_AbSkeleton.Play(akTarget, -1)
	If FXDraugrMaleEyeEffect != NONE
		Utility.Wait(0.2)
		FXDraugrMaleEyeEffect.Stop(akTarget)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Con_BoneCollector_VFX_AbSkeleton.Stop(akTarget)

EndEvent

; -----