Scriptname ORD_MysticWarrior_MNM_Script extends activemagiceffect  

; -----

Int Property ORD_SpellSlot Auto
FormList Property ORD_Enc_MysticWarrior_FormList Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Spell TheSpell = akTarget.GetEquippedSpell(ORD_SpellSlot)
	If TheSpell != ORD_Enc_MysticWarrior_FormList.GetAt(0) as Spell
		TheSpell.Cast(akTarget)
	EndIf

EndEvent

; -----