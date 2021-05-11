Scriptname ORD_InCombatSpellDetector_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Keyword Property MagicShout Auto
Keyword Property MagicWard Auto

Spell Property ORD_Res_Supremacy_Spell_Proc Auto
Perk Property ORD_Res30_Supremacy_Perk_30 Auto

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell as Spell)
	; only actual spells

		If !akSpell.HasKeyword(MagicShout)
		; no shouts

			; restoration
			If akSpell.HasKeyword(MagicWard) && PlayerRef.HasPerk(ORD_Res30_Supremacy_Perk_30)
				PlayerRef.DispelSpell(ORD_Res_Supremacy_Spell_Proc)
			EndIf

		EndIf
	EndIf

EndEvent

; -----