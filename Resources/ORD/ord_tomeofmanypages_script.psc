Scriptname ORD_TomeOfManyPages_Script extends activemagiceffect  

; -----

Spell[] Property ORD_TomeOfManyPages_Spell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Int i = 0
	While i < ORD_TomeOfManyPages_Spell.Length
		akTarget.AddSpell(ORD_TomeOfManyPages_Spell[i],false)
		i += 1
	EndWhile

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Int i = 0
	While i < ORD_TomeOfManyPages_Spell.Length
		akTarget.DispelSpell(ORD_TomeOfManyPages_Spell[i])
		akTarget.RemoveSpell(ORD_TomeOfManyPages_Spell[i])
		i += 1
	EndWhile

EndEvent

; -----