Scriptname ORD_AlterationAb_800_Script extends activemagiceffect  

; -----

Spell Property ORD_Alt_Spellblade_Spell_Proc Auto
Actor Property PlayerRef Auto
Spell Property ORD_Alt_EnergyRoil_Spell_Proc Auto
Perk Property ORD_Alt70_EnergyRoil_Perk_70 Auto

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell as Spell) && (PlayerRef.GetEquippedSpell(0) == akSpell || PlayerRef.GetEquippedSpell(1) == akSpell)
		; this is actually an equipped spell

		If !PlayerRef.GetAnimationVariableBool("IsCastingDual")

			If PlayerRef.HasPerk(ORD_Alt70_EnergyRoil_Perk_70)
				; energy roil
				ORD_Alt_EnergyRoil_Spell_Proc.Cast(PlayerRef)
			Else
				; spellblade
				ORD_Alt_Spellblade_Spell_Proc.Cast(PlayerRef)
			EndIf
		EndIf

	EndIf

EndEvent

; -----