Scriptname ORD_BearTrap_Activator_Script extends ObjectReference  

; -----

ORD_TrapHitBase_Script HitBase
Bool Property ORD_StartOpen = true Auto
Float Property ORD_LockpickingDamageMult Auto
Perk Property ORD_Loc50_BigGameHunter_Perk_50_OrdASISExclude Auto
Actor Property PlayerRef Auto

; -----

Event onReset()

	GoToState("Closed")
	Self.Reset()

EndEvent

; -----

Event OnLoad()

	HitBase = (Self as objectReference) as ORD_TrapHitBase_Script
	HitBase.ORD_Damage = Math.Ceiling(Game.GetPlayer().GetActorValue("Lockpicking") * ORD_LockpickingDamageMult)
	Utility.Wait(0.50)
	If ORD_StartOpen
;		PlayAnimation("StartOpen")
		PlayAnimationAndWait("Reset01","Trans02")
		GoToState("Open")
	EndIf

EndEvent

; -----

Auto State Closed

	Event OnBeginState()
		If PlayerRef.HasPerk(ORD_Loc50_BigGameHunter_Perk_50_OrdASISExclude)
			BlockActivation(true)
			RegisterForSingleUpdate(2.5)
		EndIf
	EndEvent

	Event OnEndState()
		UnregisterForUpdate()
	EndEvent
	
	Event OnTriggerEnter(objectReference TriggerRef)
	EndEvent
	
	Event OnActivate(objectReference akTriggerRef)
		PlayAnimationAndWait("Reset01","Trans02")
		GoToState("Open")
	EndEvent

	Event OnUpdate()
		PlayAnimationAndWait("Reset01","Trans02")
		BlockActivation(false)
		GoToState("Open")
	EndEvent
	
EndState

; -----

State Open

	Event OnBeginState()
		HitBase.GoToState("CanHit")
	EndEvent

	Event OnTriggerEnter(objectReference TriggerRef)
		PlayAnimation("Trigger01")
		HitBase.GoToState("CanHit")
		GoToState("Busy")
		WaitForAnimationEvent("Trans01")
		HitBase.GoToState("CannotHit")
		GoToState("Closed")
	EndEvent

	Event OnActivate(objectReference TriggerRef)
		GoToState("Busy")
		HitBase.GoToState("CannotHit")
		PlayAnimationAndWait("Trigger01","Trans01")
		GoToState("Closed")
	EndEvent

EndState

; -----

State Busy

	Event OnBeginState()
	EndEvent

EndState

; -----

Event OnTriggerEnter(objectReference akTriggerRef)
EndEvent
	
Event OnActivate(objectReference akTriggerRef)
EndEvent

; -----
