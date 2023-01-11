scriptName MRL_MAG_TelekineticPush extends activemagiceffect

Float property TVR_Speed auto
Float property TVR_DistanceInFront auto

function OnEffectStart(Actor akTarget, Actor akCaster)

	Float CasterAngle = akCaster.GetAngleZ()
	Float XLoc = akTarget.GetPositionX() + TVR_DistanceInFront * math.Sin(CasterAngle)
	Float YLoc = akTarget.GetPositionY() + TVR_DistanceInFront * math.Cos(CasterAngle)
	Float ZLoc = akTarget.GetPositionZ()
	akTarget.TranslateTo(XLoc, YLoc, ZLoc, 0 as Float, 0 as Float, CasterAngle + 180 as Float, TVR_Speed, 0.000000)
endFunction
