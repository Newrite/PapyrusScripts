Scriptname ORD_AggroTrigger_Script extends ObjectReference  

; -----

Auto State ListeningForInput

	Event OnTriggerEnter(ObjectReference akTriggerRef)

		If akTriggerRef == Game.GetPlayer()
			GotoState("NotListening")
			(GetLinkedRef() as Actor).StartCombat(Game.GetPlayer())
		EndIf

	EndEvent

EndState

; -----

State NotListening

EndState

; -----
