;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF__0A349118 Extends Quest Hidden

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
