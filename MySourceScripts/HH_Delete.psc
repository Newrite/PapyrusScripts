Scriptname HH_Delete extends ObjectReference  
Event OnInit()

	RegisterForSingleUpdateGameTime(1)
	
endEvent

Event OnUpdate()
	DestroyItem()
EndEvent

Function DestroyItem()
	If !(Self.IsNearPlayer())
		Self.Delete()
	Else 
		RegisterForSingleUpdateGameTime(1)
	EndIf
EndFunction