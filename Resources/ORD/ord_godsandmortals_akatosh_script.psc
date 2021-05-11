Scriptname ORD_GodsAndMortals_Akatosh_Script extends activemagiceffect  

; -----

GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property ORD_Res_GodsAndMortals_Global_Akatosh_NextActivate Auto
Spell Property ORD_Res_GodsAndMortals_Spell_Akatosh_SlowTime Auto

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If GetTargetActor().GetAVPercentage("Health") < 0.15
		If ORD_Res_GodsAndMortals_Global_Akatosh_NextActivate.GetValue() < GameDaysPassed.GetValue()
			ORD_Res_GodsAndMortals_Spell_Akatosh_SlowTime.Cast(GetTargetActor())
			ORD_Res_GodsAndMortals_Global_Akatosh_NextActivate.SetValue(GameDaysPassed.GetValue() + 0.5)
		EndIf
	EndIf

EndEvent

; -----