scriptName MRL_ChooseBoundRanged extends activemagiceffect

Message Property ChooseRanged Auto ; 0 - LightBow, 1 - HeavyBow, 2 LightCrossbow, 3 - HeavyCrossbow
FormList Property ListOfRanged auto ; 0 - LightBow, 1 - HeavyBow, 2 LightCrossbow, 3 - HeavyCrossbow
Spell Property selfSpellToRemove auto ; remove after add spell

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int indexWeaponType = ChooseRanged.Show()
	Utility.Wait(1.0)
	akCaster.AddSpell(ListOfRanged.GetAt(indexWeaponType) as Spell, true)
	Utility.Wait(1.0)
	akCaster.RemoveSpell(selfSpellToRemove)
endEvent
