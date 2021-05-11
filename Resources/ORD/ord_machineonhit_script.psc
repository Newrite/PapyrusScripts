Scriptname ORD_MachineOnHit_Script extends activemagiceffect  

; -----

Keyword Property WeapTypeWarhammer Auto
Keyword Property WeapTypeMace Auto
Actor Property PlayerRef Auto
Spell Property ORD_Loc_Hotwire_Spell_Proc_PercussiveMaintenance Auto
Spell Property ORD_Loc_Hotwire_Spell_Proc_PercussiveMaintenance_PA Auto

; -----

Auto State IsListening

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akAggressor == PlayerRef && (akSource.HasKeyword(WeapTypeWarhammer) || akSource.HasKeyword(WeapTypeMace))
		If abPowerAttack
			PlayerRef.DoCombatSpellApply(ORD_Loc_Hotwire_Spell_Proc_PercussiveMaintenance_PA, GetTargetActor())
		Else
			PlayerRef.DoCombatSpellApply(ORD_Loc_Hotwire_Spell_Proc_PercussiveMaintenance, GetTargetActor())
		EndIf
	EndIf

EndEvent

EndState

; -----