scriptName mrlgetperk extends activemagiceffect

spell property testSpell1 auto
perk property testPerk1 auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	perk onePerk = testSpell1.GetPerk() as perk
	
	if onePerk == testPerk1
		Debug.messagebox("Perk"+onePerk)
	else
		Debug.messagebox("no perk"+onePerk)
	endif
	
	
endEvent