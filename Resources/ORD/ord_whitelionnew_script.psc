Scriptname ORD_WhiteLionNew_Script extends activemagiceffect  

; -----

Spell Property ORD_Two_WhiteLionNew_Spell_Proc Auto

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If abHitBlocked
		ORD_Two_WhiteLionNew_Spell_Proc.Cast(GetTargetActor())
	EndIf

EndEvent

; -----