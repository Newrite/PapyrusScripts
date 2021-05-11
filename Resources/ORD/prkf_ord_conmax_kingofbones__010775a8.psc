;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname PRKF_ORD_ConMAX_KingOfBones__010775A8 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
; restore health first
(akTargetRef as Actor).RestoreAV("Health", 9999)
akActor.DoCombatSpellApply(ORD_Con_KingOfBones_Spell_Possess, akTargetRef as Actor)
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property ORD_Con_KingOfBones_Spell_Possess  Auto  
