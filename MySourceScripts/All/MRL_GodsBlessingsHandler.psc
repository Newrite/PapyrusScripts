Scriptname MRL_GodsBlessingsHandler extends Quest
{This script handle applys blessings.}

FormList Property GodsAbilitysList Auto

Spell PerkBlessing = none

Spell Property AedraToken  Auto
Spell Property DaedraToken  Auto


Event OnInit()
	Utility.Wait(5.0)
	Game.GetPlayer().AddSpell(AedraToken, false)
	Game.GetPlayer().AddSpell(DaedraToken, false)
    ;Debug.Notification("Init handler")
EndEvent

Function DispellAllBlessingsExcept(Spell Blessing)
    ;Debug.Notification("DispellAllBlessingsExcept")

	int index = GodsAbilitysList.GetSize()

    While index

        index -= 1
        Spell BlessingFromList = GodsAbilitysList.GetAt(index) as Spell

        If BlessingFromList && Blessing != BlessingFromList
            
            Game.GetPlayer().RemoveSpell(BlessingFromList)

        EndIf

    EndWhile

EndFunction

Function DispellAllBlessings()
    ;Debug.Notification("DispellAllBlessings")

	int index = GodsAbilitysList.GetSize()

    While index

        index -= 1
        Spell BlessingFromList = GodsAbilitysList.GetAt(index) as Spell

        If BlessingFromList
            
            Game.GetPlayer().RemoveSpell(BlessingFromList)

        EndIf

    EndWhile

EndFunction

Function AddBlessing(Spell Blessing)
    ;Debug.Notification("AddBlessing")

	if PerkBlessing

		DispellAllBlessingsExcept(PerkBlessing)
		Utility.WaitMenuMode(0.25)
		Game.GetPlayer().AddSpell(Blessing)

		return

	endif

	DispellAllBlessings()
	Game.GetPlayer().AddSpell(Blessing)

EndFunction

Function AddBlessingFromPaladinPerk(Spell Blessing)
    ;Debug.Notification("AddBlessingFromPaladinPerk")

	PerkBlessing = Blessing
	Utility.WaitMenuMode(0.25)
	Game.GetPlayer().AddSpell(Blessing)

EndFunction