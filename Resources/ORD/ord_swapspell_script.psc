Scriptname ORD_SwapSpell_Script extends activemagiceffect  

; -----

Spell Property ORD_SpellToReplace Auto
Spell Property ORD_SpellNew Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.RemoveSpell(ORD_SpellToReplace)
	akTarget.AddSpell(ORD_SpellNew,false)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.RemoveSpell(ORD_SpellNew)

EndEvent

; -----