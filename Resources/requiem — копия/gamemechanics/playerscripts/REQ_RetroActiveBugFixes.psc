Scriptname REQ_RetroActiveBugFixes extends REQ_PlayerAlias
{this script applies one-time changes after an update to fix bugs from prior versions}

GlobalVariable Property VersionPlugin Auto
GlobalVariable Property VersionSavegame Auto

Actor Property elenwen Auto

Perk Property WindRunner Auto

Event ScriptInit(string eventName, string strArg, float numArg, Form sender)
    If (VersionSavegame.getValueInt() > 0)
        Apply_3_0_2_to_3_1_0_fixes()
        Apply_3_1_1_to_3_2_0_fixes()
    EndIf
	parent.ScriptInit(eventName, strArg, numArg, sender)
EndEvent

Function Apply_3_0_2_to_3_1_0_fixes()
    If (VersionSavegame.getValueInt() <= 30002 && VersionPlugin.getValueInt() >= 30100)
        ; let Elenwen wear her new outfit
        If (!Elenwen.IsDead() && Elenwen.IsEnabled())
            elenwen.disable()
            Utility.wait(0.1)
            elenwen.enable()
        EndIf
    EndIf
EndFunction

Function Apply_3_1_1_to_3_2_0_fixes()
    If (VersionSavegame.getValueInt() <= 30101 && VersionPlugin.getValueInt() >= 30200)
        If (Player.HasPerk(WindRunner))
            Player.RemovePerk(WindRunner)          
            Player.AddPerk(WindRunner)          
        EndIf
    EndIf
EndFunction
