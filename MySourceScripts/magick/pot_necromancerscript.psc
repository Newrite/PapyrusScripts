Scriptname POT_NecromancerScript extends ObjectReference  

Quest Property POT_UnholyAscensionQuest  Auto  

Event OnDeath(Actor killer)
        POT_UnholyAscensionQuest.SetObjectiveCompleted(10)
	POT_UnholyAscensionQuest.SetStage(15)
EndEvent