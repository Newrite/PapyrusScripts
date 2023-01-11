;/ Decompiled by Champollion V1.0.1
Source   : TVR_ShadowDance_Script.psc
Modified : 2020-06-21 00:53:38
Compiled : 2020-06-21 00:53:39
User     : maxim
Computer : CANOPUS
/;
scriptName TVR_ShadowDance_Script extends activemagiceffect

;-- Properties --------------------------------------
Float property TVR_DistanceInFront auto
Float property TVR_AngleDelta auto
Float property TVR_Speed auto
sound property TVR_ImpactSound auto
actor property PlayerRef auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function OnEffectStart(actor akTarget, actor akCaster)

	Float TargetAngleZ = akTarget.GetAngleZ() + TVR_AngleDelta
	Float TargetPosX = akTarget.GetPositionX()
	Float TargetPosY = akTarget.GetPositionY()
	Float TargetPosZ = akTarget.GetPositionZ()
	Float EndLocX = TVR_DistanceInFront * math.Sin(TargetAngleZ)
	Float EndLocY = TVR_DistanceInFront * math.Cos(TargetAngleZ)
	akTarget.TranslateTo(TargetPosX + EndLocX, TargetPosY + EndLocY, TargetPosZ, 0 as Float, 0 as Float, TargetAngleZ, TVR_Speed, 0 as Float)
	TVR_ImpactSound.Play(akTarget as objectreference)
endFunction
