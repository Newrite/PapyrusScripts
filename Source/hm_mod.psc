ScriptName HM_mod Extends Quest

HM_inventory Property _inventory Auto
HM_Actor Property _actor Auto
HM_main Property _main Auto
HM_MCM Property _mcm Auto
HM_Stations Property _station Auto
HM_courier Property _courier Auto
HM_array_extension_library Property _hmael Auto
HM_update Property _update Auto
HM_Messages Property messages Auto
ReferenceAlias Property _mcm_alias Auto
ReferenceAlias Property _craft_alias Auto
ReferenceAlias Property _npc_stay_idle_alias Auto
Float Property version Auto Hidden
Key Property file_version Auto
Float Property latest_version = 1.091 Auto Hidden
Int Property latest_file_version = 4 Auto Hidden
Int Property latest_script_version = 6 Auto Hidden




Bool Function checkSKSE ()
	If (SKSE.GetVersionRelease() >= 48)
		Return True
	EndIf
	Debug.MessageBox(messages.SKSE_ERROR)
	pauseMod()
	Return False	
EndFunction


Function update ()	
	If (!initialize() )
		_main.goToState("")
	Else
		updateCoreDefaults()
		_main.goToState("Thread0")
		Debug.MessageBox(messages.UPDATE_SUCCESS + " " + version)	
	EndIf
EndFunction


Bool Function checkScriptsVersion ()
	Int version_sum = script_version + _main.script_version + _inventory.script_version +  _actor.script_version + _mcm.script_version + _hmael.script_version + _update.script_version	+ _main._player.script_version +_main._vendor_container.script_version
	If (version_sum == (latest_script_version * 9) )
		Return True
	EndIf
	Debug.MessageBox(messages.SCRIPT_MISMATCH)	
	Return False
EndFunction


Bool Function checkFileVersion ()
	If (file_version && file_version.GetGoldValue() == latest_file_version) 
		Return True
	EndIf
	Debug.MessageBox(messages.FILE_MISMATCH)
	Return False
EndFunction


Function resetForms ()		
	_inventory.equipped = New Form[128]
	_inventory.equipment_enchantment = New Form[128]
	_inventory.equipment_health = New Float[128]		
	_inventory.equipment = New Form[128]
	_inventory.equipment = Utility.resizeFormArray(_inventory.equipment, 2048);
	_inventory.equipment_to_modify = New Form[128]
	_inventory.equipment_new = New Form[128]
	_inventory.npc_materials = New Form[128]
	_inventory.npc_materials_count = New Int[128]
	_inventory.materials_used = New Form[128]
	_inventory.materials_used_count = New Int[128]
	_inventory.npc_merchant_container = New ObjectReference[10]
	_actor.player_perks = New Form[64]
	_actor.player_enchantments = New Form[64]
EndFunction


Bool Function initialize ()	
	resetForms()
	resetMerchants()
	resetCourierSystem()
	_hmael.createArrays()
	createStructureElements()
	_inventory.setAvailableMaterials()
	_actor.initializePerks()
	_actor.InitializePredeterminedSkills(checkModPresence("Dragonborn.esm"), checkModPresence("Dawnguard.esm") )	
	addCompatibilityOptions()	
	version = latest_version
	Return (checkSKSE() && checkModIntegrity() )
EndFunction


Function uninstall ()
	Self.Stop()
	_mcm.Stop()
	_courier.Stop()
	_mcm_alias.Clear()
	_craft_alias.Clear()
	_npc_stay_idle_alias.Clear()
	_station.enchanter.Delete()
	_station.workbench.Delete()
	_station.grindStone.Delete()
	_station.SkyForge.Delete()
	_station.forge.Delete()	
	_inventory.drop_box.Delete()
	_inventory.transition_container.Delete() 
	_inventory.item_storage.Delete()
	_actor.sale_merchant.Delete()
	_actor.mannequin.Delete()	
	Debug.MessageBox(messages.UNINSTALL)
EndFunction


Function pauseMod ()
	_main.GoToState("")
	Self.RegisterForSingleUpdate(0.5)
EndFunction


Bool Function checkModIntegrity ()
	If (checkFileVersion() && checkScriptsVersion() )
		If (_main._station && _main._inventory && _main._actor && _main._player && _main._vendor_container && _main._hmael)		
			If (_inventory._actor && _inventory._station && _inventory.transition_container && _inventory.drop_box && _inventory.gold && _inventory.materials)			
				If (_inventory.equipped && _inventory.equipment_enchantment && _inventory.equipment_health && _inventory.equipment && _inventory.equipment_to_modify && _inventory.equipment_new)
					If (_actor.player && _actor.sale_merchant && _actor.mannequin && _actor.enchanting_faction && _actor.smithing_faction)	
						Return True					
					EndIf
				EndIf
			EndIf
		EndIf
		Debug.MessageBox(messages.PROPERTY_ERROR)
	EndIf
	pauseMod()
	Return False
EndFunction


Bool Function checkQuestStatus ()
	If ((Self As Quest).IsRunning() )
		Return True
	EndIf
	Return False
EndFunction


Function resetMerchants ()	
	Actor[] merchants = _hmael.getActorStructures()
	hm_array_extension_library.sortActorArray(merchants)
	Int merchant_index = merchants.Find(None)	
	While (merchant_index > 0)
		merchant_index -= 1
		merchants[merchant_index].RemoveItem(_inventory.has_equipment_in_storage, 50)
		_actor.orders_list.RemoveAddedForm(merchants[merchant_index].GetBaseObject() );
	EndWhile
EndFunction

Function resetCourierSystem ()
	_courier.Stop()	
	_actor.sent_letters = New Actor[11]
	_actor.last_letter_read = 0
	_actor.player.RemoveItem(Game.GetFormFromFile(0x0001d211, "HonedMetal.esp"), 100, True)	
EndFunction

Function createStructureElements ()
	;Enumerators	
	_inventory.EQUIPMENT_RELATION = 1 ;map identifier 
	_inventory.EQUIPMENT_COUNT = 2 ;map identifier
	_actor.TIME_STARTED_WORKING = 3 ;member identifier
	_inventory.STORED_EQUIPMENT = 4 ;member identifier	
	_actor.NPC_SERVICE_COMPLETION_TIME = 5 ;member identifier
	_actor.VENDOR_SKILL = 6 ;member identifier
	_actor.TRANSACTION_TYPE = 7 ;member identifier
	_inventory.MATERIALS_COST = 8 ;member identifier
	_inventory.WEAPONS_AVERAGE_CHARGE = 9 ;member identifier	
	
	_hmael.structuresAddMap(_inventory.EQUIPMENT_COUNT)	
	_hmael.structuresAddMap(_inventory.EQUIPMENT_RELATION)	
EndFunction


Bool Function checkModPresence (String mod_name)
	If (Game.GetModByName(mod_name) != 255)
		Return True
	EndIf
	Return False
EndFunction


Function addCompatibilityOptions ()	
	If (checkModPresence("Dragonborn.esm") )
		Form netch_leather = Game.GetFormFromFile(0x0501CD7C, "Dragonborn.esm")
		Form chitin_plate = Game.GetFormFromFile(0x0502B04E, "Dragonborn.esm")
		_inventory.materials.AddForm(netch_leather)
		_inventory.materials.AddForm(chitin_plate)
		actor glover = (Game.GetFormFromFile(0x0001828E, "Dragonborn.esm")As Actor)
		actor baldor = (Game.GetFormFromFile(0x00018FB5, "Dragonborn.esm")As Actor)
		if (glover || baldor)
			glover.AddToFaction(_actor.smithing_faction)
			baldor.AddToFaction(_actor.smithing_faction)
		endif
	EndIf
	If (checkModPresence("Dawnguard.esm") )
		actor gunmar = (Game.GetFormFromFile(0x0000336C, "Dawnguard.esm")As actor)
		actor hestla = (Game.GetFormFromFile(0x00003365, "Dawnguard.esm")As actor)
		If (gunmar || hestla)
			gunmar.AddToFaction(_actor.smithing_faction)
			hestla.AddToFaction(_actor.smithing_faction)
		endif
	EndIF
	If (checkModPresence("Requiem.esp") )		
		addRequiemPerks()
		If (checkModPresence("Requiem - Behind the Curtain.esp") )
			addBTCperks()
		Endif
	ElseIf (checkModPresence("PerkusMaximus_Master.esp") )
		addPermaPerks()
	Elseif (checkModPresence("SkyRe_Main.esp") )		
		addSkyRePerks()
	ElseIf (checkModPresence("SPERG.esp") )		
		addSpergPerks()
	elseif (checkModPresence("Ordinator - Perks of Skyrim.esp") )
		addOrdinatorPerks()
	else 
		game_overhaul_installed = false;	
	endif
	If (checkModPresence("ACE Smithing.esp") )
		addACEPeks()	
	endif
	If (checkModPresence("ACE Enchanting.esp") )
		addACEEnchantingPeks()
		game_overhaul_installed = true		
	Endif
	If (checkModPresence("Smithing Perks Overhaul_Remade.esp") )
		addACESPOPerks()
	EndIf	
EndFunction

Function addPermaPerks ()
	Perk xMASMIAnimunculi0 = Game.GetFormFromFile(0x000A8283, "PerkusMaximus_Master.esp") As Perk
	Perk xMASMIAnimunculi1 = Game.GetFormFromFile(0x000A8286, "PerkusMaximus_Master.esp") As Perk
	Perk xMASMIAnimunculi2 = Game.GetFormFromFile(0x000A8287, "PerkusMaximus_Master.esp") As Perk
	Perk xMASMIMaterialLeather = Game.GetFormFromFile(0x001d8be6, "PerkusMaximus_Master.esp") As Perk
	Perk xMASMIWeaponsmith = Game.GetFormFromFile(0x0036d873, "PerkusMaximus_Master.esp") As Perk		
	Perk xMASMIArmorer = Game.GetFormFromFile(0x0036d874, "PerkusMaximus_Master.esp") As Perk
	Perk xMASMICraftsman0 = Game.GetFormFromFile(0x003c3ab0, "PerkusMaximus_Master.esp") As Perk
	Perk xMASMICraftsman1 = Game.GetFormFromFile(0x003c3ab1, "PerkusMaximus_Master.esp") As Perk
	Perk xMASMIMaterialGoldAndSilver = Game.GetFormFromFile(0x000a82a6, "PerkusMaximus_Master.esp") As Perk
	Perk xMASMIMaterialRefinedSilver = Game.GetFormFromFile(0x00054ff5, "PerkusMaximus_Master.esp") As Perk
	Perk xMASMIMasteryWarforged = Game.GetFormFromFile(0x00619535, "PerkusMaximus_Master.esp") As Perk
	Perk xMASMICopycat = Game.GetFormFromFile(0x0036d875, "PerkusMaximus_Master.esp") As Perk
	Perk xMASMIHuntingGrounds0 = Game.GetFormFromFile(0x0019AD2B, "PerkusMaximus_Master.esp") As Perk
	Perk xMASMIHuntingGrounds1 = Game.GetFormFromFile(0x0019AD2C, "PerkusMaximus_Master.esp") As Perk
	Perk xMASMIMeltdown = Game.GetFormFromFile(0x000A82A5, "PerkusMaximus_Master.esp") As Perk
	Perk xMASMIRepairUnit = Game.GetFormFromFile(0x000A8288, "PerkusMaximus_Master.esp") As Perk		
	Perk xMAENCBasicScripture = Game.GetFormFromFile(0x002888A7, "PerkusMaximus_Master.esp") As Perk
	Perk xMAENCAdvancedScripture = Game.GetFormFromFile(0x0028B045, "PerkusMaximus_Master.esp") As Perk
	Perk xMAENCElaborateScripture = Game.GetFormFromFile(0x0028B046, "PerkusMaximus_Master.esp") As Perk
	Perk xMAENCSagesScripture = Game.GetFormFromFile(0x0028D80F, "PerkusMaximus_Master.esp") As Perk
	Perk xMAENCEnchanter0 = Game.GetFormFromFile(0x001B4CF2, "PerkusMaximus_Master.esp") As Perk
	Perk xMAENCEnchanter1 = Game.GetFormFromFile(0x001B4CF4, "PerkusMaximus_Master.esp") As Perk
	Perk xMAENCStaffaire = Game.GetFormFromFile(0x001BEF1E, "PerkusMaximus_Master.esp") As Perk
	
	If (xMASMIMaterialLeather && xMASMIWeaponsmith && xMASMIArmorer && xMASMICraftsman0 && xMASMICraftsman1 && xMASMIMaterialGoldAndSilver && xMASMIMaterialRefinedSilver && xMASMIMasteryWarforged && xMASMICopycat \
		&& xMASMIHuntingGrounds0 && xMASMIHuntingGrounds1 && xMASMIMeltdown && xMASMIRepairUnit && xMASMIAnimunculi0 && xMASMIAnimunculi1 && xMASMIAnimunculi2 && xMAENCBasicScripture && xMAENCAdvancedScripture \
		&& xMAENCElaborateScripture && xMAENCSagesScripture && xMAENCEnchanter0 && xMAENCEnchanter1 && xMAENCStaffaire)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMIAnimunculi0, 35) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMIAnimunculi1, 55) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMIAnimunculi2, 80) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMIMaterialLeather, 20) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMIWeaponsmith, 40) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMIArmorer, 40) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMICraftsman0, 10) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMICraftsman1, 50) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMIMaterialGoldAndSilver, 30) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMIMaterialRefinedSilver, 45) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMIMasteryWarforged, 50)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMICopycat, 55) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMIHuntingGrounds0, 30) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMIHuntingGrounds1, 55) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMIMeltdown, 25) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xMASMIRepairUnit, 45)		
		_hmael.deleteAllMapElements(_actor.ENCHANTING_PERKS)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter00, 40) ;Vanilla perks unused by perma. Increase enchanting potency; added to offset the 4% enchant potency loss for each perma enchanting perk that isn't added. 
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter20, 60)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter40, 90)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, xMAENCBasicScripture, 15) 
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, xMAENCAdvancedScripture, 30) 
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, xMAENCElaborateScripture, 45) 
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, xMAENCSagesScripture, 70) 
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, xMAENCEnchanter0, 10) 
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, xMAENCEnchanter1, 50) 
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, xMAENCStaffaire, 10)		
		return
	EndIf	
	Debug.MessageBox("Perma: " + messages.ADDON_ERROR)
EndFunction

Function addRequiemPerks()	
	_hmael.deleteMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter40)
	_hmael.deleteMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter60)
	_hmael.deleteMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter80, True)	
	Perk AA000XarrianArcaneCraftmanship = Game.GetFormFromFile(0x03309d25, "Requiem.esp") As Perk
	Perk AA000XarrianSmithingLegendaryBlacksmithing = Game.GetFormFromFile(0x0317b8bf, "Requiem.esp") As Perk	
	
	If (AA000XarrianSmithingLegendaryBlacksmithing && AA000XarrianArcaneCraftmanship)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, AA000XarrianArcaneCraftmanship, 50)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, AA000XarrianSmithingLegendaryBlacksmithing, 100)
		Return
	EndIf
	Debug.MessageBox("Requiem: " + messages.ADDON_ERROR)
EndFunction

Function addBTCperks ()
	Perk steelPlateSmithing = Game.GetFormFromFile(0x000059c0, "Requiem - Behind the Curtain.esp") As Perk
	Perk nordicSmithing = Game.GetFormFromFile(0x000059c3, "Requiem - Behind the Curtain.esp") As Perk
	Perk bosmerSmithing = Game.GetFormFromFile(0x00000889, "Requiem - Behind the Curtain.esp") As Perk
	
	If (steelPlateSmithing && nordicSmithing && bosmerSmithing)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, steelPlateSmithing, 20)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, nordicSmithing, 55)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, bosmerSmithing, 40)
		Return
	EndIf
	Debug.MessageBox("Requiem BTC: " + messages.ADDON_ERROR)
EndFunction

Function addSkyRePerks ()	
	Perk xxxSMILeathercraft = Game.GetFormFromFile(0x001D8BE6,"SkyRe_Main.esp") As Perk 
	Perk xxxSmithingArmorer0 = Game.GetFormFromFile(0x00007CE0,"SkyRe_Main.esp") As Perk 
	Perk xxxSmithingArmorer1 = Game.GetFormFromFile(0x00007CE9,"SkyRe_Main.esp") As Perk 
	Perk xxxSmithingArmorer2 = Game.GetFormFromFile(0x00007CEA,"SkyRe_Main.esp") As Perk 
	Perk xxxSmithingArmorer3 = Game.GetFormFromFile(0x00007CEB,"SkyRe_Main.esp") As Perk 
	Perk xxxSmithingArmorer4 = Game.GetFormFromFile(0x00007CEC,"SkyRe_Main.esp") As Perk 
	Perk xxxSmithingBlacksmith0 = Game.GetFormFromFile(0x00007CDE,"SkyRe_Main.esp") As Perk 
	Perk xxxSmithingBlacksmith1 = Game.GetFormFromFile(0x00007CDF,"SkyRe_Main.esp") As Perk 
	Perk xxxSmithingBlacksmith2 = Game.GetFormFromFile(0x00007CE1,"SkyRe_Main.esp") As Perk 
	Perk xxxSmithingBlacksmith3 = Game.GetFormFromFile(0x00007CE2,"SkyRe_Main.esp") As Perk 
	Perk xxxSmithingBlacksmith4 = Game.GetFormFromFile(0x00007CE3,"SkyRe_Main.esp") As Perk 
	Perk xxxSmithingDeepSilver = Game.GetFormFromFile(0x00054FF5,"SkyRe_Main.esp") As Perk 
	Perk xxxSmithingTreasurecraft = Game.GetFormFromFile(0x000513EE,"SkyRe_Main.esp") As Perk 
	Perk xxxSmithingWeavingMill = Game.GetFormFromFile(0x0005C827,"SkyRe_Main.esp") As Perk 	
	Perk xxxEnchantingDefensiveEnchanter0 = Game.GetFormFromFile(0x0000776F,"SkyRe_Main.esp") As Perk 
	Perk xxxEnchantingDefensiveEnchanter1 = Game.GetFormFromFile(0x00007770,"SkyRe_Main.esp") As Perk 
	Perk xxxEnchantingElementalEnchanter0 = Game.GetFormFromFile(0x0000776C,"SkyRe_Main.esp") As Perk 
	Perk xxxEnchantingElementalEnchanter1 = Game.GetFormFromFile(0x0000776D,"SkyRe_Main.esp") As Perk		
	Perk xxxEnchantingDreamweaver0 = Game.GetFormFromFile(0x0005B210,"SkyRe_Main.esp") As Perk
	Perk xxxEnchantingDreamweaver1 = Game.GetFormFromFile(0x0005B211,"SkyRe_Main.esp") As Perk
	Perk xxxEnchantingHiddenPotential0 = Game.GetFormFromFile(0x00007772,"SkyRe_Main.esp") As Perk
	
	if (xxxSMILeathercraft && xxxSmithingArmorer0 && xxxSmithingArmorer1 && xxxSmithingArmorer2 && xxxSmithingArmorer3 && xxxSmithingArmorer4 && xxxSmithingBlacksmith0 && xxxSmithingBlacksmith1 && xxxSmithingBlacksmith2 && xxxSmithingBlacksmith3 \
		&& xxxSmithingBlacksmith4 && xxxSmithingDeepSilver && xxxSmithingTreasurecraft && xxxSmithingWeavingMill && xxxEnchantingDefensiveEnchanter0 && xxxEnchantingDefensiveEnchanter1 && xxxEnchantingElementalEnchanter0 && xxxEnchantingElementalEnchanter1 \
		&& xxxEnchantingDreamweaver0 && xxxEnchantingDreamweaver1 && xxxEnchantingHiddenPotential0)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xxxSMILeathercraft, 20)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xxxSmithingArmorer0, 15)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xxxSmithingArmorer1, 35)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xxxSmithingArmorer2, 55)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xxxSmithingArmorer3, 75)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xxxSmithingArmorer4, 95)		
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xxxSmithingBlacksmith0, 10) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xxxSmithingBlacksmith1, 20) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xxxSmithingBlacksmith2, 40) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xxxSmithingBlacksmith3, 60) 
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xxxSmithingBlacksmith4, 80)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xxxSmithingDeepSilver, 60)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xxxSmithingTreasurecraft, 40)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, xxxSmithingWeavingMill, 50)		
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, xxxEnchantingDefensiveEnchanter0, 30)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, xxxEnchantingDefensiveEnchanter1, 60)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, xxxEnchantingElementalEnchanter0, 30)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, xxxEnchantingElementalEnchanter1, 60)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, xxxEnchantingDreamweaver0, 20)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, xxxEnchantingDreamweaver1, 50)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, xxxEnchantingHiddenPotential0, 100)
		return
	endif
	Debug.MessageBox("SkyRe: " + messages.ADDON_ERROR)
EndFunction

Function addSpergPerks ()
	Perk enchanter = Game.GetFormFromFile(0x0003911f, "SPERG.esm") As Perk
	Perk wisdom = Game.GetFormFromFile(0x00039122, "SPERG.esm") As Perk
	Perk sagacity = Game.GetFormFromFile(0x00039123, "SPERG.esm") As Perk
	Perk intensity = Game.GetFormFromFile(0x0003a14c, "SPERG.esm") As Perk   
	Perk enchantedWeave = Game.GetFormFromFile(0x0003ac60, "SPERG.esm") As Perk
	Perk openMinded = Game.GetFormFromFile(0x0005cbfc, "SPERG.esm") As Perk 
	Perk gliteringPrizes = Game.GetFormFromFile(0x0003ac5e, "SPERG.esm") As Perk	
	Perk lightArmorer = Game.GetFormFromFile(0x0000182f, "SPERG.esm") As Perk  
	Perk heavyArmorer = Game.GetFormFromFile(0x0000182e, "SPERG.esm") As Perk  	
	Perk weaponSmith = Game.GetFormFromFile(0x00001830, "SPERG.esm") As Perk

	if (enchanter && wisdom && sagacity && intensity && enchantedWeave && openMinded && gliteringPrizes && lightArmorer && heavyArmorer && weaponSmith)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, lightArmorer, 30)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, heavyArmorer, 40)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, weaponSmith, 80)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, gliteringPrizes, 70)
		_hmael.deleteAllMapElements(_actor.ENCHANTING_PERKS)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, enchanter, 10)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, wisdom, 75)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, sagacity, 100)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, intensity, 25)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, enchantedWeave, 60)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, openMinded, 35)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, gliteringPrizes, 70)		
		return
	endif
	Debug.MessageBox("Sperg: " + messages.ADDON_ERROR)
EndFunction

Function addOrdinatorPerks ()		
	Perk dwarvenCannon0 =Game.GetFormFromFile(0x00056C92, "Ordinator - Perks of Skyrim.esp") As Perk
	Perk dwarvenCannon1 =Game.GetFormFromFile(0x000587A0, "Ordinator - Perks of Skyrim.esp") As Perk
	Perk preserver = Game.GetFormFromFile(0x000394FA, "Ordinator - Perks of Skyrim.esp") As Perk
	Perk regalia = Game.GetFormFromFile(0x00039A6D, "Ordinator - Perks of Skyrim.esp") As Perk	
	
	if (dwarvenCannon0 && dwarvenCannon1 && preserver && regalia)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, dwarvenCannon0, 20)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, dwarvenCannon1, 50)	
		_hmael.deleteAllMapElements(_actor.ENCHANTING_PERKS)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter00, 10)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter20, 20)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter40, 55)  ;To simulate the "Gem Dust" perk. An enchanter of this level would be able to have this perk and apply the proper gem dust for the given item.
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter60, 90)  ;To simulate the "Arcane Nexus" perk. An enchanter of this level would naturally have upgraded their enchanting table a long time ago.
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, preserver, 50)
		_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, regalia, 60)
		return
	EndiF
	Debug.MessageBox("Ordinator: " + messages.ADDON_ERROR)
EndFunction

Function addACEPeks ()	
	Perk ACE_Smithing_Armorsmith_NPC = Game.GetFormFromFile(0x00000D6C, "ACE Smithing.esp") As Perk ;20
	Perk ACE_Smithing_Armorsmith50_NPC = Game.GetFormFromFile(0x00000D6E, "ACE Smithing.esp") As Perk ;85
	Perk ACE_Smithing_Weaponsmith_NPC = Game.GetFormFromFile(0x00000D6D, "ACE Smithing.esp") As Perk ;25
	Perk ACE_Smithing_Weaponsmith50_NPC = Game.GetFormFromFile(0x00000D6f, "ACE Smithing.esp") As Perk ;90
	Perk ACE_Smithing_IronAndLeatherBasic_NPC = Game.GetFormFromFile(0x0000B47F, "ACE Smithing.esp") As Perk ;10	
	
	if (ACE_Smithing_Armorsmith_NPC && ACE_Smithing_Armorsmith50_NPC && ACE_Smithing_Weaponsmith_NPC && ACE_Smithing_Weaponsmith50_NPC && ACE_Smithing_IronAndLeatherBasic_NPC)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, ACE_Smithing_IronAndLeatherBasic_NPC, 10)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, ACE_Smithing_Armorsmith_NPC, 20)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, ACE_Smithing_Armorsmith50_NPC, 85)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, ACE_Smithing_Weaponsmith_NPC, 25)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, ACE_Smithing_Weaponsmith50_NPC, 90)	
		return
	endif
	Debug.MessageBox("ACE Smithing: " + messages.ADDON_ERROR)
EndFunction

Function addACEEnchantingPeks()
	_hmael.deleteMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter60)
	_hmael.deleteMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter80, True)
EndFunction

Function addACESPOPerks ()
	Perk SPONoviceSmith = Game.GetFormFromFile(0x0000B410, "Smithing Perks Overhaul_Remade.esp") As Perk 
	Perk SPOApprenticeSmith = Game.GetFormFromFile(0x0000B411, "Smithing Perks Overhaul_Remade.esp") As Perk 
	Perk SPOAdeptSmith = Game.GetFormFromFile(0x0000B412, "Smithing Perks Overhaul_Remade.esp") As Perk 
	Perk SPOExpertSmith = Game.GetFormFromFile(0x0000B413, "Smithing Perks Overhaul_Remade.esp") As Perk 
	Perk SPOMasterSmith = Game.GetFormFromFile(0x00010516, "Smithing Perks Overhaul_Remade.esp") As Perk 
	
	if (SPONoviceSmith && SPOApprenticeSmith && SPOAdeptSmith && SPOExpertSmith)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, SPONoviceSmith, 10)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, SPOApprenticeSmith, 25)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, SPOAdeptSmith, 50)
		_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, SPOExpertSmith, 75)
		if (SPOMasterSmith) ;This one exists only in modules 2 and 3.
			_hmael.addMapElement_formInt(_actor.SMITHING_PERKS, SPOMasterSmith, 100)
		endif		
	Endif	
EndFunction

Function pauseFrostFallExposure (Bool Pause = True)	
	If (checkModPresence("Frostfall.esp") )		
		If (Pause)			
			FrostUtil.AddExposureException(_actor.vendor.GetBaseObject() )			
		Else
			FrostUtil.RemoveExposureException(_actor.vendor.GetBaseObject() )			
		EndIf
	EndIf
EndFunction

Function activateDualEnchantment (Bool use_dual_enchantment)	

	int extra_effect_skill_req = 100
	If (checkModPresence("Requiem.esp") )	
		Spell law_of_first = Game.GetFormFromFile(0x5568f5c3,"Requiem.esp") As Spell		
		if (use_dual_enchantment)
			_actor.player.addSpell(law_of_first, False)
		else
			_actor.player.removeSpell(law_of_first)
		endif		
	Elseif (checkModPresence("PerkusMaximus_Master.esp") )			
		Spell xMAENCSplitEnchantAbility =  Game.GetFormFromFile(0x00419CB3,"PerkusMaximus_Master.esp") As Spell		
		if (use_dual_enchantment)
			_actor.player.AddSpell(xMAENCSplitEnchantAbility, False)
		else			
			_actor.player.RemoveSpell(xMAENCSplitEnchantAbility)
		endif
	ElseIf (checkModPresence("ACE Enchanting.esp") )
		if (use_dual_enchantment)
			_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.ExtraEffect, extra_effect_skill_req)
			_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter60, 60)  ;These are replaced with tiered dual enchantment perks by ACE.
			_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter80, 80)
		else
			_hmael.deleteMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.ExtraEffect)
			_hmael.deleteMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter60)
			_hmael.deleteMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.Enchanter80)
		endif
	Else		
		if (checkModPresence("Ordinator - Perks of Skyrim.esp") || checkModPresence("PerkusMaximus_Master.esp") || checkModPresence("ACE Enchanting.esp")  )
			extra_effect_skill_req = 80
		endif		
		If (use_dual_enchantment)
			_hmael.addMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.ExtraEffect, extra_effect_skill_req)
		Else			
			_hmael.deleteMapElement_formInt(_actor.ENCHANTING_PERKS, _actor.ExtraEffect)
		EndIf	
	EndIf
	
EndFunction

bool game_overhaul_installed = True
Function updateCoreDefaults ()	
	if (game_overhaul_installed)
		_actor.allow_dual_enchantment = false
	else 
		_actor.allow_dual_enchantment = true;
	endif
EndFunction

String default_sEnchantmentsLearned
String default_sEnchantmentKnown
String default_sLackRequiredPerksToImprove
String default_sLackRequiredPerkToImproveMagical
String default_sLackRequiredSkillToImprove
String default_sLackRequiredToCreate
String default_sLackRequiredToImprove
String default_sOverEncumbered
String default_sAddItemtoInventory 

Function changeGameStrings (Bool change_values = True)
	If (change_values)
		default_sEnchantmentsLearned = Game.GetGameSettingString("sEnchantmentsLearned")
		default_sEnchantmentKnown = Game.GetGameSettingString("sEnchantmentKnown")
		default_sLackRequiredPerksToImprove = Game.GetGameSettingString("sLackRequiredPerksToImprove")
		default_sLackRequiredPerkToImproveMagical  = Game.GetGameSettingString("sLackRequiredPerkToImproveMagical")
		default_sLackRequiredSkillToImprove = Game.GetGameSettingString("sLackRequiredSkillToImprove")
		default_sLackRequiredToCreate = Game.GetGameSettingString("sLackRequiredToCreate")
		default_sLackRequiredToImprove = Game.GetGameSettingString("sLackRequiredToImprove")		
		default_sAddItemtoInventory = Game.GetGameSettingString("sAddItemtoInventory")		
		
		Game.SetGameSettingString("sEnchantmentsLearned", messages.ENCHANTMENT_LEARNED)
		Game.SetGameSettingString("sEnchantmentKnown", messages.ENCHANTMENT_KNOWN)
		Game.SetGameSettingString("sLackRequiredPerksToImprove", messages.INSUFICIENT_SKILL)
		Game.SetGameSettingString("sLackRequiredPerkToImproveMagical", messages.INSUFICIENT_SKILL)
		Game.SetGameSettingString("sLackRequiredSkillToImprove",messages.INSUFICIENT_SKILL)
		Game.SetGameSettingString("sLackRequiredToCreate", messages.INSUFICIENT_MATERIALS) 
		Game.SetGameSettingString("sLackRequiredToImprove", messages.INSUFICIENT_MATERIALS)
		Game.SetGameSettingString("sOverEncumbered", "")
		Game.SetGameSettingString("sAddItemtoInventory",messages.ORDERED)
	Else
		Game.SetGameSettingString("sEnchantmentsLearned", default_sEnchantmentsLearned)
		Game.SetGameSettingString("sEnchantmentKnown", default_sEnchantmentKnown)
		Game.SetGameSettingString("sLackRequiredPerksToImprove", default_sLackRequiredPerksToImprove)
		Game.SetGameSettingString("sLackRequiredPerkToImproveMagical", default_sLackRequiredPerkToImproveMagical)
		Game.SetGameSettingString("sLackRequiredSkillToImprove", default_sLackRequiredSkillToImprove)
		Game.SetGameSettingString("sLackRequiredToCreate", default_sLackRequiredToCreate)
		Game.SetGameSettingString("sLackRequiredToImprove", default_sLackRequiredToImprove)
		Game.SetGameSettingString("sOverEncumbered", default_sOverEncumbered)
		Game.SetGameSettingString("sAddItemtoInventory", default_sAddItemtoInventory )
	EndIf	
EndFunction

Int Property script_version Hidden
Int Function get ()
	return 6
EndFunction
EndProperty
