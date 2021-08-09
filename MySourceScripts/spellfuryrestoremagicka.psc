scriptName SpellFuryRestoreMagicka extends activemagiceffect

globalvariable property SpellFuryGlobalValue auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	game.GetPlayer().RestoreActorValue("Magicka", SpellFuryGlobalValue.GetValue() as Float)
endEvent