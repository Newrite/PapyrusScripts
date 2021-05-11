Scriptname ORD_GiveBoth_Script extends ActiveMagicEffect  

; -----

Spell[] Property ORD_GiveBoth_Spell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Int i = 0
	While i < ORD_GiveBoth_Spell.Length
		akTarget.AddSpell(ORD_GiveBoth_Spell[i], false)
		i += 1
	EndWhile

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Int i = 0
	While i < ORD_GiveBoth_Spell.Length
		akTarget.RemoveSpell(ORD_GiveBoth_Spell[i])
		i += 1
	EndWhile

EndEvent

; -----