;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname PRKF_ORD_Loc30_BearTraps_Per_010306CB Extends Perk Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
If akTargetRef.GetBaseObject() == ORD_Loc_BearTraps_Activator
	; player created bear trap so delete it
	akTargetRef.Delete()
Else
	; preset bear trap so disable it
	akTargetRef.Disable()
EndIf
ORD_PickUpSound.Play(akActor)
akActor.AddItem(ORD_Loc_BearTraps_MiscItem)
;Debug.Trace("ORDINATOR DEBUG: Picked up a Bear Trap!",0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property ORD_PickUpSound  Auto  

MiscObject Property ORD_Loc_BearTraps_MiscItem  Auto  

Activator Property ORD_Loc_BearTraps_Activator  Auto  
