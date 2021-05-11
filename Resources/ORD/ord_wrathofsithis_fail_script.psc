Scriptname ORD_WrathOfSithis_Fail_Script extends activemagiceffect  

; -----

Message Property ORD_Sne_WrathOfSithis_Message_Fail Auto
GlobalVariable Property ORD_Sne_WrathOfSithis_Global_Gold Auto
MiscObject Property Gold001 Auto
Sound Property MAGFail Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	MAGFail.Play(akTarget)
	ORD_Sne_WrathOfSithis_Message_Fail.Show(akTarget.GetItemCount(Gold001), ORD_Sne_WrathOfSithis_Global_Gold.GetValue())

EndEvent

; -----