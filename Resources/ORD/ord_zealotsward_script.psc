Scriptname ORD_ZealotsWard_Script extends activemagiceffect  

; -----

Keyword Property MagicWard Auto
Spell Property ORD_Res_ZealotsWard_Spell_Proc Auto
Actor Property PlayerRef Auto

; -----

Event OnSpellCast(Form akSpell)

	If akSpell.HasKeyword(MagicWard)
		ORD_Res_ZealotsWard_Spell_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----