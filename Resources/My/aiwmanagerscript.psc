Scriptname AIWManagerScript extends Quest
{This script constantly updates the widget}

AIWidgetScript Property AIW Auto

Event OnInit()
	RegisterForSingleUpdate(0.1)
EndEvent

Event OnUpdate()
	AIW.updateStatus()
	RegisterForSingleUpdate(0.1)
EndEvent
