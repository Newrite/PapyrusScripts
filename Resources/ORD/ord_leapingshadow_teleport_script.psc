Scriptname ORD_LeapingShadow_Teleport_Script extends activemagiceffect  

; -----

Float Property DistanceInFront Auto
Sound Property ORD_Sne_LeapingShados_Marker Auto
Float Property ORD_LockDuration Auto

; -----

Event OnEffectStart (Actor akTarget, Actor akCaster)

	akTarget.SetDontMove(true)
	Float EndLocX = (DistanceInFront*Math.Sin(akTarget.GetAngleZ()))
	Float EndLocY = (DistanceInFront*Math.Cos(akTarget.GetAngleZ()))

	Float TargetAngleZ = akTarget.GetAngleZ()

	akCaster.MoveTo(akTarget, EndLocX, EndLocY, 0)
	Debug.SendAnimationEvent(akCaster, "attackPowerStartInPlace")
	akCaster.SetAngle(0, 0, TargetAngleZ)
	akTarget.PushActorAway(akTarget,1.5)

	ORD_Sne_LeapingShados_Marker.Play(akCaster)
	Utility.Wait(ORD_LockDuration)
	akTarget.SetDontMove(false)

EndEvent

; -----
