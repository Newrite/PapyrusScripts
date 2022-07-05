;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_hh_Ench_Quest_DragonSouls_0A00AA41 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE HH_SCR_DRAGONSOULS_MASTERY
Quest __temp = self as Quest
HH_SCR_DRAGONSOULS_MASTERY kmyQuest = __temp as HH_SCR_DRAGONSOULS_MASTERY
;END AUTOCAST
;BEGIN CODE
kmyQuest.BeginEnchanting()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
