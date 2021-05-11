Scriptname ORD_DisassemblePower_Script extends activemagiceffect  

; -----

Quest Property ORD_AdvancedWorkshop_Quest Auto
GlobalVariable Property ORD_Smh_AdvancedWorkshop_Global_Type Auto
Sound Property ORD_Smh_AdvancedWorkshop_Marker_Upgrade Auto
Message Property ORD_Smh_AdvancedWorkshop_Message_Demolished Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

		ORD_AdvancedWorkshop_Quest.Stop()
		ORD_Smh_AdvancedWorkshop_Global_Type.SetValue(-1)
		ORD_Smh_AdvancedWorkshop_Marker_Upgrade.Play(akTarget)
		ORD_Smh_AdvancedWorkshop_Message_Demolished.Show()


EndEvent

; -----