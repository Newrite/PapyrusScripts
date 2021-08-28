ScriptName REQ_HelgenTrigger extends ObjectReference
{addition to the Helgen Keep triggers, starting Requiem scripts}

Quest Property REQ_Playerscripts  Auto 

auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		If triggerRef == Game.getPlayer() as actor
			If (!REQ_PlayerScripts.IsRunning() )
				REQ_PlayerScripts.Start()
				REQ_PlayerScripts.OnStoryChangeLocation(Game.GetPlayer(), Game.GetPlayer().GetCurrentLocation(), Game.GetPlayer().GetCurrentLocation())
				GoToState("hasBeenTriggered")
			EndIf
		EndIf
	EndEvent
EndSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE
