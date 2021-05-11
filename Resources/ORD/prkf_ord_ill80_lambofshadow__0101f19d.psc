;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname PRKF_ORD_Ill80_LambOfShadow__0101F19D Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Float NextActivateTime = GameDaysPassed.GetValue() + ORD_DayFraction
ORD_Global_NextActivate.SetValue(NextActivateTime)
PlayerRef.DoCombatSpellApply(ORD_OnCast_Proc, (akTargetRef as Actor))
Game.AdvanceSkill("Illusion", ORD_XP)
ORD_Ill_CooldownEnd_Spell_HeavyWeighsTheTapestry.Cast(PlayerRef)
; heavy weighs the tapestry
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Int Property ORD_XP  Auto  

SPELL Property ORD_OnCast_Proc  Auto  

GlobalVariable Property ORD_Global_NextActivate  Auto  

Float Property ORD_DayFraction  Auto  

GlobalVariable Property GameDaysPassed  Auto  

Actor Property PlayerRef  Auto  

SPELL Property ORD_Ill_CooldownEnd_Spell_HeavyWeighsTheTapestry  Auto  
