Scriptname MRL_CurseQuest extends ReferenceAlias  

Spell Property curseAbility  Auto
Spell Property curseDesc01  Auto
Spell Property curseDesc02 Auto
Perk Property cursePerk Auto


Event OnInit()
	Utility.Wait(5.0)
	Game.GetPlayer().AddSpell(curseAbility, false)
	Game.GetPlayer().AddSpell(curseDesc01, false)
	Game.GetPlayer().AddSpell(curseDesc02, false)
	Game.GetPlayer().AddPerk(cursePerk)
EndEvent