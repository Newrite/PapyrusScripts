Scriptname ORD_Revenge_Script extends ActiveMagicEffect  

; -----

Spell Property ORD_Hea_Revenge_Spell Auto
Perk Property ORD_Hea70_Revenge_Perk_70 Auto
Perk Property ORD_Hea90_Sovereign_Perk_90 Auto
Spell Property ORD_Hea_Sovereign_Spell_Proc Auto
MagicEffect Property ORD_Hea_Sovereign_Effect_Proc Auto
Actor Property PlayerRef Auto

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If abPowerAttack && PlayerRef.HasPerk(ORD_Hea70_Revenge_Perk_70)
		PlayerRef.DoCombatSpellApply(ORD_Hea_Revenge_Spell,(akAggressor as Actor))
	EndIf

	If (akSource as Weapon) && !PlayerRef.HasMagicEffect(ORD_Hea_Sovereign_Effect_Proc) && PlayerRef.HasPerk(ORD_Hea90_Sovereign_Perk_90)
		ORD_Hea_Sovereign_Spell_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----