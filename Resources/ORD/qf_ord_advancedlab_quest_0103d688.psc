;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_ORD_AdvancedLab_Quest_0103D688 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_LabUpgrades_Small
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_LabUpgrades_Small Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_LabUpgrades
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_LabUpgrades Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_AdvancedLab
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_AdvancedLab Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_AdvancedLab_Small
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_AdvancedLab_Small Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
If ORD_Alc_DisableAdvancedLabModel_Global.GetValue() == 1	
	Alias_ORD_LabUpgrades.GetReference().Disable()
	Alias_ORD_LabUpgrades_Small.GetReference().Disable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_ORD_LabUpgrades.GetRef().Delete()
Alias_ORD_LabUpgrades_Small.GetRef().Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property ORD_Alc_DisableAdvancedLabModel_Global  Auto  
