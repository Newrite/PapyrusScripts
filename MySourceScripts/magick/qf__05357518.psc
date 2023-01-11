;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname QF__05357518 Extends Quest Hidden

;BEGIN ALIAS PROPERTY POT_NecromancerLordAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_POT_NecromancerLordAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY POT_DrelasSafeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_POT_DrelasSafeAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
Game.GetPlayer().AddItem(POT_LichScrollOfTranscendence)
Game.GetPlayer().AddPerk(POT_LeveledListPerk)
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(30,1)
Alias_POT_DrelasSafeAlias.GetRef().Enable(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
Alias_POT_NecromancerLordAlias.GetRef().Enable(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scroll Property POT_LichScrollOfTranscendence Auto

Perk Property POT_LeveledListPerk Auto
