Scriptname ORD_AbsolutePower_Script extends activemagiceffect  

; -----

FormList Property ORD_Des_AbsolutePower_FormList Auto
Spell Property ORD_Des_AbsolutePower_Spell_Pull_Proc Auto
Actor Property PlayerRef Auto
MagicEffect Property ORD_Des_AbsolutePower_Effect_RechargeOnSelf Auto

; -----

Event OnSpellCast(Form akSpell)

	If ORD_Des_AbsolutePower_FormList.HasForm(akSpell) && !PlayerRef.HasMagicEffect(ORD_Des_AbsolutePower_Effect_RechargeOnSelf)
		ORD_Des_AbsolutePower_Spell_Pull_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----