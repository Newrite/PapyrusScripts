;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname PRKF_ORD_Ill70_DreamCharm_Pe_0101F18E Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Float WakeUpChance = ORD_WakeUpChance * (125 - PlayerRef.GetAV("Illusion"))
If Utility.RandomFloat(0,100) < WakeUpChance
	akTargetRef.MoveTo(akTargetRef)
	ORD_Ill_DreamThief_Message_WakeUp.Show()
Else
	PlayerRef.DoCombatSpellApply(ORD_Ill_DreamCharm_Spell_Proc, (akTargetRef as Actor))
	Game.AdvanceSkill("Illusion", ORD_XP)
EndIf
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property ORD_Ill_DreamCharm_Spell_Proc  Auto  

Actor Property PlayerRef  Auto  

Int Property ORD_XP  Auto  

Float Property ORD_WakeUpChance  Auto  

Message Property ORD_Ill_DreamThief_Message_WakeUp  Auto  
