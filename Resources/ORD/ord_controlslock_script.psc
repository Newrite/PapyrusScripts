Scriptname ORD_ControlsLock_Script extends activemagiceffect  

; -----

Bool Property ORD_Move Auto
Bool Property ORD_Fight Auto
Bool Property ORD_Menu Auto
Bool Property ORD_Look Auto

; -----

Bool DidSomething = false

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If (!ORD_Move || Game.IsMovementControlsEnabled()) && (!ORD_Fight || Game.IsFightingControlsEnabled()) && (!ORD_Menu || Game.IsMenuControlsEnabled())&& (!ORD_Look || Game.IsLookingControlsEnabled())
		Game.DisablePlayerControls(ORD_Move, ORD_Fight, false, ORD_Look, false, ORD_Menu, false, false, 0)
		DidSomething = true
	Else
		Dispel()

	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If DidSomething
		Game.EnablePlayerControls()
	EndIf

EndEvent

; -----