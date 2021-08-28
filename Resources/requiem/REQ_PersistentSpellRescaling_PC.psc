Scriptname REQ_PersistentSpellRescaling_PC extends REQ_PlayerAlias
{remove and reapply a set of spells each time the player closes the perk menu to apply rescaling
factors from new perks. Spells in the list are skipped if the player doesn't already have them.}

FormList Property SpellsToReapply Auto
{reapply each of these persistent spells when the player closes the perk menu and has the spell}

Event OnMenuClose(string menu)
	ReapplySpells()
EndEvent

Function ReapplySpells()
    Int index = spellsToReapply.getSize()
    While ( index > 0 )
        index = index - 1
        Spell persistentSpell = spellsToReapply.getAt(index) as Spell
        If (persistentSpell != None && player.hasSpell(persistentSpell))
            player.removeSpell(persistentSpell)
            Utility.wait(0.05)
            player.addSpell(persistentSpell, false)
        EndIf
    EndWhile
EndFunction

Event OnPlayerLoadGame()
	RegisterForMenu("StatsMenu")
EndEvent

Event ScriptInit(string eventName, string strArg, float numArg, Form sender)
	ReapplySpells()
	RegisterForMenu("StatsMenu")
    parent.ScriptInit(eventName, strArg, numArg, sender)
EndEvent

Event ScriptShutDown(string eventName, string strArg, float numArg, Form sender)
    UnregisterForAllMenus()
    parent.ScriptShutDown(eventName, strArg, numArg, sender)
EndEvent
