;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname PRKF_REQ_Perk_Enchanting_Enc_00058F7F Extends Perk Hidden

;BEGIN FRAGMENT Fragment_8
Function Fragment_8(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
int iButton = HH_ENCH_Messadge.Show()
if(iButton == 0 ) ;
    HH_ENCH_Swithc_Global.SetValue(1)
    hh_Ench_Quest_DragonSouls.SetCurrentStageID(0)
    Utility.WaitMenuMode(0.25)
    While hh_Ench_Quest_DragonSouls.IsStarting()
        Utility.WaitMenuMode(0.4)
    EndWhile
    Utility.WaitMenuMode(0.25)
    akTargetRef.Activate(Game.GetPlayer())
else 
    akTargetRef.Activate(Game.GetPlayer())
    HH_ENCH_Swithc_Global.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property HH_ENCH_Messadge  Auto  
Quest Property hh_Ench_Quest_DragonSouls Auto
GlobalVariable Property HH_ENCH_Mastery_Global Auto
GlobalVariable Property HH_ENCH_Swithc_Global Auto
Float Property dargonsouls Auto
