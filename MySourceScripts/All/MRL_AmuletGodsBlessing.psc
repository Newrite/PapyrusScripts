Scriptname MRL_AmuletGodsBlessing extends ActiveMagicEffect
{This script handle applys blessings.}

FormList Property GodsAbilitysList Auto
FormList Property GodsAmuletList Auto

Idle Property IdleRitualSkull2  Auto 

MRL_GodsBlessingsHandler Property GodsHandler Auto 

Event OnEffectStart(Actor akTarget, Actor akCaster)
    
    Spell Blessing = FindBlessing(akTarget)

    if Blessing

        If akTarget.IsWeaponDrawn() 
			akTarget.SheatheWeapon()
		EndIf

		Game.ForceThirdPerson()
		Game.DisablePlayerControls()

		utility.Wait(1.5)

		akTarget.PlayIdle(IdleRitualSkull2)

		GodsHandler.AddBlessing(Blessing)
        
		Game.EnablePlayerControls()

    endif

EndEvent

Spell Function FindBlessing(Actor Prayer)

	int index = GodsAmuletList.GetSize()

    While index

        index -= 1
        Armor Amulet = GodsAmuletList.GetAt(index) as Armor

        If Amulet && Prayer.IsEquipped(Amulet)
            
            return GodsAbilitysList.GetAt(index) as Spell

        EndIf

    EndWhile

    return none

EndFunction