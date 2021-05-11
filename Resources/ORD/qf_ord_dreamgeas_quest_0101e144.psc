;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_ORD_DreamGeas_Quest_0101E144 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Player_Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Player_Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Target_Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Target_Alias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
If Alias_ORD_Target_Alias
	Alias_ORD_Target_Alias.GetActorRef().SetPlayerTeammate(false, false)
	Alias_ORD_Target_Alias.GetActorRef().RemoveFromFaction(MagicAllegianceFaction)
	ORD_Ill_DreamGeas_Message_Release.Show()
	Utility.Wait(1.0)
	PlayerRef.RemoveSpell(ORD_Ill_DreamGeas_Spell_DispelPower)
	Alias_ORD_Target_Alias.GetActorRef().RemoveSpell(ORD_Ill_DreamGeas_Spell_Ab)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If Alias_ORD_Target_Alias
	Debug.Trace("ORDINATOR DEBUG: Dream Geas called to target " + Alias_ORD_Target_Alias.GetActorRef(), 0)
;	Alias_ORD_Target_Alias.GetActorRef().AddSpell(ORD_Ill_DreamGeas_Spell_Ab,false)
	Alias_ORD_Target_Alias.GetActorRef().AddToFaction(MagicAllegianceFaction)
	PlayerRef.StopCombat()
	Alias_ORD_Target_Alias.GetActorRef().StopCombat()
	Alias_ORD_Target_Alias.GetActorRef().SetPlayerTeammate(true, true)
	PlayerRef.AddSpell(ORD_Ill_DreamGeas_Spell_DispelPower,true)
	ORD_Ill_DreamGeas_Message_Success.Show()
	Alias_ORD_Target_Alias.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property MagicAllegianceFaction  Auto  

Message Property ORD_Ill_DreamGeas_Message_Success  Auto  

Actor Property PlayerRef  Auto  

Message Property ORD_Ill_DreamGeas_Message_Release  Auto  

SPELL Property ORD_Ill_DreamGeas_Spell_DispelPower  Auto  

SPELL Property ORD_Ill_DreamGeas_Spell_Ab  Auto  
