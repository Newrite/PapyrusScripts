Scriptname ORD_StaticField_Script extends activemagiceffect  


; -----

Float Property ORD_StaticFieldFraction Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float TargetHealth = akTarget.GetAV("Health")
	Float TargetMaxHealth = akTarget.GetBaseAV("Health")
	If TargetHealth > 0
		Float DamageRemaining = TargetHealth - (ORD_StaticFieldFraction * TargetMaxHealth)
		If DamageRemaining > 0
			DamageRemaining *= (100 - akTarget.GetAV("ElectricResist")) / 100
			If DamageRemaining > 0
				akTarget.DamageAV("Health", DamageRemaining)
			EndIf
		EndIf
	EndIf

EndEvent

; -----