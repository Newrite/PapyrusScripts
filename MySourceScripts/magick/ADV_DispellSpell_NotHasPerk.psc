Scriptname ADV_DispellSpell_NotHasPerk extends ActiveMagicEffect

Spell Property DispellSpell Auto
Perk Property HasPerk Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
If !akCaster.Hasperk(HasPerk)
    akTarget.RemoveSpell(DispellSpell)
endif
	
endEvent
