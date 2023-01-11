Scriptname WB_Warpstrike2_Script extends activemagiceffect  

; -----

Float Property WB_DistanceInFront Auto
ACtor Property PlayerRef Auto
ImagespaceModifier Property WB_DestructionShock_Imod_Explosion_ShockNova Auto
; -----

Event OnEffectStart (Actor akTarget, Actor akCaster)

	Float TargetAngle = akTarget.GetAngleZ()
	akTarget.TranslateTo(akTarget.GetPositionX() + WB_DistanceInFront*Math.Sin(TargetAngle), akTarget.GetPositionY() + WB_DistanceInFront*Math.Cos(TargetAngle), akTarget.GetPositionZ(), 0, 0, TargetAngle, 4000)
	If akTarget == PlayerRef
		WB_DestructionShock_Imod_Explosion_ShockNova.Apply()
		Game.ShakeCamera(akTarget, 0.5, 1)
	EndIf

EndEvent

; -----
