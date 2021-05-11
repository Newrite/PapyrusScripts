Scriptname ORD_FaerieFire_Script extends activemagiceffect  

; -----

Float Property ORD_MagickaMult Auto
Float Property ORD_StaminaMult Auto
Float Property ORD_DrainWait Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float ChargeLeft = akCaster.GetAV("LeftItemCharge")
	Float ChargeRight = akCaster.GetAV("RightItemCharge")

	akTarget.DamageAV("Magicka", ChargeLeft * ORD_MagickaMult)
	akTarget.DamageAV("Stamina", ChargeRight * ORD_StaminaMult)

	Utility.Wait(ORD_DrainWait)

	akCaster.DamageAV("LeftItemCharge", 9999)
	akCaster.DamageAV("RightItemCharge", 9999)

EndEvent

; -----