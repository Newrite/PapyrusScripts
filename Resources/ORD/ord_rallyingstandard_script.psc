Scriptname ORD_RallyingStandard_Script extends activemagiceffect  

; -----

FormList Property ORD_Hea_RallyingStandard_FormList_ChosenBanner auto
Spell Property ORD_Hea_RallyingStandard_Spell_Proc Auto
Sound Property ORD_Hea_RallyingStandard_Marker_Cast Auto
Float Property ORD_DistanceInFront Auto
Explosion Property DustExplosion Auto
Float Property ORD_Duration Auto

; -----

ObjectReference TheStandard

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Hea_RallyingStandard_Marker_Cast.Play(akTarget)
	Float CasterAngle = akCaster.GetAngleZ()

	TheStandard = akTarget.PlaceAtMe(ORD_Hea_RallyingStandard_FormList_ChosenBanner.GetAt(0), abInitiallyDisabled = true)
	TheStandard.MoveTo(akTarget, ORD_DistanceInFront*Math.Sin(CasterAngle), ORD_DistanceInFront*Math.Cos(CasterAngle), 0)
	TheStandard.SetAngle(0,0,akCaster.GetAngleZ() + 90)
	TheStandard.SetScale(1.25)

	TheStandard.PlaceAtMe(DustExplosion)

	TheStandard.Enable()
	RegisterForSingleUpdate(ORD_Duration)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheStandard.Disable(true)
	TheStandard.Delete()

EndEvent

; -----

Event OnUpdate()

	Dispel()

EndEvent

; -----