Scriptname ORD_AddRemoveSpell_Script extends activemagiceffect  

; -----

Spell Property ORD_SpellToAdd Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.AddSpell(ORD_SpellToAdd,false)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.RemoveSpell(ORD_SpellToAdd)

EndEvent

; -----