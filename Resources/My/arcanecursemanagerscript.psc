Scriptname arcanecursemanagerscript extends Quest
{This script constantly updates the widget}

arcanecursewidgetscript Property ACW Auto

Event OnInit()
		RegisterForSingleUpdate(1.0)
		
endEvent

Event OnUpdate()
		ACW.updateStatus()
		RegisterForSingleUpdate(1.0)
EndEvent
