;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_ORD_Performer_Quest_0102077A Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Performer_Spectator2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Performer_Spectator2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Performer_Spectator5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Performer_Spectator5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Performer_Spectator1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Performer_Spectator1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Performer_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Performer_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Performer_Spectator3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Performer_Spectator3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Performer_Spectator4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Performer_Spectator4 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; define spectators
Actor PlayerActor = Alias_ORD_Performer_Player.GetActorRef()
Actor Spectator1 = Alias_ORD_Performer_Spectator1.GetActorRef()
Actor Spectator2 = Alias_ORD_Performer_Spectator2.GetActorRef()
Actor Spectator3 = Alias_ORD_Performer_Spectator3.GetActorRef()
Actor Spectator4 = Alias_ORD_Performer_Spectator4.GetActorRef()
Actor Spectator5 = Alias_ORD_Performer_Spectator5.GetActorRef()

Int TotalGold = 0
Int GoldPerPerson = 0
Int DefaultGoldPerPerson = Math.Floor(PlayerActor.GetActorValue("Speechcraft") * ORD_GoldMult * Utility.RandomFloat(0.75, 1.25))

Bool HasSerenade = PlayerActor.HasPerk(ORD_Spe30_Serenade_Perk_30)
Int PlayerSex = 1 - PlayerActor.GetActorBase().GetSex()

; spectator 1
If Spectator1
	If HasSerenade && Spectator1.GetActorBase().GetSex() == PlayerSex
		GoldPerPerson = DefaultGoldPerPerson * ORD_SerenadeMult
		PlayerActor.AddItem(ORD_Spe_Serenade_Litem)
	Else
		GoldPerPerson = DefaultGoldPerPerson
	EndIf
	If GoldPerPerson > Spectator1.GetItemCount(Gold001)
		GoldPerPerson = Spectator1.GetItemCount(Gold001)
	EndIf
	TotalGold += GoldPerPerson
	Spectator1.RemoveItem(Gold001, GoldPerPerson, false)
EndIf

; spectator 2
If Spectator2
	If HasSerenade && Spectator2.GetActorBase().GetSex() == PlayerSex
		GoldPerPerson = DefaultGoldPerPerson * ORD_SerenadeMult
		PlayerActor.AddItem(ORD_Spe_Serenade_Litem)
	Else
		GoldPerPerson = DefaultGoldPerPerson
	EndIf
	If GoldPerPerson > Spectator2.GetItemCount(Gold001)
		GoldPerPerson = Spectator2.GetItemCount(Gold001)
	EndIf
	TotalGold += GoldPerPerson
	Spectator2.RemoveItem(Gold001, GoldPerPerson, false)
EndIf

; spectator 3
If Spectator3
	If HasSerenade && Spectator3.GetActorBase().GetSex() == PlayerSex
		GoldPerPerson = DefaultGoldPerPerson * ORD_SerenadeMult
		PlayerActor.AddItem(ORD_Spe_Serenade_Litem)
	Else
		GoldPerPerson = DefaultGoldPerPerson
	EndIf
	GoldPerPerson = DefaultGoldPerPerson
	If GoldPerPerson > Spectator3.GetItemCount(Gold001)
		GoldPerPerson = Spectator3.GetItemCount(Gold001)
	EndIf
	TotalGold += GoldPerPerson
	Spectator3.RemoveItem(Gold001, GoldPerPerson, false)
EndIf

; spectator 4
If Spectator4
	If HasSerenade && Spectator4.GetActorBase().GetSex() == PlayerSex
		GoldPerPerson = DefaultGoldPerPerson * ORD_SerenadeMult
		PlayerActor.AddItem(ORD_Spe_Serenade_Litem)
	Else
		GoldPerPerson = DefaultGoldPerPerson
	EndIf
	GoldPerPerson = DefaultGoldPerPerson
	If GoldPerPerson > Spectator4.GetItemCount(Gold001)
		GoldPerPerson = Spectator4.GetItemCount(Gold001)
	EndIf
	TotalGold += GoldPerPerson
	Spectator4.RemoveItem(Gold001, GoldPerPerson, false)
EndIf

; spectator 5
If Spectator5
	If HasSerenade && Spectator5.GetActorBase().GetSex() == PlayerSex
		GoldPerPerson = DefaultGoldPerPerson * ORD_SerenadeMult
		PlayerActor.AddItem(ORD_Spe_Serenade_Litem)
	Else
		GoldPerPerson = DefaultGoldPerPerson
	EndIf
	GoldPerPerson = DefaultGoldPerPerson
	If GoldPerPerson > Spectator5.GetItemCount(Gold001)
		GoldPerPerson = Spectator5.GetItemCount(Gold001)
	EndIf
	TotalGold += GoldPerPerson
	Spectator5.RemoveItem(Gold001, GoldPerPerson, false)
EndIf

PlayerActor.AddItem(Gold001, TotalGold)
Game.AdvanceSkill("Speechcraft", (ORD_XP + (TotalGold * ORD_XPMult)))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Int Property ORD_XP  Auto  

Float Property ORD_XPMult  Auto  

MiscObject Property Gold001  Auto  

Message Property ORD_Spe_Perform_Message_GoldAdded  Auto  

Float Property ORD_GoldMult  Auto  

Perk Property ORD_Spe30_Serenade_Perk_30  Auto  

Int Property ORD_SerenadeMult  Auto  

LeveledItem Property ORD_Spe_Serenade_Litem  Auto  
