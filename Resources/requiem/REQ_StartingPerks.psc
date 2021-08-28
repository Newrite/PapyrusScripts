Scriptname REQ_StartingPerks extends REQ_PlayerAlias
{three free perks for the player at the beginning + hidden background perks}

GlobalVariable Property DoOnce Auto
{controls that the 3 free perks are granted only once}
Perk[] Property HiddenPerks Auto
{a list of all hidden perks that shall be added to the player}
Spell[] Property Startspells Auto
{starting spells, which should be removed}
Spell Property HeavyArmorUntrained Auto

Event ScriptInit(string eventName, string strArg, float numArg, Form sender)
	Int i = 0
	Int j = 0
	While (i < Hiddenperks.Length)
		Player.AddPerk(Hiddenperks[i])
		i += 1
	EndWhile
	If ( DoOnce.GetValue() < 1 )
		i = 0
		Game.AddPerkPoints(3)
		While (i < Startspells.Length)
			Player.RemoveSpell(Startspells[i])
			i += 1
		EndWhile
		DoOnce.SetValue(1) 
	EndIf
	REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	Int index = UpdateControl.Scripts.find(self)
	UpdateControl.ShutdownReady[index] = False
EndEvent

Event ScriptShutDown(string eventName, string strArg, float numArg, Form sender)
	Int i = 0
	While (i < Hiddenperks.Length)
		Player.RemovePerk(Hiddenperks[i])
		i += 1
	EndWhile
	Player.RemoveSpell(HeavyArmorUntrained)
	REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	Int index = UpdateControl.Scripts.find(self)
	UpdateControl.ShutdownReady[index] = True
EndEvent
