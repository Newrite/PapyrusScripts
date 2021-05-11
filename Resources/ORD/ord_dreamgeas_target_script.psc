Scriptname ORD_DreamGeas_Target_Script extends ReferenceAlias  

; -----

Quest Property ORD_DreamGeas_Quest Auto
Message Property ORD_Ill_DreamGeas_Message_Dead Auto

; -----

Event OnDeath(Actor akKiller)

	Utility.Wait(0.5)
	ORD_Ill_DreamGeas_Message_Dead.Show()
	ORD_DreamGeas_Quest.Stop()

EndEvent

; -----