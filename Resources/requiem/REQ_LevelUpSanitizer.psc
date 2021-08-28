Scriptname REQ_LevelUpSanitizer extends REQ_PlayerAlias  
{this script will prevent levelups from restoring your attributes}

Float health = 0.0
Float magicka = 0.0
Float stamina = 0.0
Float maxhealth = 0.0
Float maxmagicka = 0.0
Float maxstamina = 0.0

Event OnMenuClose(String MenuName)
	Float maxdiff
	ActorValueInfo valueinfo
	valueinfo = ActorValueInfo.GetActorValueInfoByName("Health")
	maxdiff = valueinfo.GetMaximumValue(Player) - maxhealth
	Player.DamageAV("Health", Player.GetAV("Health") - health - maxdiff)
	health = Player.GetAV("Health")
	maxhealth = valueinfo.GetMaximumValue(Player)
	
	valueinfo = ActorValueInfo.GetActorValueInfoByName("Magicka")
	maxdiff = valueinfo.GetMaximumValue(Player) - maxmagicka
	Player.DamageAV("Magicka", Player.GetAV("Magicka") - magicka - maxdiff)
	magicka = Player.GetAV("Magicka")
	maxmagicka = valueinfo.GetMaximumValue(Player)
	
	valueinfo = ActorValueInfo.GetActorValueInfoByName("Stamina")
	maxdiff = valueinfo.GetMaximumValue(Player) - maxstamina
	Player.DamageAV("Stamina", Player.GetAV("Stamina") - stamina - maxdiff)
	stamina = Player.GetAV("Stamina")
	maxstamina = valueinfo.GetMaximumValue(Player)
EndEvent

Event OnMenuOpen(String MenuName)
	ActorValueInfo valueinfo
	health = Player.GetAV("Health")
	magicka = Player.GetAV("Magicka")
	stamina = Player.GetAV("Stamina")
	valueinfo = ActorValueInfo.GetActorValueInfoByName("Health")
	maxhealth = valueinfo.GetMaximumValue(Player)
	valueinfo = ActorValueInfo.GetActorValueInfoByName("Magicka")
	maxmagicka = valueinfo.GetMaximumValue(Player)
	valueinfo = ActorValueInfo.GetActorValueInfoByName("Stamina")
	maxstamina = valueinfo.GetMaximumValue(Player)
EndEvent

Event OnPlayerLoadGame()
	RegisterForMenu("StatsMenu")
EndEvent

Event ScriptInit(string eventName, string strArg, float numArg, Form sender)
	RegisterForMenu("StatsMenu")
	REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	Int index = UpdateControl.Scripts.find(self)
	UpdateControl.ShutdownReady[index] = False
EndEvent

Event ScriptShutDown(string eventName, string strArg, float numArg, Form sender)
	UnregisterForAllMenus()
	REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
	Int index = UpdateControl.Scripts.find(self)
	UpdateControl.ShutdownReady[index] = True
EndEvent