Scriptname ORD_ReapAndSow_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Con_BoneCollector_Global_ChanceNone_Drop Auto
GlobalVariable Property ORD_Con_BoneCollector_Global_ChanceNone_Drop_Base Auto
GlobalVariable Property ORD_Con_BoneCollector_Global_ChanceNone_Drop_RS Auto

GlobalVariable Property ORD_Con_BoneCollector_Global_ChanceNone_Destroy Auto
GlobalVariable Property ORD_Con_BoneCollector_Global_ChanceNone_Destroy_Base Auto
GlobalVariable Property ORD_Con_BoneCollector_Global_ChanceNone_Destroy_RS Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Con_BoneCollector_Global_ChanceNone_Drop.SetValue(ORD_Con_BoneCollector_Global_ChanceNone_Drop_RS.GetValue())
	ORD_Con_BoneCollector_Global_ChanceNone_Destroy.SetValue(ORD_Con_BoneCollector_Global_ChanceNone_Destroy_RS.GetValue())


EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Con_BoneCollector_Global_ChanceNone_Drop.SetValue(ORD_Con_BoneCollector_Global_ChanceNone_Drop_Base.GetValue())
	ORD_Con_BoneCollector_Global_ChanceNone_Destroy.SetValue(ORD_Con_BoneCollector_Global_ChanceNone_Destroy_Base.GetValue())

EndEvent

; -----