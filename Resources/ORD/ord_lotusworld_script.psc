Scriptname ORD_LotusWorld_Script extends ActiveMagicEffect  

; -----

Keyword Property MagicInfluenceCharm Auto
Spell Property ORD_Ill_LotusWorld_Spell_Calm Auto

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If GetTargetActor().HasKeyword(MagicInfluenceCharm) == false
		GetCasterActor().DoCombatSpellApply(ORD_Ill_LotusWorld_Spell_Calm, GetTargetActor())
	EndIf

EndEvent

; -----