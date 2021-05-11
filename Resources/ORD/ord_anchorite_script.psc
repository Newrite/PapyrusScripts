Scriptname ORD_Anchorite_Script extends activemagiceffect  

; -----

ObjectReference Property ORD_Alt_Anchorite_Light Auto
ObjectReference Property MapMarker Auto
ObjectReference Property XMarker Auto
Actor Property PlayerRef Auto
ImagespaceModifier Property ORD_Alt_Anchorite_Imod Auto
Float Property ORD_Height Auto
Message Property ORD_Alt_Anchorite_Message_Which Auto
Message Property ORD_Alt_Anchorite_Message Auto
ImagespaceModifier Property ORD_Alt_Cast_Imod Auto

; -----

; ObjectReference AncL
; ObjectReference AncM

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Alt_Anchorite_Light.MoveTo(PlayerRef, 0, 0, ORD_Height)
	MapMarker.MoveTo(PlayerRef)

	; AncL = ORD_Alt_Anchorite_Light
	; AncM = MapMarker
	; to keep the objects in memory so they don't get reset

	If ORD_Alt_Anchorite_Message_Which.Show()
		ORD_Alt_Anchorite_Light.Disable()
	Else
		ORD_Alt_Anchorite_Light.Enable()
	EndIf
	Utility.Wait(0.01)
	ORD_Alt_Cast_Imod.Apply()
	ORD_Alt_Anchorite_Message.Show()

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Alt_Anchorite_Light.MoveTo(XMarker)
	MapMarker.MoveTo(XMarker)

EndEvent

; -----