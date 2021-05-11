Scriptname ORD_Mutiny_Script extends activemagiceffect  

; -----

Quest Property ORD_Mutiny_Quest Auto
Sound Property ORD_Pic_Mutiny_Marker Auto
Message Property ORD_Pic_Mutiny_Message_Fail Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Pic_Mutiny_Marker.Play(akTarget)
	ORD_Mutiny_Quest.Start()
	Utility.Wait(1.0)
	If !ORD_Mutiny_Quest.IsRunning()
		ORD_Pic_Mutiny_Message_Fail.Show()
		Dispel()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Mutiny_Quest.Stop()

EndEvent

; -----