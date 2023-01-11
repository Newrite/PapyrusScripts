Scriptname zzzSXPSkillHelper extends Quest

zzzSXPConfig Property XPConfig Auto  

Event OnStoryIncreaseSkill(string asSkill)
	int id = XPConfig.GetSkillInteger(asSkill)
	XPConfig.UpdateSpecificSkill(id)
	XPConfig.PlayerBonusLevel()
	Stop()
EndEvent