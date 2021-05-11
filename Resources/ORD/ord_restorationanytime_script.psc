Scriptname ORD_RestorationAnyTime_Script extends activemagiceffect  

; -----

Keyword Property MagicRestoreHealth Auto
Spell Property ORD_Res_OverflowingCup_Spell_Proc Auto

Actor Property PlayerRef Auto

Perk Property ORD_Res70_UnderMyWings_Perk_70 Auto
Spell Property ORD_Res_UnderMyWings_Spell_Proc Auto

; -----

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

	If akEffect.HasKeyword(MagicRestoreHealth)

		If PlayerRef.GetAVPercentage("Health") >= 1.0
			PlayerRef.DoCombatSpellApply(ORD_Res_OverflowingCup_Spell_Proc,PlayerRef)
		EndIf
		If PlayerRef.HasPerk(ORD_Res70_UnderMyWings_Perk_70) && PlayerRef.GetAnimationVariableBool("IsCastingDual") && PlayerRef.GetEquippedSpell(0).HasKeyword(MagicRestoreHealth)
			ORD_Res_UnderMyWings_Spell_Proc.Cast(PlayerRef)
		EndIf

	EndIf

EndEvent

; -----