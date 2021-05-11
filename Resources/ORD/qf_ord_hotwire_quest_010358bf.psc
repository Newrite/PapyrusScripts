;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_ORD_Hotwire_Quest_010358BF Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Automaton
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Automaton Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If Alias_ORD_Automaton
	Actor TargetActor = Alias_ORD_Automaton.GetActorRef()
	Actor PlayerActor = Alias_ORD_Player.GetActorRef()
	Debug.Trace("ORDINATOR DEBUG: Hotwire called to target " + Alias_ORD_Automaton.GetActorRef(), 0)
	TargetActor.AddToFaction(MagicAllegianceFaction)
	PlayerActor.StopCombat()
	TargetActor.StopCombat()
	TargetActor.SetPlayerTeammate(true, true)
	TargetActor.RestoreAV("Health", 9999)
	PlayerActor.AddSpell(ORD_Loc_Hotwire_Spell_DispelPower,false)
	ORD_Loc_Hotwire_Message_Success.Show()
	TargetActor.EvaluatePackage()
	TargetActor.IgnoreFriendlyHits(true)
	Game.AdvanceSkill("Lockpicking", ORD_XPMult * TargetActor.GetAV("Health"))
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
If Alias_ORD_Automaton
	Actor TargetActor = Alias_ORD_Automaton.GetActorRef()
	Actor PlayerActor = Alias_ORD_Player.GetActorRef()
	TargetActor.SetPlayerTeammate(false, false)
	TargetActor.RemoveFromFaction(MagicAllegianceFaction)
	ORD_Loc_Hotwire_Message_Release.Show()
	PlayerActor.RemoveSpell(ORD_Loc_Hotwire_Spell_DispelPower)
	TargetActor.IgnoreFriendlyHits(false)
	TargetActor.Kill(PlayerActor)
	TargetActor.PlaceAtMe(ORD_Loc_Hotwire_Explosion)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property ORD_Loc_Hotwire_Message_Success  Auto  

SPELL Property ORD_Loc_Hotwire_Spell_DispelPower  Auto  

Faction Property MagicAllegianceFaction  Auto  

Explosion Property ORD_Loc_Hotwire_Explosion  Auto  

Message Property ORD_Loc_Hotwire_Message_Release  Auto  

Float Property ORD_XPMult  Auto  
