Scriptname ORD_SKSE_Script extends SKI_ConfigBase

; -----

GlobalVariable Property ORD_Pic_ThiefsEye_Global_DisableCityWorldspaceOnly Auto
GlobalVariable Property ORD_Pic_ThiefsEye_Global_DisableHasEffect Auto
GlobalVariable Property ORD_Alc_DisableAdvancedLabModel_Global Auto
GlobalVariable Property ORD_Smh_DisableAdvancedWorkshopModel_Global Auto
GlobalVariable Property ORD_Enc_DisableArcaneNexusModel_Global Auto
GlobalVariable Property ORD_Con_BoneCollector_Global_DisallowTeleport Auto
GlobalVariable Property ORD_Spe_SpeakWithAnimals_Global_DisallowTeleport Auto
GlobalVariable Property ORD_Loc_Hotwire_Global_DisallowTeleport Auto
GlobalVariable Property ORD_Enc_Spellscribe_Global_EnableSelfCastSpells Auto
GlobalVariable Property ORD_Bck_TimedBlock_Global_SquelchTimedBlockMessage Auto

String Property ORD_AlchemyOptions Auto
String Property ORD_ConjurationOptions Auto
String Property ORD_EnchantingOptions Auto
String Property ORD_LockpickingOptions Auto
String Property ORD_PickpocketOptions Auto
String Property ORD_SmithingOptions Auto
String Property ORD_SpeechOptions Auto
String Property ORD_BlockOptions Auto

String Property ORD_Pic_ThiefsEye_Text_DisableCityWorldspaceOnly Auto
String Property ORD_Pic_ThiefsEye_Text_DisableHasEffect Auto
String Property ORD_Alc_DisableAdvancedLabModel_Text Auto
String Property ORD_Smh_DisableAdvancedWorkshopModel_Text Auto
String Property ORD_Enc_DisableArcaneNexusModel_Text Auto
String Property ORD_Con_BoneCollector_Text_DisallowTeleport Auto
String Property ORD_Spe_SpeakWithAnimals_Text_DisallowTeleport Auto
String Property ORD_Loc_Hotwire_Text_DisallowTeleport Auto
String Property ORD_Enc_Spellscribe_Text_EnableSelfCastSpells auto
String Property ORD_Bck_TimedBlock_Text_SquelchTimedBlockMessage auto

String Property ORD_Pic_ThiefsEye_Desc_DisableCityWorldspaceOnly Auto
String Property ORD_Pic_ThiefsEye_Desc_DisableHasEffect Auto
String Property ORD_Alc_DisableAdvancedLabModel_Desc Auto
String Property ORD_Smh_DisableAdvancedWorkshopModel_Desc Auto
String Property ORD_Enc_DisableArcaneNexusModel_Desc Auto
String Property ORD_Con_BoneCollector_Desc_DisallowTeleport Auto
String Property ORD_Spe_SpeakWithAnimals_Desc_DisallowTeleport Auto
String Property ORD_Loc_Hotwire_Desc_DisallowTeleport Auto
String Property ORD_Enc_Spellscribe_Desc_EnableSelfCastSpells Auto
String Property ORD_Bck_TimedBlock_Desc_SquelchTimedBlockMessage auto

; -----

Int T_DisableCityWorldspaceOnly
Int T_DisableHasEffect
Int T_DisableAdvancedLabModel
Int T_DisableAdvancedWorkshopModel
Int T_DisableArcaneNexusModel
Int T_ConDisallowTeleport
Int T_SpeDisallowTeleport
Int T_LocDisallowTeleport
Int T_EnableSelfCastSpells
Int T_SquelchTimedblockMessage

; -----

Event OnPageReset(string akPage)

	SetCursorFillMode(TOP_TO_BOTTOM)
	SetCursorPosition(0)

	AddHeaderOption(ORD_AlchemyOptions)

	T_DisableAdvancedLabModel = AddToggleOption(ORD_Alc_DisableAdvancedLabModel_Text, ORD_Alc_DisableAdvancedLabModel_Global.GetValue() as Bool)

	AddEmptyOption()
	AddHeaderOption(ORD_BlockOptions)

	T_SquelchTimedblockMessage= AddToggleOption(ORD_Bck_TimedBlock_Text_SquelchTimedblockMessage, ORD_Bck_Timedblock_Global_SquelchTimedblockMessage.GetValue() as Bool)

	AddEmptyOption()
	AddHeaderOption(ORD_ConjurationOptions)

	T_ConDisallowTeleport = AddToggleOption(ORD_Con_BoneCollector_Text_DisallowTeleport, ORD_Con_BoneCollector_Global_DisallowTeleport.GetValue() as Bool)

	AddEmptyOption()
	AddHeaderOption(ORD_EnchantingOptions)

	T_DisableArcaneNexusModel= AddToggleOption(ORD_Enc_DisableArcaneNexusModel_Text, ORD_Enc_DisableArcaneNexusModel_Global.GetValue() as Bool)
	T_EnableSelfCastSpells = AddToggleOption(ORD_Enc_Spellscribe_Text_EnableSelfCastSpells, ORD_Enc_Spellscribe_Global_EnableSelfCastSpells.GetValue() as Bool)

	AddEmptyOption()
	AddHeaderOption(ORD_LockpickingOptions)

	T_LocDisallowTeleport = AddToggleOption(ORD_Loc_Hotwire_Text_DisallowTeleport, ORD_Loc_Hotwire_Global_DisallowTeleport.GetValue() as Bool)

	AddEmptyOption()
	AddHeaderOption(ORD_PickpocketOptions)

	T_DisableCityWorldspaceOnly = AddToggleOption(ORD_Pic_ThiefsEye_Text_DisableCityWorldspaceOnly, ORD_Pic_ThiefsEye_Global_DisableCityWorldspaceOnly.GetValue() as Bool)
	T_DisableHasEffect = AddToggleOption(ORD_Pic_ThiefsEye_Text_DisableHasEffect, ORD_Pic_ThiefsEye_Global_DisableHasEffect.GetValue() as Bool)

	AddEmptyOption()
	AddHeaderOption(ORD_SmithingOptions)

	T_DisableAdvancedWorkshopModel = AddToggleOption(ORD_Smh_DisableAdvancedWorkshopModel_Text, ORD_Smh_DisableAdvancedWorkshopModel_Global.GetValue() as Bool)

	AddEmptyOption()
	AddHeaderOption(ORD_SpeechOptions)

	T_SpeDisallowTeleport = AddToggleOption(ORD_Spe_SpeakWithAnimals_Text_DisallowTeleport, ORD_Spe_SpeakWithAnimals_Global_DisallowTeleport.GetValue() as Bool)

EndEvent

; -----

Event OnOptionSelect(Int akOp)

	If akOp == T_DisableCityWorldspaceOnly
		ORD_Pic_ThiefsEye_Global_DisableCityWorldspaceOnly.SetValue(1 - ORD_Pic_ThiefsEye_Global_DisableCityWorldspaceOnly.GetValue())
		SetToggleOptionValue(T_DisableCityWorldspaceOnly, ORD_Pic_ThiefsEye_Global_DisableCityWorldspaceOnly.GetValue() as Bool)

	ElseIf akOp == T_DisableHasEffect
		ORD_Pic_ThiefsEye_Global_DisableHasEffect.SetValue(1 - ORD_Pic_ThiefsEye_Global_DisableHasEffect.GetValue())
		SetToggleOptionValue(T_DisableHasEffect, ORD_Pic_ThiefsEye_Global_DisableHasEffect.GetValue() as Bool)

	ElseIf akOp == T_DisableAdvancedLabModel
		ORD_Alc_DisableAdvancedLabModel_Global.SetValue(1 - ORD_Alc_DisableAdvancedLabModel_Global.GetValue())
		SetToggleOptionValue(T_DisableAdvancedLabModel, ORD_Alc_DisableAdvancedLabModel_Global.GetValue() as Bool)

	ElseIf akOp == T_DisableAdvancedWorkshopModel
		ORD_Smh_DisableAdvancedWorkshopModel_Global.SetValue(1 - ORD_Smh_DisableAdvancedWorkshopModel_Global.GetValue())
		SetToggleOptionValue(T_DisableAdvancedWorkshopModel, ORD_Smh_DisableAdvancedWorkshopModel_Global.GetValue() as Bool)

	ElseIf akOp == T_DisableArcaneNexusModel
		ORD_Enc_DisableArcaneNexusModel_Global.SetValue(1 - ORD_Enc_DisableArcaneNexusModel_Global.GetValue())
		SetToggleOptionValue(T_DisableArcaneNexusModel, ORD_Enc_DisableArcaneNexusModel_Global.GetValue() as Bool)

	ElseIf akOp == T_ConDisallowTeleport
		ORD_Con_BoneCollector_Global_DisallowTeleport.SetValue(1 - ORD_Con_BoneCollector_Global_DisallowTeleport.GetValue())
		SetToggleOptionValue(T_ConDisallowTeleport, ORD_Con_BoneCollector_Global_DisallowTeleport.GetValue() as Bool)

	ElseIf akOp == T_SpeDisallowTeleport
		ORD_Spe_SpeakWithAnimals_Global_DisallowTeleport.SetValue(1 - ORD_Spe_SpeakWithAnimals_Global_DisallowTeleport.GetValue())
		SetToggleOptionValue(T_SpeDisallowTeleport, ORD_Spe_SpeakWithAnimals_Global_DisallowTeleport.GetValue() as Bool)

	ElseIf akOp == T_LocDisallowTeleport
		ORD_Loc_Hotwire_Global_DisallowTeleport.SetValue(1 - ORD_Loc_Hotwire_Global_DisallowTeleport.GetValue())
		SetToggleOptionValue(T_LocDisallowTeleport, ORD_Loc_Hotwire_Global_DisallowTeleport.GetValue() as Bool)

	ElseIf akOp == T_EnableSelfCastSpells
		ORD_Enc_Spellscribe_Global_EnableSelfCastSpells.SetValue(1 - ORD_Enc_Spellscribe_Global_EnableSelfCastSpells.GetValue())
		SetToggleOptionValue(T_EnableSelfCastSpells, ORD_Enc_Spellscribe_Global_EnableSelfCastSpells.GetValue() as Bool)

	ElseIf akOp == T_SquelchTimedblockMessage
		ORD_Bck_TimedBlock_Global_SquelchTimedblockMessage.SetValue(1 - ORD_Bck_TimedBlock_Global_SquelchTimedblockMessage.GetValue())
		SetToggleOptionValue(T_SquelchTimedblockMessage, ORD_Bck_TimedBlock_Global_SquelchTimedblockMessage.GetValue() as Bool)

	EndIf


EndEvent

; -----

Event OnOptionDefault(Int akOp)

	If akOp == T_DisableCityWorldspaceOnly
		ORD_Pic_ThiefsEye_Global_DisableCityWorldspaceOnly.SetValue(0)
		SetToggleOptionValue(T_DisableCityWorldspaceOnly, false)

	ElseIf akOp == T_DisableHasEffect
		ORD_Pic_ThiefsEye_Global_DisableHasEffect.SetValue(0)
		SetToggleOptionValue(T_DisableHasEffect, false)

	ElseIf akOp == T_DisableAdvancedLabModel
		ORD_Alc_DisableAdvancedLabModel_Global.SetValue(0)
		SetToggleOptionValue(T_DisableAdvancedLabModel, false)

	ElseIf akOp == T_DisableAdvancedWorkshopModel
		ORD_Smh_DisableAdvancedWorkshopModel_Global.SetValue(0)
		SetToggleOptionValue(T_DisableAdvancedWorkshopModel, false)

	ElseIf akOp == T_DisableArcaneNexusModel
		ORD_Enc_DisableArcaneNexusModel_Global.SetValue(0)
		SetToggleOptionValue(T_DisableArcaneNexusModel, false)

	ElseIf akOp == T_ConDisallowTeleport
		ORD_Con_BoneCollector_Global_DisallowTeleport.SetValue(0)
		SetToggleOptionValue(T_ConDisallowTeleport, false)

	ElseIf akOp == T_SpeDisallowTeleport
		ORD_Spe_SpeakWithAnimals_Global_DisallowTeleport.SetValue(0)
		SetToggleOptionValue(T_ConDisallowTeleport, false)

	ElseIf akOp == T_LocDisallowTeleport
		ORD_Loc_Hotwire_Global_DisallowTeleport.SetValue(0)
		SetToggleOptionValue(T_LocDisallowTeleport, false)

	ElseIf akOp == T_EnableSelfCastSpells
		ORD_Enc_Spellscribe_Global_EnableSelfCastSpells.SetValue(0)
		SetToggleOptionValue(T_EnableSelfCastSpells, false)

	ElseIf akOp == T_SquelchTimedblockMessage
		ORD_Bck_TimedBlock_Global_SquelchTimedblockMessage.SetValue(0)
		SetToggleOptionValue(T_SquelchTimedblockMessage, false)

	EndIf


EndEvent

; -----

Event OnOptionHighlight(Int akOp)

	If akOp == T_DisableCityWorldspaceOnly
		SetInfoText(ORD_Pic_ThiefsEye_Desc_DisableCityWorldspaceOnly)

	ElseIf akOp == T_DisableHasEffect
		SetInfoText(ORD_Pic_ThiefsEye_Desc_DisableHasEffect)

	ElseIf akOp == T_DisableAdvancedLabModel
		SetInfoText(ORD_Alc_DisableAdvancedLabModel_Desc)

	ElseIf akOp == T_DisableAdvancedWorkshopModel
		SetInfoText(ORD_Smh_DisableAdvancedWorkshopModel_Desc)

	ElseIf akOp == T_DisableArcaneNexusModel
		SetInfoText(ORD_Enc_DisableArcaneNexusModel_Desc)

	ElseIf akOp == T_ConDisallowTeleport
		SetInfoText(ORD_Con_BoneCollector_Desc_DisallowTeleport)

	ElseIf akOp == T_SpeDisallowTeleport
		SetInfoText(ORD_Spe_SpeakWithAnimals_Desc_DisallowTeleport)

	ElseIf akOp == T_LocDisallowTeleport
		SetInfoText(ORD_Loc_Hotwire_Desc_DisallowTeleport)

	ElseIf akOp == T_EnableSelfCastSpells
		SetInfoText(ORD_Enc_Spellscribe_Desc_EnableSelfCastSpells)

	ElseIf akOp == T_SquelchTimedblockMessage
		SetInfoText(ORD_Bck_TimedBlock_Desc_SquelchTimedblockMessage)

	EndIf

EndEvent

; -----
