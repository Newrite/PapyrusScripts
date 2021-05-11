;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_ORD_PrecipiceOfMadness_Qu_0102E66E Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Alias_ORD_Victim.GetActorRef().SetExpressionOverride(ORD_Mood, ORD_MoodPower)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Alias_ORD_Victim.GetActorRef().ClearExpressionOverride()
Alias_ORD_Victim.GetActorRef().DispelSpell(ORD_Ill_LambToTheSlaughter_Spell_Proc)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Int Property ORD_Mood  Auto  

Int Property ORD_MoodPower  Auto  

SPELL Property ORD_Ill_LambToTheSlaughter_Spell_Proc  Auto  
