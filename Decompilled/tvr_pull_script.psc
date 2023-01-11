;/ Decompiled by Champollion V1.0.1
Source   : TVR_Pull_Script.psc
Modified : 2020-06-21 16:16:26
Compiled : 2020-06-21 16:16:27
User     : maxim
Computer : CANOPUS
/;
scriptName TVR_Pull_Script extends activemagiceffect

;-- Properties --------------------------------------
Float property TVR_Speed auto
Float property TVR_DistanceInFront auto
sound property TVR_Hit auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnEffectStart(Actor akTarget, Actor akCaster)

	Float CasterAngle = akCaster.GetAngleZ()
	Float XLoc = akCaster.GetPositionX() + TVR_DistanceInFront * math.Sin(CasterAngle)
	Float YLoc = akCaster.GetPositionY() + TVR_DistanceInFront * math.Cos(CasterAngle)
	Float ZLoc = akCaster.GetPositionZ()
	akTarget.TranslateTo(XLoc, YLoc, ZLoc, 0 as Float, 0 as Float, CasterAngle + 180 as Float, TVR_Speed, 0.000000)
	TVR_Hit.Play(akTarget as objectreference)
endFunction
