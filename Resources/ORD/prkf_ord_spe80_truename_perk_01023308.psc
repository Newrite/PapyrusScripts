;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname PRKF_ORD_Spe80_TrueName_Perk_01023308 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ORD_Spe_TrueName_Message.Show()
ORD_Spe_TrueName_FormList.Revert()
ORD_Spe_TrueName_FormList.AddForm((akTargetRef as Actor).GetActorBase())
ORD_Spe_TrueName_Global_Status.SetValue(1.0)
akActor.DoCombatSpellApply(ORD_Spe_TrueName_Spell_Proc, akTargetRef as Actor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property ORD_Spe_TrueName_FormList  Auto  

Message Property ORD_Spe_TrueName_Message  Auto  

GlobalVariable Property ORD_Spe_TrueName_Global_Status  Auto  

SPELL Property ORD_Spe_TrueName_Spell_Proc  Auto  
