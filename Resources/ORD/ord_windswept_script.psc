Scriptname ORD_Windswept_Script extends activemagiceffect  

; -----

Float Property ORD_DistanceInFront Auto
Sound Property ORD_One_Windswept_Marker Auto
Activator Property FXEmptyActivator Auto
Float Property ORD_Pushback Auto

; -----

Event OnEffectStart (Actor akTarget, Actor akCaster)

	Float TargetAngle = akTarget.GetAngleZ()
	ObjectReference TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
	TheBox.MoveTo(akTarget, (ORD_DistanceInFront*Math.Sin(TargetAngle)), (ORD_DistanceInFront*Math.Cos(TargetAngle)), 0)
	If !akTarget.IsDead()
		akTarget.TranslateToRef(TheBox, ORD_Pushback)
	Else
		TheBox.PushActorAway(akTarget, -12)
	EndIf
	ORD_One_Windswept_Marker.Play(akTarget)

	; not speed sensitive
	akTarget.RampRumble(0.25, 0.35, 1024)
	Utility.Wait(1.0)
	TheBox.Delete()

EndEvent

; -----