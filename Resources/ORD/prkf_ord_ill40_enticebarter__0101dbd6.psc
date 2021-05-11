;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname PRKF_ORD_Ill40_EnticeBarter__0101DBD6 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
(akTargetRef as Actor).ShowBarterMenu()
Game.AdvanceSkill("Illusion", ORD_XP)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Int Property ORD_XP  Auto  
