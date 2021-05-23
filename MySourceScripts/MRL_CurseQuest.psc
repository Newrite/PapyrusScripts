Scriptname MRL_CurseQuest extends ReferenceAlias  

Spell Property curseAbility  Auto
Spell Property curseDesc  Auto


Event OnInit()
	Utility.Wait(5.0)
	Game.GetPlayer().AddSpell(curseAbility, false)
	Game.GetPlayer().AddSpell(curseDesc, false)
EndEvent