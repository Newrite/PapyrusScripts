Scriptname ORD_PlaythingTeleport_Script extends activemagiceffect  

; -----

Quest Property ORD_DaedricPlaything_Quest_BadLuck_Teleport Auto
ReferenceAlias Property ORD_Target Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_DaedricPlaything_Quest_BadLuck_Teleport.Start()
	Utility.Wait(0.5)
	If ORD_Target.GetRef() != NONE
		akTarget.MoveTo(ORD_Target.GetRef())
	EndIf
	Utility.Wait(0.5)
	ORD_DaedricPlaything_Quest_BadLuck_Teleport.Stop()

EndEvent

; -----