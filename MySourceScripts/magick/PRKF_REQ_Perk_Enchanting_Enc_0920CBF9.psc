;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PRKF_REQ_Perk_Enchanting_Enc_0920CBF9 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
int iButton = HH_Ench_90_Perk.Show()
if(iButton == 0 ) ;
    HH_ENCH_Mastery_Global_90.SetValue(1)
	Utility.WaitMenuMode(0.1)
    While HH_ENCH_Mastery_Global_90.GetValue()==0
        Utility.WaitMenuMode(0.1)
		HH_ENCH_Mastery_Global_90.SetValue(1)
    EndWhile
    akTargetRef.Activate(Game.GetPlayer())
elseif (iButton == 1 ) ;
	HH_ENCH_Mastery_Global_90.SetValue(0)
	Utility.WaitMenuMode(0.1)
	While HH_ENCH_Mastery_Global_90.GetValue()==1
        Utility.WaitMenuMode(0.1)
		HH_ENCH_Mastery_Global_90.SetValue(0)
    EndWhile
    akTargetRef.Activate(Game.GetPlayer())
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Message Property HH_Ench_90_Perk Auto
GlobalVariable Property HH_ENCH_Mastery_Global_90 Auto
