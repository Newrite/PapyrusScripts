Scriptname ORD_GenericSpellDetector_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Keyword Property MagicShout Auto
Keyword Property MagicWard Auto

Spell Property ORD_Alt_EnergyRoil_Spell_Proc Auto
Perk Property ORD_Alt70_EnergyRoil_Perk_70 Auto

Spell Property ORD_Alt_Spellblade_Spell_Proc Auto
Perk Property ORD_Alt40_Spellblade_Perk_40 Auto

;Spell Property ORD_Ill_RousingTheatrics_Spell Auto

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell as Spell)
	; only actual spells

		If !akSpell.HasKeyword(MagicShout)
		; no shouts

			; alteration
			If PlayerRef.HasPerk(ORD_Alt40_Spellblade_Perk_40)
				ORD_Alt_Spellblade_Spell_Proc.Cast(PlayerRef)
			EndIf
			If PlayerRef.HasPerk(ORD_Alt70_EnergyRoil_Perk_70)
				ORD_Alt_EnergyRoil_Spell_Proc.Cast(PlayerRef)
			EndIf

		EndIf
	EndIf

EndEvent

; -----