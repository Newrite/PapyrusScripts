Scriptname ORD_WorldSerpent_Script extends activemagiceffect  

; -----

Keyword Property MagicShout Auto
Spell Property ORD_Alc_WorldSerpent_Spell_HitBuff Auto
Actor Property PlayerRef Auto

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell as Spell) && akSpell.HasKeyword(MagicShout)
		ORD_Alc_WorldSerpent_Spell_HitBuff.Cast(PlayerRef)
	EndIf

EndEvent

; -----