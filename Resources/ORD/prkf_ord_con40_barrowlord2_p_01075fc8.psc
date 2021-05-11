;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 41
Scriptname PRKF_ORD_Con40_BarrowLord2_P_01075FC8 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_29
Function Fragment_29(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
; apply spell
akActor.DoCombatSpellApply(ORD_BarrowLordClear, akTargetRef as Actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
; apply
akActor.DoCombatSpellApply(ORD_BarrowLordHoldPosition, (akTargetRef as Actor))
ORD_Con_BoneCollector_Message_Help_OrderDuration.ShowAsHelpMessage("BoneCollector_OrderDuration", 7, 10, 1)
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
; apply spell
akActor.DoCombatSpellApply(ORD_BarrowLordFollowPlayer, akTargetRef as Actor)
ORD_Con_BoneCollector_Message_Help_OrderDuration.ShowAsHelpMessage("BoneCollector_OrderDuration", 7, 10, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
(akTargetRef as Actor).OpenInventory(true)
; placeholder
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property ORD_BarrowLordHoldPosition  Auto  

SPELL Property ORD_BarrowLordFollowPlayer  Auto  

SPELL Property ORD_BarrowLordClear  Auto  

Message Property ORD_Con_BoneCollector_Message_Help_OrderDuration  Auto  
