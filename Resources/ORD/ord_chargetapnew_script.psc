Scriptname ORD_ChargeTapNew_Script extends activemagiceffect  

; -----

Float Property ORD_ChargeDrainedToStatMult Auto
Float Property ORD_HealthMult Auto
Float Property ORD_DrainFraction Auto
Sound Property MAGRestorationFFFire Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	MAGRestorationFFFire.Play(akTarget)

	Float ChargeLeft = akCaster.GetActorValue("LeftItemCharge")
	Float ChargeRight = akCaster.GetActorValue("RightItemCharge")

	Float ActualDrainFraction = ORD_DrainFraction
	If ChargeLeft > 0 && ChargeRight > 0
		ActualDrainFraction /= 2
	EndIf

	Float ChargeDrainedLeft = ChargeLeft * ActualDrainFraction
	Float ChargeDrainedRight = ChargeRight * ActualDrainFraction
	Float RestoreValue = (ChargeDrainedLeft + ChargeDrainedRight) * ORD_ChargeDrainedToStatMult

	akTarget.RestoreActorValue("Stamina", RestoreValue)
	akTarget.RestoreActorValue("Magicka",RestoreValue)
	akTarget.RestoreActorValue("Health", RestoreValue * ORD_HealthMult)

	akCaster.DamageActorValue("LeftItemCharge", ChargeDrainedLeft)
	akCaster.DamageActorValue("RightItemCharge", ChargeDrainedRight)

EndEvent

; -----