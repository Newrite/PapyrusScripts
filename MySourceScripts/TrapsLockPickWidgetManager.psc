Scriptname TrapsLockPickWidgetManager extends Quest
{This script constantly updates the widget}

TrapsLockPickWidgetScript Property TLPWS Auto

Spell Property EquipHandler Auto

Event OnInit()
		Game.GetPlayer().AddSpell(EquipHandler)
		RegisterForSingleUpdate(1.0)
endEvent

Event OnUpdate()
		TLPWS.updateStatus()
		RegisterForSingleUpdate(1.0)
EndEvent
