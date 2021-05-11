Scriptname ORD_Performer_Quest_Script extends Quest  

; -----

ReferenceAlias Property Spectator1 Auto
ReferenceAlias Property Spectator2 Auto
ReferenceAlias Property Spectator3 Auto
ReferenceAlias Property Spectator4 Auto
ReferenceAlias Property Spectator5 Auto
Idle Property IdleCiceroDance1 Auto
Idle Property IdleCiceroDance2 Auto
Idle Property IdleCiceroDance3 Auto
Float Property ORD_UpdateRate Auto

; -----

Actor Spec1
Actor Spec2
Actor Spec3
Actor Spec4
Actor Spec5

; -----

Function DanceLoop()

	Spec1 = Spectator1.GetActorRef()
	Spec2 = Spectator2.GetActorRef()
	Spec3 = Spectator3.GetActorRef()
	Spec4 = Spectator4.GetActorRef()
	Spec5 = Spectator5.GetActorRef()
	RegisterForSingleUpdate(ORD_UpdateRate)

EndFunction

; -----

Event OnUpdate()

	If Spec1
		Spec1.PlayIdle(IdleCiceroDance1)
	EndIf
	If Spec2
		Spec2.PlayIdle(IdleCiceroDance2)
	EndIf
	If Spec3
		Spec3.PlayIdle(IdleCiceroDance3)
	EndIf
	If Spec4
		Spec4.PlayIdle(IdleCiceroDance2)
	EndIf
	If Spec5
		Spec5.PlayIdle(IdleCiceroDance3)
	EndIf
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----