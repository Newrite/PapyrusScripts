;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname PRKF_ORD_Spe20_SpeakWithAnim_0102330B Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Actor akTargetActor = akTargetRef as Actor
Game.GetPlayer().DoCombatSpellApply(ORD_Spe_SpeakWithAnimals_Spell_Proc, akTargetActor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property ORD_Spe_SpeakWithAnimals_Spell_Proc  Auto  
