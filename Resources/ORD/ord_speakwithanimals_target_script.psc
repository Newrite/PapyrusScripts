Scriptname ORD_SpeakWithAnimals_Target_Script extends ReferenceAlias  

; -----

Quest Property ORD_SpeakWithAnimals_Quest Auto
Message Property ORD_Spe_SpeakWithAnimals_Message_Dead Auto

; -----

Event OnDeath(Actor akKiller)

	Utility.Wait(0.5)
	ORD_Spe_SpeakWithAnimals_Message_Dead.Show()
	ORD_SpeakWithAnimals_Quest.Stop()

EndEvent

; -----