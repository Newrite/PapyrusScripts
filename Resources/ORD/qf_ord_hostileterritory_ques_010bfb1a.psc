;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_ORD_HostileTerritory_Ques_010BFB1A Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Object
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Object Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
ORD_Sne_HostileTerritory_FXS.Stop(Alias_ORD_Object.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
ORD_Sne_HostileTerritory_FXS.Play(Alias_ORD_Object.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

EffectShader Property ORD_Sne_HostileTerritory_FXS  Auto  
