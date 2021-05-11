Scriptname ORD_BreakUponMe_Holder_Script extends activemagiceffect  

; -----

Spell Property ORD_Hea_ReapTheWhirlwind_Spell Auto
Perk Property ORD_Hea70_ReapTheWhirlwind_Perk_70 Auto
Perk Property ORD_Hea90_Sovereign_Perk_90 Auto
Spell Property ORD_Hea_Sovereign_Spell_Proc Auto
MagicEffect Property ORD_Hea_Sovereign_Effect_Proc Auto
Actor Property PlayerRef Auto

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	; fast failing most hits

	; reap the whirlwind
;	If abPowerAttack && PlayerRef.HasPerk(ORD_Hea70_ReapTheWhirlwind_Perk_70)
	If abPowerAttack
		ORD_Hea_ReapTheWhirlwind_Spell.Cast(PlayerRef, (akAggressor as Actor))
	EndIf

	; sovereign
	If (akSource as Weapon) && !PlayerRef.HasMagicEffect(ORD_Hea_Sovereign_Effect_Proc) && PlayerRef.HasPerk(ORD_Hea90_Sovereign_Perk_90)
		ORD_Hea_Sovereign_Spell_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----