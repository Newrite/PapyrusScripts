ScriptName HM_MCM Extends SKI_ConfigBase

HM_mod Property _mod Auto
HM_Inventory Property _inventory Auto
HM_Actor Property _actor Auto

Int[] optionID
String[] menu_entries
Int menu_version



Event OnConfigInit()
	optionID = New Int[64]
	menu_entries = New String[2]
	menu_version = 8
EndEvent

Event OnPageReset(String page)	
	drawMenu("$General", 0)
	drawMenu("$Maintenance", 1)
EndEvent

Event OnOptionSliderOpen(Int option)
	setMenuParameters(option)
EndEvent

Event OnOptionSliderAccept(Int option, Float value)
	updateMenu(option, value, True)
	updateModValues(option, value)
EndEvent

Event OnOptionSelect(Int option)
	Bool value = updateMenu (option)
	updateModValues(option, value As Float)
EndEvent

Event OnOptionMenuOpen(Int option)
	setMenuParameters(option)
	drawSubMenu(0, 0, menu_entries)
EndEvent

Event OnOptionMenuAccept (Int option, Int index)
	updateModValues (option, index As Float)
EndEvent

Event OnOptionHighlight(Int option) 
	drawToolTips(option)
EndEvent

Event OnVersionUpdate (Int version)
	If (version != menu_version)
		optionID = New Int[64]
		menu_entries = New String[2]
		menu_version = 8		
	EndIf
EndEvent


Function drawMenu (String header, Int cursor_position)
	SetCursorFillMode(TOP_TO_BOTTOM)
	SetCursorPosition(cursor_position)
	AddHeaderOption(header)
	If (header == "$General")
		optionID[0] = AddToggleOption("$Allow Crafting", _actor.crafting)
		optionID[1] = AddToggleOption("$Allow Tempering", _actor.tempering)
		optionID[2] = AddToggleOption("$Allow Enchanting", _actor.enchanting)	
		optionID[3] = AddToggleOption("$Lore Based Smithing", _actor.lore_based_smithing)
		optionID[4] = AddToggleOption("$Skill Based Smithing", _actor.skill_affects_quality)
		optionID[5] = AddToggleOption("$NPCs Have Materials", _actor.vendors_have_basic_mats)
		optionID[6] = AddToggleOption("$NPCs Have Rare Materials", _actor.vendors_have_rare_mats)
		optionID[7] = AddToggleOption("$Enchanters Know Enchantments", _actor.vendors_know_basic_enchantments)
		optionID[8] = AddToggleOption("$NPC Skill Rebalance", _actor.npc_skill_rebalance)		
		optionID[28] = AddToggleOption("$Use Dual Enchantments", _actor.allow_dual_enchantment)
		optionID[29] = AddToggleOption("$Allow Courier Notifications", _actor.allow_courier_notification)
		AddEmptyOption()
		optionID[9] = AddSliderOption("_", 0.0, "{0}",OPTION_FLAG_DISABLED)
		optionID[10] = AddSliderOption("_", 0.0, "{0}",OPTION_FLAG_DISABLED)
		optionID[11] = AddSliderOption("$Crafting Cost Multiplier", _actor.craft_price_multiplier, "{2}")
		optionID[12] = AddSliderOption("$Tempering Cost Multiplier", _actor.temper_price_multiplier, "{2}")
		optionID[13] = AddSliderOption("$Enchanting Cost Multiplier", _actor.enchant_price_multiplier, "{2}")
		optionID[14] = AddSliderOption("$Recharge Cost Multiplier", _actor.recharge_price_multiplier, "{2}")
		optionID[32] = AddSliderOption("$Materials Cost Multiplier", _actor.materials_price_multiplier, "{2}")
	ElseIf (header == "$Maintenance")
		optionID[16] = AddToggleOption("$Repair", False)	
		optionID[17] = AddToggleOption("$Uninstall Mod", False)
		optionID[18] = AddToggleOption("$Reset Perks", False)
		optionID[30] = AddToggleOption("$Reset NPC Skill", False)
		optionID[31] = AddToggleOption("$Recover Lost Items", False)
		AddHeaderOption("")
		optionID[19] = AddMenuOption("$Add NPC To Smithing Faction", "")		
		optionID[20] = AddMenuOption("$Add NPC To Enchanting Faction", "")
		optionID[21] = AddTextOption("$Change NPC Skill", "", OPTION_FLAG_DISABLED)		
		optionID[22] = AddSliderOption("$NPC Smithing-Skill Level", 0.0, "{0}", OPTION_FLAG_DISABLED)
		optionID[23] = AddSliderOption("$NPC Enchanting-Skill Level", 0.0, "{0}", OPTION_FLAG_DISABLED)
		AddHeaderOption("")
		optionID[15] = AddSliderOption("$Crafting Time", _actor.time_crafting_takes, "{2}")
		optionID[24] = AddSliderOption("$Enchanting Time", _actor.time_enchanting_takes, "{2}")
		optionID[25] = AddSliderOption("$Recharging Time", _actor.time_recharging_takes, "{2}")
		optionID[26] = AddSliderOption("$Common Materials Acquisition Time", _inventory.common_materials_acquisition_time, "{2}")
		optionID[27] = AddSliderOption("$Rare Materials Acquisition Time", _inventory.rare_materials_acquisition_time, "{2}")
		
	EndIf
EndFunction


Function drawSubMenu (Int start_index, Int default_index, String[] entries)	
	SetMenuDialogOptions(entries)
	SetMenuDialogStartIndex(start_index)
	SetMenuDialogDefaultIndex(default_index)
EndFunction


Function setMenuParameters (Int option)	
	If (option == optionID[9])
		SetSliderDialogStartValue(_actor.minimum_skill_level)
		SetSliderDialogDefaultValue(15.0)
		SetSliderDialogRange(1.0, (_actor.maximum_skill_level) )
		SetSliderDialogInterval(1.0)
		
	ElseIf (option == optionID[10])
		SetSliderDialogStartValue(_actor.maximum_skill_level)
		SetSliderDialogDefaultValue(90)
		SetSliderDialogRange((_actor.minimum_skill_level), 200.0)
		SetSliderDialogInterval(1.0)
		
	ElseIf (option == optionID[11])
		SetSliderDialogStartValue(_actor.craft_price_multiplier)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
		
	ElseIf (option == optionID[12])
		SetSliderDialogStartValue(_actor.temper_price_multiplier)
		SetSliderDialogDefaultValue(0.5)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
		
	ElseIf (option == optionID[13])
		SetSliderDialogStartValue(_actor.enchant_price_multiplier)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
		
	ElseIf (option == optionID[14])
		SetSliderDialogStartValue(_actor.recharge_price_multiplier)
		SetSliderDialogDefaultValue(0.50)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
		
	ElseIf (option == optionID[32])
		SetSliderDialogStartValue(_actor.materials_price_multiplier)
		SetSliderDialogDefaultValue(1.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
		
	ElseIf (option == optionID[15])
		SetSliderDialogStartValue(_actor.time_crafting_takes)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)	
		
	ElseIf (option == optionID[19] || option == optionID[20])
		Actor npc =   _actor.getClosestActor()
		if (npc != _actor.player)
			menu_entries[0] =  "$Do NOT add"
			menu_entries[1] = npc.GetBaseObject().GetName()
		else			
			menu_entries[0] = "$Nothing In Range"
			menu_entries[1] = ""
		endif		
	ElseIf (option == optionID[22])
		SetSliderDialogStartValue(_actor.getClosestActor().GetActorValue("Smithing") )
		SetSliderDialogRange(_actor.minimum_skill_level, _actor.maximum_skill_level)
		SetSliderDialogInterval(1.0)
		
	ElseIf (option == optionID[23])
		SetSliderDialogStartValue(_actor.getClosestActor().GetActorValue("Enchanting") )
		SetSliderDialogRange(_actor.minimum_skill_level, _actor.maximum_skill_level)
		SetSliderDialogInterval(1.0)
		
	ElseIf (option == optionID[24])
		SetSliderDialogStartValue(_actor.time_enchanting_takes)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
		
	ElseIf (option == optionID[25])
		SetSliderDialogStartValue(_actor.time_recharging_takes)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0.0, 10.0)
		SetSliderDialogInterval(0.01)
		
	ElseIf (option == optionID[26])
		SetSliderDialogStartValue(_inventory.common_materials_acquisition_time)
		SetSliderDialogDefaultValue(0.01)
		SetSliderDialogRange(0.0, 1.0)
		SetSliderDialogInterval(0.01)
		
	ElseIf (option == optionID[27])
		SetSliderDialogStartValue(_inventory.rare_materials_acquisition_time)
		SetSliderDialogDefaultValue(0.1)
		SetSliderDialogRange(0.0, 1.0)
		SetSliderDialogInterval(0.01)
	EndIf	
EndFunction


Bool Function updateMenu (Int option, Float value = 0.0, Bool slider = False)
	If (slider)
		If (option == optionID[9] || option == optionID[10] || option == optionID[22] || option == optionID[23])
			SetSliderOptionValue(option, value, "{0}")
		Else
			SetSliderOptionValue(option, value, "{2}")
		EndIf
	ElseIf (option == optionID[0])
		SetToggleOptionValue(option, !_actor.crafting)
		Return !_actor.crafting
	ElseIf (option == optionID[1])
		SetToggleOptionValue(option, !_actor.tempering)
		Return !_actor.tempering
	ElseIf (option == optionID[2])
		SetToggleOptionValue(option, !_actor.enchanting)
		Return !_actor.enchanting	
	ElseIf (option == optionID[3])
		SetToggleOptionValue(option, !_actor.lore_based_smithing)
		Return !_actor.lore_based_smithing
	ElseIf (option == optionID[4])
		SetToggleOptionValue(option, !_actor.skill_affects_quality)
		Return !_actor.skill_affects_quality
	ElseIf (option == optionID[5])
		SetToggleOptionValue(option, !_actor.vendors_have_basic_mats)
		Return !_actor.vendors_have_basic_mats		
	ElseIf (option == optionID[6])
		SetToggleOptionValue(option, !_actor.vendors_have_rare_mats)
		Return !_actor.vendors_have_rare_mats
	ElseIf (option == optionID[7])
		SetToggleOptionValue(option, !_actor.vendors_know_basic_enchantments)
		Return !_actor.vendors_know_basic_enchantments
	ElseIf (option == optionID[8])
		SetToggleOptionValue(option, !_actor.npc_skill_rebalance)
		Return !_actor.npc_skill_rebalance
	ElseIf (option == optionID[17])
		SetToggleOptionValue(option, True)
	ElseIf (option == optionID[21])
		Actor npc = _actor.getClosestActor()		
		If (npc != _actor.player)			
			SetTextOptionValue(option, npc.GetBaseObject().GetName() )
			SetOptionFlags(optionID[22], OPTION_FLAG_NONE)
			SetOptionFlags(optionID[23], OPTION_FLAG_NONE)
		Else			
			SetTextOptionValue(option, "$Nothing In Range")
		EndIf		
	ElseIf (option == optionID[28])
		SetToggleOptionValue(option, !_actor.allow_dual_enchantment)
		Return !_actor.allow_dual_enchantment
	ElseIf (option == optionID[29])
		SetToggleOptionValue(option, !_actor.allow_courier_notification)
		Return !_actor.allow_courier_notification
	EndIf	
	Return False
EndFunction


Function updateModValues (Int option, Float value)
	If (option == optionID[0])
		_actor.crafting= value
	ElseIf (option == optionID[1])
		_actor.tempering = value
	ElseIf (option == optionID[2])
		_actor.enchanting = value	
	ElseIf (option == optionID[3])
		_actor.lore_based_smithing = value
	ElseIf (option == optionID[4])
		_actor.skill_affects_quality = value	
	ElseIf (option == optionID[5])
		_actor.vendors_have_basic_mats = value
		_inventory.setAvailableMaterials()
	ElseIf (option == optionID[6])
		_actor.vendors_have_rare_mats = value
		_inventory.setAvailableMaterials()
	ElseIf (option == optionID[7])
		_actor.vendors_know_basic_enchantments = value
	ElseIf (option == optionID[8])
		_actor.npc_skill_rebalance = value
	ElseIf (option == optionID[9])
		_actor.minimum_skill_level = value	
	ElseIf (option == optionID[10])
		_actor.maximum_skill_level = value
	ElseIf (option == optionID[11])
		_actor.craft_price_multiplier = value
	ElseIf (option == optionID[12])
		_actor.temper_price_multiplier = value
	ElseIf (option == optionID[13])
		_actor.enchant_price_multiplier = value
	ElseIf (option == optionID[14])
		_actor.recharge_price_multiplier = value
	ElseIf (option == optionID[32])
		_actor.materials_price_multiplier = value
	ElseIf (option == optionID[15])
		_actor.time_crafting_takes = value	
	ElseIf (option == optionID[16])		
		If (!_mod.checkQuestStatus() )
			Debug.MessageBox(_mod.messages.STOPPED)
			Return
		EndIf
		_mod.update()		
	ElseIf (option == optionID[17])	
		_mod.uninstall()
	ElseIf (option == optionID[18])	
		_actor.resetPerks()
		Debug.MessageBox(_mod.messages.PERKS_RESET)
	ElseIf (option == optionID[19] && value)
		_actor.addNPCToFaction (True)
	ElseIf (option == optionID[20] && value)
		_actor.addNPCToFaction (False)
	ElseIf (option == optionID[22] || option == optionID[23])
		string discipline
		actor npc = _actor.getClosestActor()	
		_actor.overridePredeterminedSkill(npc, value as Int)
		if (option == optionID[22])
			discipline = "Smithing"
		else 
			discipline = "Enchanting"
		endif
		npc.SetActorValue(discipline, value)	
	ElseIf (option == optionID[24])
		_actor.time_enchanting_takes = value
	ElseIf (option == optionID[25])
		_actor.time_recharging_takes = value
	ElseIf (option == optionID[26])
		_inventory.common_materials_acquisition_time = value
	ElseIf (option == optionID[27])
		_inventory.rare_materials_acquisition_time = value
	ElseIf (option == optionID[28])
		_actor.allow_dual_enchantment = value
		_mod.activateDualEnchantment(value);
	ElseIf (option == optionID[29])
		_actor.allow_courier_notification = value
	ElseIf (option == optionID[30])
		_actor.InitializePredeterminedSkills(_mod.checkModPresence("Dragonborn.esm"), _mod.checkModPresence("Dawnguard.esm") )	
		Debug.MessageBox(_mod.messages.NPC_SKILL_RESTORED)
	ElseIf (option == optionID[31])
		_inventory.item_storage.activate(_actor.player)
		_mod.resetMerchants()
		debug.messageBox(_mod.messages.RECOVER_CONTAINER)
	EndIf
EndFunction


Function drawToolTips (Int option)
	If (option == optionID[0])
		SetInfoText ("$ENABLE_CRAFTING")
	ElseIf (option == optionID[1])
		SetInfoText ("$ENABLE_TEMPERING")
	ElseIf (option == optionID[2])
		SetInfoText ("$ENABLE_ENCHANTING")
	ElseIf (option == optionID[3])
		SetInfoText ("$LORE_SMITHING")
	ElseIf (option == optionID[4])
		SetInfoText ("$SKILL_BASED_SMITHING")
	ElseIf (option == optionID[5])	
		SetInfoText ("$NPCS_HAVE_MATS")
	ElseIf (option == optionID[6])
		SetInfoText ("$NPCS_HAVE_RARE_MATS")
	ElseIf (option == optionID[7])
		SetInfoText ("$ENCHANTMENTS_KNOWN")
	ElseIf (option == optionID[8])
		SetInfoText ("$SKILL_REBALANCE")
	ElseIf (option == optionID[9])
		SetInfoText ("")
	ElseIf (option == optionID[10])
		SetInfoText ("")
	ElseIf (option == optionID[11])
		SetInfoText ("$CRAFT_MULT")
	ElseIf (option == optionID[12])
		SetInfoText ("$TEMP_MULT")
	ElseIf (option == optionID[13])
		SetInfoText ("$ENCHANT_MULT")
	ElseIf (option == optionID[14])
		SetInfoText ("$RECHARGE_MULT")
	ElseIf (option == optionID[15])
		SetInfoText ("$CRAFT_TIME")
	ElseIf (option == optionID[16])
		SetInfoText ("$UPDATE")
	ElseIf (option == optionID[18])
		SetInfoText ("$RESET_PERKS")
	ElseIf (option == optionID[19])
		SetInfoText ("$ADD_SMITH")
	ElseIf (option == optionID[20])
		SetInfoText ("$ADD_ENCHANT")
	ElseIf (option == optionID[21])
		SetInfoText ("$CHANGE_SKILL")
	ElseIf (option == optionID[22])
		SetInfoText ("$CHANGE_SMITH_SKILL")
	ElseIf (option == optionID[23])
		SetInfoText ("$CHANGE_ENCHANT_SKILL")
	ElseIf (option == optionID[24])
		SetInfoText ("$ENCHANT_TIME")
	ElseIf (option == optionID[25])
		SetInfoText ("$RECHARGE_TIME")
	ElseIf (option == optionID[26])
		SetInfoText ("$MATS_TIME")
	ElseIf (option == optionID[27])
		SetInfoText ("$RARE_MATS_TIME")
	ElseIf (option == optionID[28])
		SetInfoText ("$EXTRA_EFFECT")
	ElseIf (option == optionID[29])
		SetInfoText ("$ALLOW_COURIER" )
	ElseIf (option == optionID[30])
		SetInfoText ("$RESET_SKILLS" )
	ElseIf (option == optionID[31])
		SetInfoText ("$RECOVER_ITEMS" )
	ElseIf (option == optionID[32])
		SetInfoText ("$MATS_MULT" )
	EndIf
EndFunction


Int Function GetVersion()
	Return 8
EndFunction

Int Property script_version Hidden
Int Function get ()
	return 6
EndFunction
EndProperty