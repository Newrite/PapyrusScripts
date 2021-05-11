;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_ORD_Performer_Quest_Irres_01020CE8 Extends Quest Hidden

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

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; defining the spectators
Actor Spectator1 = Alias_ORD_Performer_Spectator1.GetActorRef()
Actor Spectator2 = Alias_ORD_Performer_Spectator2.GetActorRef()
Actor Spectator3 = Alias_ORD_Performer_Spectator3.GetActorRef()
Actor Spectator4 = Alias_ORD_Performer_Spectator4.GetActorRef()
Actor Spectator5 = Alias_ORD_Performer_Spectator5.GetActorRef()

; calculating health difference
Float HealthDelta = HealthSum
If Spectator1
	HealthDelta -= Spectator1.GetActorValue("Health")
EndIf
If Spectator2
	HealthDelta -= Spectator2.GetActorValue("Health")
EndIf
If Spectator3
	HealthDelta -= Spectator3.GetActorValue("Health")
EndIf
If Spectator4
	HealthDelta -= Spectator4.GetActorValue("Health")
EndIf
If Spectator5
	HealthDelta -= Spectator5.GetActorValue("Health")
EndIf

; granting xp based on health damage taken
If HealthDelta > 0
	Game.AdvanceSkill("Speechcraft", ORD_XP + (HealthDelta * ORD_XPMult))
EndIf

; dispelling the weakness
If Spectator1
	Spectator1.DispelSpell(ORD_Spe_IrresistibleDance_Spell_ProcSelf)
EndIf
If Spectator2
	Spectator2.DispelSpell(ORD_Spe_IrresistibleDance_Spell_ProcSelf)
EndIf
If Spectator3
	Spectator3.DispelSpell(ORD_Spe_IrresistibleDance_Spell_ProcSelf)
EndIf
If Spectator4
	Spectator4.DispelSpell(ORD_Spe_IrresistibleDance_Spell_ProcSelf)
EndIf
If Spectator5
	Spectator5.DispelSpell(ORD_Spe_IrresistibleDance_Spell_ProcSelf)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE ORD_Performer_Quest_Script
Quest __temp = self as Quest
ORD_Performer_Quest_Script kmyQuest = __temp as ORD_Performer_Quest_Script
;END AUTOCAST
;BEGIN CODE
; define the spectators
Actor Spectator1 = Alias_ORD_Performer_Spectator1.GetActorRef()
Actor Spectator2 = Alias_ORD_Performer_Spectator2.GetActorRef()
Actor Spectator3 = Alias_ORD_Performer_Spectator3.GetActorRef()
Actor Spectator4 = Alias_ORD_Performer_Spectator4.GetActorRef()
Actor Spectator5 = Alias_ORD_Performer_Spectator5.GetActorRef()

; total health of spectators
HealthSum = 0
If Spectator1
	HealthSum += Spectator1.GetActorValue("Health")
EndIf
If Spectator2
	HealthSum += Spectator2.GetActorValue("Health")
EndIf
If Spectator3
	HealthSum += Spectator3.GetActorValue("Health")
EndIf
If Spectator4
	HealthSum += Spectator4.GetActorValue("Health")
EndIf
If Spectator5
	HealthSum += Spectator5.GetActorValue("Health")
EndIf

kmyQuest.DanceLoop()

; make each spectator weaker
If Spectator1
	ORD_Spe_IrresistibleDance_Spell_ProcSelf.Cast(Spectator1)
EndIf
If Spectator2
	ORD_Spe_IrresistibleDance_Spell_ProcSelf.Cast(Spectator2)
EndIf
If Spectator3
	ORD_Spe_IrresistibleDance_Spell_ProcSelf.Cast(Spectator3)
EndIf
If Spectator4
	ORD_Spe_IrresistibleDance_Spell_ProcSelf.Cast(Spectator4)
EndIf
If Spectator5
	ORD_Spe_IrresistibleDance_Spell_ProcSelf.Cast(Spectator5)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Float HealthSum

SPELL Property ORD_Spe_IrresistibleDance_Spell_ProcSelf  Auto  

Int Property ORD_XP  Auto  

Float Property ORD_XPMult  Auto  

Idle Property ORD_IdleAudience  Auto  
