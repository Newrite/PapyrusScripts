Scriptname ORD_WanderingWarrior_KillFarm_Script extends activemagiceffect  

; -----

String Property ORD_StatToQuery1 Auto
String Property ORD_StatToQuery2 Auto
GlobalVariable Property ORD_One_WanderingWarrior_Global_Threshold Auto
GlobalVariable Property ORD_One_WanderingWarrior_Global_Count Auto
Message Property ORD_One_WanderingWarrior_Message Auto

; -----

Int StatQueried

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	StatQueried = Game.QueryStat(ORD_StatToQuery1) + Game.QueryStat(ORD_StatToQuery2)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If (Game.QueryStat(ORD_StatToQuery1) + Game.QueryStat(ORD_StatToQuery2)) >= StatQueried + ORD_One_WanderingWarrior_Global_Threshold.GetValue()
		ORD_One_WanderingWarrior_Global_Count.Mod(1)
		akTarget.ModActorValue("OneHandedPowerMod", 1)
		ORD_One_WanderingWarrior_Message.Show(ORD_One_WanderingWarrior_Global_Count.GetValue())
	EndIf

EndEvent

; -----