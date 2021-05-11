;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_ORD_WildSanctuaries_Quest_0109F395 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Altar_01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Altar_01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Altar_02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Altar_02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Altar_03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Altar_03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Altar_04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Altar_04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Altar_05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Altar_05 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_ORD_Altar_01.GetRef().Enable() ;alteration
Alias_ORD_Altar_02.GetRef().Enable() ;restoration
Alias_ORD_Altar_03.GetRef().Enable() ;illusion
Alias_ORD_Altar_04.GetRef().Enable() ;destruction
Alias_ORD_Altar_05.GetRef().Enable() ;conjuration
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_ORD_Altar_01.GetRef().Disable()
Alias_ORD_Altar_02.GetRef().Disable()
Alias_ORD_Altar_03.GetRef().Disable()
Alias_ORD_Altar_04.GetRef().Disable()
Alias_ORD_Altar_05.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
