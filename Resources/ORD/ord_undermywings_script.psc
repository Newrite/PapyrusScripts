Scriptname ORD_UnderMyWings_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Keyword Property MagicHeal Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Spell TheSpell = PlayerRef.GetEquippedSpell(0)
	If TheSpell.HasKeyword(MagicHeal)
		akCaster.DoCombatSpellApply(TheSpell, akTarget)
	EndIf

EndEvent

; -----