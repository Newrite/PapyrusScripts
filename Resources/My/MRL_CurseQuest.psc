Scriptname MRL_CurseQuest extends ReferenceAlias  

Spell Property curseAbility  Auto


Event OnInit()
	Utility.Wait(5.0)
	Game.GetPlayer().AddSpell(curseAbility, false)
EndEvent