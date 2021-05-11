;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_ORD_HeartOfCreation_Quest_0103C5FA Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_ForgeUpgrades
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_ForgeUpgrades Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Skyforge
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Skyforge Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Forge
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Forge Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_SkyforgeUpgrades
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_SkyforgeUpgrades Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_ORD_ForgeUpgrades.GetRef().Delete()
Alias_ORD_SkyforgeUpgrades.GetRef().Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
