;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname PRKF_ORD_Ill70_FearTheReaper_0101F70F Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Float NextActivateTime = GameDaysPassed.GetValue() + ORD_DayFraction
ORD_Ill_FearTheReaper_Global_NextActivate.SetValue(NextActivateTime)
;(akTargetRef as Actor).DispelSpell(ORD_Ill_ImposingPresence_Spell_CloakProc)
PlayerRef.DoCombatSpellApply(ORD_Ill_FearTheReaper_Spell_Proc, (akTargetRef as Actor))
Game.AdvanceSkill("Illusion", ORD_XP)
ORD_Ill_CooldownEnd_Spell_FearTheReaper.Cast(PlayerRef)
; the reaper comes
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Int Property ORD_XP  Auto  

SPELL Property ORD_Ill_FearTheReaper_Spell_Proc  Auto  

GlobalVariable Property ORD_Ill_FearTheReaper_Global_NextActivate  Auto  

GlobalVariable Property GameDaysPassed  Auto  

Float Property ORD_DayFraction  Auto  

Actor Property PlayerRef  Auto  

SPELL Property ORD_Ill_CooldownEnd_Spell_FearTheReaper  Auto  

SPELL Property ORD_Ill_ImposingPresence_Spell_CloakProc  Auto  
