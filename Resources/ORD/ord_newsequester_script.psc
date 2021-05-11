Scriptname ORD_NewSequester_Script extends activemagiceffect  

; -----

Float Property ORD_Duration Auto
Activator Property ORD_Activator_Exile Auto

; -----

ObjectReference ActivatorRef

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.SetGhost(true)
	akTarget.Disable()
	ActivatorRef = akTarget.PlaceAtMe(ORD_Activator_Exile)

	Utility.Wait(ORD_Duration)

	ActivatorRef.DisableNoWait(true)
	akTarget.Enable()
	akTarget.SetGhost(false)

	Utility.Wait(2.0)
	ActivatorRef.Delete()

EndEvent

; -----