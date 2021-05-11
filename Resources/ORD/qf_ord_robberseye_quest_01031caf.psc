;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_ORD_RobbersEye_Quest_01031CAF Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Eye
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Eye Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Container
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Container Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
ORD_Loc_RobbersEye_Global_CurrentLockStrength.SetValue(Alias_ORD_Container.GetRef().GetLockLevel())
; because getlocklevel doesn't work when the lock is already being picked
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_ORD_Eye.GetRef().Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property ORD_Loc_RobbersEye_Global_CurrentLockStrength  Auto  
