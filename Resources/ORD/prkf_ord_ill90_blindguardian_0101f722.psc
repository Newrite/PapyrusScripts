;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname PRKF_ORD_Ill90_BlindGuardian_0101F722 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Float NextActivateTime = GameDaysPassed.GetValue() + ORD_DayFraction
ORD_Ill_BlindGuardian_Global_NextActivate.SetValue(NextActivateTime)
PlayerRef.DoCombatSpellApply(ORD_Ill_BlindGuardian_Spell_Proc, (akTargetRef as Actor))
Game.AdvanceSkill("Illusion", ORD_XP)
ORD_Ill_CooldownEnd_Spell_BlindGuardian.Cast(PlayerRef)
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property ORD_Ill_BlindGuardian_Global_NextActivate  Auto  

GlobalVariable Property GameDaysPassed  Auto  

SPELL Property ORD_Ill_BlindGuardian_Spell_Proc  Auto  

Int Property ORD_XP  Auto  

Actor Property PlayerRef  Auto  

Float Property ORD_DayFraction  Auto  

SPELL Property ORD_Ill_CooldownEnd_Spell_BlindGuardian  Auto  
