;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 43
Scriptname PRKF_ORD_Alt50_CommandLock_P_0101B5AA Extends Perk Hidden

;BEGIN FRAGMENT Fragment_13
Function Fragment_13(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ORD_Alt_CommandLock_Global_NextActivate.SetValue(pGameDaysPassed.GetValue()+0.25)
akTargetRef.SetLockLevel(0)
; command lock
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property ORD_Alt_CommandLock_Global_NextActivate Auto  
GlobalVariable Property pGameDaysPassed  Auto  

Actor Property PlayerRef  Auto  
