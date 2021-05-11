;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_ORD_SpeakWithAnimals_Scri_0102386E Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Player_Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Player_Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Target_Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Target_Alias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE ORD_SpeakWithAnimals_Periodic_Script
Quest __temp = self as Quest
ORD_SpeakWithAnimals_Periodic_Script kmyQuest = __temp as ORD_SpeakWithAnimals_Periodic_Script
;END AUTOCAST
;BEGIN CODE
If Alias_ORD_Target_Alias
	Debug.Trace("ORDINATOR DEBUG: Speak With Animals called to target " + Alias_ORD_Target_Alias.GetActorRef(), 0)
	Alias_ORD_Target_Alias.GetActorRef().AddToFaction(MagicAllegianceFaction)
	PlayerRef.StopCombat()
	Alias_ORD_Target_Alias.GetActorRef().StopCombat()
	Alias_ORD_Target_Alias.GetActorRef().SetPlayerTeammate(true, true)
	PlayerRef.AddSpell(ORD_Spe_SpeakWithAnimals_Spell_DispelPower)
	ORD_Spe_SpeakWithAnimals_Message_Success.Show()
	Alias_ORD_Target_Alias.GetActorRef().EvaluatePackage()
	Alias_ORD_Target_Alias.GetActorRef().IgnoreFriendlyHits(true)
	kmyQuest.StartPinging()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE ORD_SpeakWithAnimals_Periodic_Script
Quest __temp = self as Quest
ORD_SpeakWithAnimals_Periodic_Script kmyQuest = __temp as ORD_SpeakWithAnimals_Periodic_Script
;END AUTOCAST
;BEGIN CODE
If Alias_ORD_Target_Alias
	Alias_ORD_Target_Alias.GetActorRef().SetPlayerTeammate(false, false)
	Alias_ORD_Target_Alias.GetActorRef().RemoveFromFaction(MagicAllegianceFaction)
	ORD_Spe_SpeakWithAnimals_Message_Release.Show()
	Utility.Wait(1.0)
	PlayerRef.RemoveSpell(ORD_Spe_SpeakWithAnimals_Spell_DispelPower)
	Alias_ORD_Target_Alias.GetActorRef().RemoveSpell(ORD_Spe_SpeakWithAnimals_Spell_Ab)
	Alias_ORD_Target_Alias.GetActorRef().IgnoreFriendlyHits(false)
	kmyQuest.StopPinging()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property ORD_Spe_SpeakWithAnimals_Spell_Ab  Auto  

Message Property ORD_Spe_SpeakWithAnimals_Message_Success  Auto  

SPELL Property ORD_Spe_SpeakWithAnimals_Spell_DispelPower  Auto  

Actor Property PlayerRef  Auto  

Faction Property MagicAllegianceFaction  Auto  

Message Property ORD_Spe_SpeakWithAnimals_Message_Release  Auto  
