Scriptname MRL_EnchQuest extends ReferenceAlias  

Spell Property updateAbility Auto
Perk Property Crit Auto
Perk Property EnchDamagePower Auto
Perk Property EnchDamageCrit Auto


Event OnInit()
	Utility.Wait(5.0)
	Game.GetPlayer().AddSpell(updateAbility, false)
	Game.GetPlayer().AddPerk(Crit)
	Game.GetPlayer().AddPerk(EnchDamagePower)
	Game.GetPlayer().AddPerk(EnchDamageCrit)

EndEvent