;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_ORD_AdvancedWorkshop_Ques_0103BB03 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_GrindstoneUpgrades
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_GrindstoneUpgrades Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_ArmorTableUpgrades
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_ArmorTableUpgrades Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_ArmorTable
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_ArmorTable Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Grindstone
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Grindstone Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
If ORD_Smh_DisableAdvancedWorkshopModel_Global.GetValue() == 1	
	Alias_ORD_ArmorTableUpgrades.GetReference().Disable()
	Alias_ORD_GrindstoneUpgrades.GetReference().Disable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_ORD_ArmorTableUpgrades.GetRef().Delete()
Alias_ORD_GrindstoneUpgrades.GetRef().Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property ORD_Smh_DisableAdvancedWorkshopModel_Global  Auto  
