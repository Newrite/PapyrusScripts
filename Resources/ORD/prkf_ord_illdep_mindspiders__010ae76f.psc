;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname PRKF_ORD_IllDEP_MindSpiders__010AE76F Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
PlayerRef.DoCombatSpellApply(ORD_OnCast_Proc, (akTargetRef as Actor))
Game.AdvanceSkill("Illusion", ORD_XP)
ORD_Ill_CooldownEnd_Spell.Cast(PlayerRef)
; mind spiders
; any disable
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property ORD_OnCast_Proc  Auto  

Int Property ORD_XP  Auto  

Actor Property PlayerRef  Auto  

SPELL Property ORD_Ill_CooldownEnd_Spell  Auto  
