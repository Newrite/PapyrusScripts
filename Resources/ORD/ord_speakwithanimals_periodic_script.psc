Scriptname ORD_SpeakWithAnimals_Periodic_Script extends Quest  


; -----

Float Property ORD_UpdateRate Auto
ReferenceAlias Property ORD_Target Auto
Actor Property PlayerRef Auto
Float Property ORD_Distance Auto
Message Property ORD_Spe_SpeakWithAnimals_Message_Blink Auto

; -----

Function StartPinging()

	RegisterForSingleUpdate(ORD_UpdateRate)

EndFunction

; -----

Function StopPinging()


EndFunction

; -----

Event OnUpdate()

	Actor TheTarget = ORD_Target.GetActorReference()
	If TheTarget && PlayerRef.GetDistance(TheTarget) > ORD_Distance
		TheTarget.MoveTo(PlayerRef)
		ORD_Spe_SpeakWithAnimals_Message_Blink.Show()
	EndIf
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----


