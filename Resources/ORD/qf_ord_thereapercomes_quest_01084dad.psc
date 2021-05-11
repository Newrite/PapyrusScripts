;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_ORD_TheReaperComes_Quest_01084DAD Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Target
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Target Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Ghost
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Ghost Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Marker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_ORD_Ghost.GetActorRef().StartCombat(Alias_ORD_Target.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
