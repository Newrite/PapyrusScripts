scriptName MRL_ChooseBoundMelee extends activemagiceffect

Message Property MainChoose Auto ; 0 - 2H, 1 - 1H
Message Property Choose1H Auto ; 0 - Sword, 1 - Axe, 2 - Mace, 3 - Dagger
Message Property Choose2H Auto ; 0 - Sword, 1 - Axe, 2 - Warhammer, 3 - BattleStaff, 4 - Pike
FormList Property ListOf1H auto ; 0 - Sword, 1 - Axe, 2 - Mace, 3 - Dagger
FormList Property ListOf2H auto ; 0 - Sword, 1 - Axe, 2 - Warhammer, 3 - BattleStaff, 4 - Pike
Spell Property selfSpellToRemove auto ; remove after add spell

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int indexWeapon
	int indexWeaponType = MainChoose.Show()
	Utility.Wait(1.0)
	if indexWeaponType == 0
		indexWeapon = Choose2H.Show()
		Utility.Wait(1.0)
		akCaster.AddSpell(ListOf2H.GetAt(indexWeapon) as Spell, true)
	elseif indexWeaponType == 1
		indexWeapon = Choose1H.Show()
		Utility.Wait(1.0)
		akCaster.AddSpell(ListOf1H.GetAt(indexWeapon) as Spell, true)
	endif
	Utility.Wait(1.0)
	akCaster.RemoveSpell(selfSpellToRemove)
endEvent
