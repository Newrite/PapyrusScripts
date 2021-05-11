Scriptname ORD_DimensionDoor_Script extends ObjectReference  

; -----

Activator Property ORD_Alt_EmergencyTeleport_Activator Auto
EffectShader Property ORD_Alt_EmergencyTeleport_FXS_In Auto
EffectShader Property ORD_Alt_EmergencyTeleport_FXS_Out Auto
ObjectReference Property AnchoriteBox Auto
Spell Property ORD_Alt_DimensionDoor_Spell Auto
Sound Property ORD_Alt_EmergencyTeleport_Marker Auto

; -----

Event OnActivate(ObjectReference akActivator)

	Bool IsAlreadyGhost = (akActivator as Actor).IsGhost()
	Self.BlockActivation()
	ORD_Alt_EmergencyTeleport_FXS_Out.Play(akActivator)
	If !IsAlreadyGhost
		(akActivator as Actor).SetGhost(true)
	EndIf
	ObjectReference RippleAtTarget = akActivator.PlaceAtMe(ORD_Alt_EmergencyTeleport_Activator)

	Utility.Wait(0.5)
	
	akActivator.MoveTo(AnchoriteBox)
	akActivator.PlaceAtMe(ORD_Alt_EmergencyTeleport_Activator)
	(akActivator as Actor).DispelSpell(ORD_Alt_DimensionDoor_Spell)
	ORD_Alt_EmergencyTeleport_Marker.Play(akActivator)

	Utility.Wait(0.5)
	
	ORD_Alt_EmergencyTeleport_FXS_Out.Stop(akActivator)
	If !IsAlreadyGhost
		(akActivator as Actor).SetGhost(false)
	EndIf
	Self.BlockActivation(false)
	RippleAtTarget.Disable()
	RippleAtTarget.Delete()

EndEvent

; -----