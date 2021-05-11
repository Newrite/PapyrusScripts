Scriptname ORD_DispelWhenPAByOwner_Script extends activemagiceffect  

; -----

Perk Property ORD_Perk Auto
Perk Property ORD_PerkNPC Auto

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If abPowerAttack && (akAggressor as Actor) && ((akAggressor as Actor).HasPerk(ORD_Perk) || (akAggressor as Actor).HasPerk(ORD_PerkNPC))
		Dispel()
	EndIf

EndEvent

; -----