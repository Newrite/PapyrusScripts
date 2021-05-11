Scriptname ORD_GodsAndMortals_Stendarr_Script extends activemagiceffect  

; -----

Spell Property ORD_Res_GodsAndMortals_Spell_Stendarr_Stagger Auto
Actor Property PlayerRef Auto

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If abHitBlocked && (akAggressor as Actor)
		PlayerRef.DoCombatSpellApply(ORD_Res_GodsAndMortals_Spell_Stendarr_Stagger, (akAggressor as Actor))
	EndIf

EndEvent

; -----