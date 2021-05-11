Scriptname ORD_TrainedRabbit_Script extends activemagiceffect  

; -----

Quest Property ORD_TrainedRabbit_Quest Auto
Float Property ORD_WaitBeforeStart = 0.1 Auto
Sound Property ORD_Pic_TrainedRabbit_Marker Auto
Message Property ORD_Pic_TrainedRabbit_Message_Fail Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_Pic_TrainedRabbit_Marker
		ORD_Pic_TrainedRabbit_Marker.Play(akTarget)
	EndIf
	RegisterForSingleUpdate(ORD_WaitBeforeStart)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_TrainedRabbit_Quest.Stop()

EndEvent

; -----

Event OnUpdate()

	ORD_TrainedRabbit_Quest.Start()
	Utility.Wait(1.0)
	If !ORD_TrainedRabbit_Quest.IsRunning()
		ORD_Pic_TrainedRabbit_Message_Fail.Show()
	EndIf

EndEvent

; -----