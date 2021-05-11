scriptName MRL_ForceSummon extends activemagiceffect

Perk Property checkPerk auto
Spell Property spellToSummon auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	if Game.GetPlayer().HasPerk(checkPerk)
		Utility.Wait(1.0)
		Cast.spellToSummon(akTarget, akTarget)
	endif
		
endEvent
