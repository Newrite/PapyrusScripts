;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_ORD_BurySkeletons_Quest_030FDAD4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Skel5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Skel5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Skel7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Skel7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Skel8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Skel8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_SkelB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_SkelB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Skel1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Skel1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Skel3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Skel3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Skel2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Skel2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_SkelC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_SkelC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Skel4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Skel4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Skel9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Skel9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Skel6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Skel6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_SkelA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_SkelA Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
ObjectReference TheBox = PlayerRef.PlaceAtMe(FXEmptyActivator)
TheBox.MoveTo(PlayerRef, 0, 0, -10000)

Alias_ORD_Skel1.GetReference().MoveTo(ORD_X)
Alias_ORD_Skel2.GetReference().MoveTo(ORD_X)
Alias_ORD_Skel3.GetReference().MoveTo(ORD_X)
Alias_ORD_Skel4.GetReference().MoveTo(ORD_X)
Alias_ORD_Skel5.GetReference().MoveTo(ORD_X)
Alias_ORD_Skel6.GetReference().MoveTo(ORD_X)
Alias_ORD_Skel7.GetReference().MoveTo(ORD_X)
Alias_ORD_Skel8.GetReference().MoveTo(ORD_X)
Alias_ORD_Skel9.GetReference().MoveTo(ORD_X)
Alias_ORD_SkelA.GetReference().MoveTo(ORD_X)
Alias_ORD_SkelB.GetReference().MoveTo(ORD_X)
Alias_ORD_SkelC.GetReference().MoveTo(ORD_X)

TheBox.Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_ORD_Skel1.GetReference().MoveTo(PlayerRef)
Alias_ORD_Skel2.GetReference().MoveTo(PlayerRef)
Alias_ORD_Skel3.GetReference().MoveTo(PlayerRef)
Alias_ORD_Skel4.GetReference().MoveTo(PlayerRef)
Alias_ORD_Skel5.GetReference().MoveTo(PlayerRef)
Alias_ORD_Skel6.GetReference().MoveTo(PlayerRef)
Alias_ORD_Skel7.GetReference().MoveTo(PlayerRef)
Alias_ORD_Skel8.GetReference().MoveTo(PlayerRef)
Alias_ORD_Skel9.GetReference().MoveTo(PlayerRef)
Alias_ORD_SkelA.GetReference().MoveTo(PlayerRef)
Alias_ORD_SkelB.GetReference().MoveTo(PlayerRef)
Alias_ORD_SkelC.GetReference().MoveTo(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property ORD_X  Auto  

Actor Property PlayerRef  Auto  

Activator Property FXEmptyActivator  Auto  
