Scriptname ORD_DimensionDoor_Power_Script extends activemagiceffect  

; -----

Activator Property ORD_Alt_DimensionDoor_Activator Auto
Sound Property ORD_Alt_DimensionDoor_Marker Auto

; -----

ObjectReference TheDoor

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Alt_DimensionDoor_Marker.Play(akTarget)
	TheDoor = akTarget.PlaceAtMe(ORD_Alt_DimensionDoor_Activator)
	TheDoor.SetAngle(0, 0, akTarget.GetAngleZ())

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheDoor.Disable(true)
	TheDoor.Delete()

EndEvent

; -----

;CreatedObject.MoveTo(akCaster,(WB_DistanceInFront*Math.Sin(CasterAngle)),(WB_DistanceInFront*Math.Cos(CasterAngle)),0)