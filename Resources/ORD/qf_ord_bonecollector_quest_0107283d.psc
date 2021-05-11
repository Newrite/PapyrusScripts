;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_ORD_BoneCollector_Quest_0107283D Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_MapMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_MapMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_MapMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_MapMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_MapMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_MapMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_MapMarker4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_MapMarker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Altar4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Altar4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Altar2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Altar2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Altar1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Altar1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Altar3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Altar3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; start perk
Alias_ORD_MapMarker1.GetRef().Enable()
Alias_ORD_MapMarker2.GetRef().Enable()
Alias_ORD_MapMarker3.GetRef().Enable()
Alias_ORD_MapMarker4.GetRef().Enable()
Alias_ORD_Altar1.GetRef().BlockActivation(false)
Alias_ORD_Altar2.GetRef().BlockActivation(false)
Alias_ORD_Altar3.GetRef().BlockActivation(false)
Alias_ORD_Altar4.GetRef().BlockActivation(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; init
Utility.Wait(0.5)
Alias_ORD_Altar1.GetRef().BlockActivation(true)
Alias_ORD_Altar2.GetRef().BlockActivation(true)
Alias_ORD_Altar3.GetRef().BlockActivation(true)
Alias_ORD_Altar4.GetRef().BlockActivation(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; end perk
Alias_ORD_MapMarker1.GetRef().Disable()
Alias_ORD_MapMarker2.GetRef().Disable()
Alias_ORD_MapMarker3.GetRef().Disable()
Alias_ORD_MapMarker4.GetRef().Disable()
Alias_ORD_Altar1.GetRef().BlockActivation(true)
Alias_ORD_Altar2.GetRef().BlockActivation(true)
Alias_ORD_Altar3.GetRef().BlockActivation(true)
Alias_ORD_Altar4.GetRef().BlockActivation(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
