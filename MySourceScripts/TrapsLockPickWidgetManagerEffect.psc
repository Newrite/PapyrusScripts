Scriptname TrapsLockPickWidgetManagerEffect extends ActiveMagicEffect
{This script constantly updates the widget}

TrapsLockPickWidgetScript Property TLPWS Auto

Formlist Property TrapsItems Auto
Formlist Property TrapsItemBags Auto

Keyword Property FireTrap Auto
Keyword Property FrostTrap Auto
Keyword Property ShockTrap Auto
Keyword Property PoisonTrap Auto
Keyword Property StunnedTrap Auto
Keyword Property ExplosionTrap Auto

actor Player

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Player = akTarget
	UpdateTraps()
EndEvent

Function UpdateTraps()

	int i = 0
	int size = TrapsItemBags.GetSize()

	While i < size

		if Player.IsEquipped(TrapsItemBags.GetAt(i) as Form)

			if Player.WornHasKeyword(FireTrap)
				TLPWS.SetUIState(true)
				TLPWS.SetTrapFire(TrapsItems.GetAt(i) as Form)
				return
			endif

			if Player.WornHasKeyword(FrostTrap)
				TLPWS.SetUIState(true)
				TLPWS.SetTrapFrost(TrapsItems.GetAt(i) as Form)
				return
			endif

			if Player.WornHasKeyword(ShockTrap)
				TLPWS.SetUIState(true)
				TLPWS.SetTrapLightning(TrapsItems.GetAt(i) as Form)
				return
			endif

			if Player.WornHasKeyword(PoisonTrap)
				TLPWS.SetUIState(true)
				TLPWS.SetTrapPoison(TrapsItems.GetAt(i) as Form)
				return
			endif

			if Player.WornHasKeyword(StunnedTrap)
				TLPWS.SetUIState(true)
				TLPWS.SetTrapStunned(TrapsItems.GetAt(i) as Form)
				return
			endif

			if Player.WornHasKeyword(ExplosionTrap)
				TLPWS.SetUIState(true)
				TLPWS.SetTrapExplosion(TrapsItems.GetAt(i) as Form)
				return
			endif

		endif

		i += 1
	EndWhile

	TLPWS.SetUIState(false)

EndFunction

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)

  	if akBaseObject as Armor
		Utility.WaitMenuMode(1.0)
		UpdateTraps()
  	endif

endEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

  	if akBaseObject as Armor
		UpdateTraps()
  	endif

endEvent
