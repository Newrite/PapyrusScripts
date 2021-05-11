;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_ORD_Mutiny_Quest_010342F0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Attacker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Attacker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Attacker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Attacker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Attacker5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Attacker5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Attacker4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Attacker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Attacker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Attacker2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor VictimActor = Alias_ORD_Victim.GetActorRef()
Actor Attacker1 = Alias_ORD_Attacker1.GetActorRef()
Actor Attacker2 = Alias_ORD_Attacker2.GetActorRef()
Actor Attacker3 = Alias_ORD_Attacker3.GetActorRef()
Actor Attacker4 = Alias_ORD_Attacker4.GetActorRef()
Actor Attacker5 = Alias_ORD_Attacker5.GetActorRef()
If Attacker1 && (!Attacker1.IsInCombat() || Attacker1.GetCombatTarget() != VictimActor)
	Attacker1.StopCombat()
	Attacker1.Startcombat(VictimActor)
EndIf
If Attacker2 && (!Attacker2.IsInCombat() || Attacker2.GetCombatTarget() != VictimActor)
	Attacker2.StopCombat()
	Attacker2.Startcombat(VictimActor)
EndIf
If Attacker3 && (!Attacker3.IsInCombat() || Attacker3.GetCombatTarget() != VictimActor)
	Attacker3.StopCombat()
	Attacker3.Startcombat(VictimActor)
EndIf
If Attacker4 && (!Attacker4.IsInCombat() || Attacker4.GetCombatTarget() != VictimActor)
	Attacker4.StopCombat()
	Attacker4.Startcombat(VictimActor)
EndIf
If Attacker5 && (!Attacker5.IsInCombat() || Attacker5.GetCombatTarget() != VictimActor)
	Attacker5.StopCombat()
	Attacker5.Startcombat(VictimActor)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Actor VictimActor = Alias_ORD_Victim.GetActorRef()
Actor Attacker1 = Alias_ORD_Attacker1.GetActorRef()
Actor Attacker2 = Alias_ORD_Attacker2.GetActorRef()
Actor Attacker3 = Alias_ORD_Attacker3.GetActorRef()
Actor Attacker4 = Alias_ORD_Attacker4.GetActorRef()
Actor Attacker5 = Alias_ORD_Attacker5.GetActorRef()

Actor VictimTarget = VictimActor.GetCombatTarget()
If VictimTarget == Attacker1 || VictimTarget == Attacker2 || VictimTarget == Attacker3 || VictimTarget == Attacker4 || VictimTarget == Attacker5
	VictimActor.StopCombat()
EndIf

If Attacker1
	If Attacker1.GetCombatTarget() == VictimActor
		Attacker1.StopCombat()
	EndIf
EndIf
If Attacker2
	If Attacker2.GetCombatTarget() == VictimActor
		Attacker2.StopCombat()
	EndIf
EndIf
If Attacker3
	If Attacker3.GetCombatTarget() == VictimActor
		Attacker3.StopCombat()
	EndIf
EndIf
If Attacker4
	If Attacker4.GetCombatTarget() == VictimActor
		Attacker4.StopCombat()
	EndIf
EndIf
If Attacker5
	If Attacker5.GetCombatTarget() == VictimActor
		Attacker5.StopCombat()
	EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
