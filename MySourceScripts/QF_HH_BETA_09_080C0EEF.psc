;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_HH_BETA_09_080C0EEF Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player_one
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player_one Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE HH_Press_button
Quest __temp = self as Quest
HH_Press_button kmyQuest = __temp as HH_Press_button
;END AUTOCAST
;BEGIN CODE
kmyQuest.InitializeMod()
kmyQuest.setBlockKeyCode()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
