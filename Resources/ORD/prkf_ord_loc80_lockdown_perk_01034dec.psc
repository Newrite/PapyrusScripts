;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname PRKF_ORD_Loc80_Lockdown_Perk_01034DEC Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
PlayerRef.DoCombatSpellApply(ORD_OnCast_Proc, (akTargetRef as Actor))
Game.AdvanceSkill("Lockpicking", ORD_XP)
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Int Property ORD_XP  Auto  

SPELL Property ORD_OnCast_Proc  Auto  

Actor Property PlayerRef  Auto  
