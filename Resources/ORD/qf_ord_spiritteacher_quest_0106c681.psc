;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_ORD_SpiritTeacher_Quest_0106C681 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Marker2Ext
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Marker2Ext Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Ghost1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Ghost1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Marker1Ext
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Marker1Ext Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Ghost2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Ghost2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Marker3Ext
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Marker3Ext Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Marker4Ext
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Marker4Ext Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_ORD_Ghost1.GetRef().Disable(true)
Alias_ORD_Ghost1.GetRef().Delete()

Alias_ORD_Ghost2.GetRef().Disable(true)
Alias_ORD_Ghost2.GetRef().Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;SetObjectiveDisplayed(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
