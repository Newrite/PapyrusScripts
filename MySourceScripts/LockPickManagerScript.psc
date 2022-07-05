Scriptname LockPickManagerScript extends Quest
{This script constantly updates the widget}

LockPickScript Property LPW Auto

Event OnInit()
		RegisterForSingleUpdate(1.0)
		
endEvent

Event OnUpdate()
		Debug.Notification("OnUpdate")
		LPW.updateStatus()
		RegisterForSingleUpdate(1.0)
EndEvent
