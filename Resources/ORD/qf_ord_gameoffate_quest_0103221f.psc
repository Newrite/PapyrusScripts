;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_ORD_GameOfFate_Quest_0103221F Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_ContainerLoc2
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ORD_ContainerLoc2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Container3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Container3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Container1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Container1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Pickupable2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Pickupable2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_ContainerLoc1
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ORD_ContainerLoc1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_ContainerLoc5
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ORD_ContainerLoc5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Pickupable1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Pickupable1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Pickupable5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Pickupable5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_ContainerLoc3
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ORD_ContainerLoc3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Container5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Container5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Container4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Container4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_ContainerLoc4
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ORD_ContainerLoc4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Pickupable3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Pickupable3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Container2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Container2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Pickupable4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Pickupable4 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_ORD_Container1.GetReference().RemoveItem(Alias_ORD_Pickupable1.GetReference())
Alias_ORD_Container2.GetReference().RemoveItem(Alias_ORD_Pickupable2.GetReference())
Alias_ORD_Container3.GetReference().RemoveItem(Alias_ORD_Pickupable3.GetReference())
Alias_ORD_Container4.GetReference().RemoveItem(Alias_ORD_Pickupable4.GetReference())
Alias_ORD_Container5.GetReference().RemoveItem(Alias_ORD_Pickupable5.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
