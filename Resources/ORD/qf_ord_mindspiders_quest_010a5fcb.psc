;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_ORD_MindSpiders_Quest_010A5FCB Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Spider5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Spider5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Spider4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Spider4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Spider1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Spider1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Spider2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Spider2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Spider3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Spider3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Victim = Alias_ORD_Victim.GetActorRef()
Alias_ORD_Spider1.GetActorRef().StartCombat(Victim)
Alias_ORD_Spider2.GetActorRef().StartCombat(Victim)
Alias_ORD_Spider3.GetActorRef().StartCombat(Victim)
Alias_ORD_Spider4.GetActorRef().StartCombat(Victim)
Alias_ORD_Spider5.GetActorRef().StartCombat(Victim)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Alias_ORD_Spider1.GetRef().Delete()
Alias_ORD_Spider2.GetRef().Delete()
Alias_ORD_Spider3.GetRef().Delete()
Alias_ORD_Spider4.GetRef().Delete()
Alias_ORD_Spider5.GetRef().Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
