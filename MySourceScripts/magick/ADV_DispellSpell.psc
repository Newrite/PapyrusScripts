Scriptname ADV_DispellSpell extends ActiveMagicEffect

Spell Property DispellSpell Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    akTarget.RemoveSpell(DispellSpell)
	
endEvent
