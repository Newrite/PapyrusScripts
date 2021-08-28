Scriptname REQ_MCM_DataStorage extends REQ_PlayerAlias
{A storage script containing all the MCM settings data.}

REQ_MCM Property mcm Auto
REQ_MCM_Skills Property mcm_skills Auto

int Property iHoursToRespawnCell Auto
int Property iHoursToRespawnCellCleared Auto
float Property fPlayerDeathReloadTime Auto
float Property fDiffMultHPByPCL Auto
float Property fDiffMultHPToPCL Auto
GlobalVariable Property WIWaitDragon Auto
float Property fPlayerHealthHeartbeatSlow Auto
float Property fJumpHeightMin Auto
GlobalVariable Property REQ_Skills_RateFactor Auto
GlobalVariable Property TimeScale Auto
GlobalVariable Property REQ_Debug_ArmorTraining Auto
GlobalVariable Property REQ_Compatibility_AttackSpeed Auto
GlobalVariable Property REQ_Combat_NoDragonFear Auto
GlobalVariable Property REQ_Combat_EssentialAgain Auto
GlobalVariable Property REQ_Combat_NoOnHitDisarm Auto
GlobalVariable Property REQ_Atmosphere_AllowFastTravel Auto
GlobalVariable Property REQ_Combat_NoFearAndYield Auto
GlobalVariable Property REQ_Debug_OnHit Auto
GlobalVariable Property REQ_Combat_NoHorseTrample Auto
GlobalVariable Property REQ_Compatibility_NonCriticalWarnOverride Auto
GlobalVariable Property REQ_Atmosphere_NoPoisonISM Auto
GlobalVariable Property REQ_Skills_HideClutterRecipes Auto
GlobalVariable Property REQ_Atmosphere_SlowerHorses Auto
GlobalVariable Property REQ_Skills_NoSmithingBooks Auto
GlobalVariable Property REQ_Debug_ExhaustionReset Auto
Perk Property REQ_MechanicsPerk_Stress_Exhaustion Auto
GlobalVariable Property REQ_Atmosphere_VampireRandomCarnage Auto
GlobalVariable Property REQ_Combat_NoDeathHandling Auto
GlobalVariable Property REQ_Debug_MassEffectReset Auto
GlobalVariable Property REQ_Atmosphere_KillmoveHealthThreshold Auto

Bool Property initdone = False Auto

Event ScriptInit(string eventName, string strArg, float numArg, Form sender)
    String[] pages = new String[4]
    pages[0] = "$REQ_cat_0"
    pages[1] = "$REQ_cat_1"
    pages[2] = "$REQ_cat_2"
    pages[3] = "$REQ_cat_3"
    mcm.pages = pages
    mcm.modname = "$REQ_modname"
	mcm_skills.modname = "$REQ_modname_skills"
	mcm_skills.pages = new String[3]
	mcm_skills.pages[0] = "$REQ_cat_skill0"
	mcm_skills.pages[1] = "$REQ_cat_skill_expertise"
	mcm_skills.pages[2] = "$REQ_cat_skill1"
	mcm_skills.player = Player
    LoadInitValues()
    REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
    Int index = UpdateControl.Scripts.find(self)
    UpdateControl.ShutdownReady[index] = False
    initdone = true
EndEvent

Event ScriptShutDown(string eventName, string strArg, float numArg, Form sender)
    UpdateValues()
    REQ_AutoUpdater UpdateControl = GetOwningQuest().GetAlias(0) as REQ_AutoUpdater
    Int index = UpdateControl.Scripts.find(self)
    UpdateControl.ShutdownReady[index] = True
EndEvent

Event OnPlayerLoadGame()
    UpdateValues()
EndEvent

Function UpdateValues()
    REQ_MCM_DataStorage data = self
    Game.GetPlayer().ModAV("CarryWeight", -0.01)
    Utility.Wait(0.1)
    Game.GetPlayer().ModAV("CarryWeight", 0.01)
    Game.SetGameSettingint("iHoursToRespawnCell", data.iHoursToRespawnCell)
    Game.SetGameSettingint("iHoursToRespawnCellCleared", data.iHoursToRespawnCellCleared)
    Game.SetGameSettingfloat("fPlayerDeathReloadTime", data.fPlayerDeathReloadTime)
    Game.SetGameSettingfloat("fDiffMultHPByPCL", data.fDiffMultHPByPCL)
    Game.SetGameSettingFloat("fDiffMultHPByPCVE", Game.GetGameSettingFloat("fDiffMultHPByPCL"))
    Game.SetGameSettingFloat("fDiffMultHPByPCE", Game.GetGameSettingFloat("fDiffMultHPByPCL"))
    Game.SetGameSettingFloat("fDiffMultHPByPCN", Game.GetGameSettingFloat("fDiffMultHPByPCL"))
    Game.SetGameSettingFloat("fDiffMultHPByPCH", Game.GetGameSettingFloat("fDiffMultHPByPCL"))
    Game.SetGameSettingFloat("fDiffMultHPByPCVH", Game.GetGameSettingFloat("fDiffMultHPByPCL"))
    Game.SetGameSettingfloat("fDiffMultHPToPCL", data.fDiffMultHPToPCL)
    Game.SetGameSettingFloat("fDiffMultHPToPCVE", Game.GetGameSettingFloat("fDiffMultHPToPCL"))
    Game.SetGameSettingFloat("fDiffMultHPToPCE", Game.GetGameSettingFloat("fDiffMultHPToPCL"))
    Game.SetGameSettingFloat("fDiffMultHPToPCN", Game.GetGameSettingFloat("fDiffMultHPToPCL"))
    Game.SetGameSettingFloat("fDiffMultHPToPCH", Game.GetGameSettingFloat("fDiffMultHPToPCL"))
    Game.SetGameSettingFloat("fDiffMultHPToPCVH", Game.GetGameSettingFloat("fDiffMultHPToPCL"))
    Game.SetGameSettingfloat("fPlayerHealthHeartbeatSlow", data.fPlayerHealthHeartbeatSlow)
    Game.SetGameSettingFloat("fPlayerHealthHeartbeatFast",Game.GetGameSettingFloat("fPlayerHealthHeartbeatSlow") / 2.0)
    Game.SetGameSettingfloat("fJumpHeightMin", data.fJumpHeightMin)
    Game.EnableFastTravel(data.REQ_Atmosphere_AllowFastTravel.GetValueInt() as Bool)
    initdone = true
EndFunction

Function LoadInitValues()
    REQ_MCM_DataStorage data = self
    data.iHoursToRespawnCell = Game.GetGameSettingint("iHoursToRespawnCell")
    data.iHoursToRespawnCellCleared = Game.GetGameSettingint("iHoursToRespawnCellCleared")
    data.fPlayerDeathReloadTime = Game.GetGameSettingfloat("fPlayerDeathReloadTime")
    data.fDiffMultHPByPCL = Game.GetGameSettingfloat("fDiffMultHPByPCL")
    data.fDiffMultHPToPCL = Game.GetGameSettingfloat("fDiffMultHPToPCL")
    data.fPlayerHealthHeartbeatSlow = Game.GetGameSettingfloat("fPlayerHealthHeartbeatSlow")
    data.fJumpHeightMin = Game.GetGameSettingfloat("fJumpHeightMin")
EndFunction
