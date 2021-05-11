Scriptname ORD_UntoTheMasses_Script extends activemagiceffect  

; -----

Keyword Property MagicArmor Auto
Spell Property ORD_Alt_UntoTheMasses_Spell_Proc Auto
Actor Property PlayerRef Auto

; -----

Event OnSpellCast(Form akSpell)

	If akSpell.HasKeyword(MagicArmor) && PlayerRef.GetAnimationVariableBool("IsCastingDual") && PlayerRef.GetEquippedSpell(0).HasKeyword(MagicArmor)
		ORD_Alt_UntoTheMasses_Spell_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----
