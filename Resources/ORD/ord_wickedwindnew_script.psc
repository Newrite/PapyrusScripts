Scriptname ORD_WickedWindNew_Script extends activemagiceffect  

; -----

Float Property DistanceInFront Auto
Sound Property ORD_Sne_LeapingShados_Marker Auto
Float Property ORD_LockDuration Auto
Spell Property ORD_Sne_WickedWind_Spell_Proc Auto

; -----

Event OnEffectStart (Actor akTarget, Actor akCaster)

;	akTarget.SetDontMove(true)
	akTarget.SetUnconscious(true)
	Float TargetZ = akTarget.GetAngleZ()
	Float EndLocX = (DistanceInFront*Math.Sin(TargetZ))
	Float EndLocY = (DistanceInFront*Math.Cos(TargetZ))

	Float TargetAngleZ = akTarget.GetAngleZ()

	ORD_Sne_WickedWind_Spell_Proc.Cast(akCaster)
	akCaster.MoveTo(akTarget, EndLocX, EndLocY, 0)
	Debug.SendAnimationEvent(akCaster, "attackPowerStartInPlace")
	akCaster.SetAngle(0, 0, TargetAngleZ)
;	akTarget.PushActorAway(akTarget,1.5)

	;ORD_Sne_LeapingShados_Marker.Play(akCaster)
	Utility.Wait(ORD_LockDuration)
	akTarget.SetUnconscious(false)
;	akTarget.SetDontMove(false)

EndEvent

; -----
