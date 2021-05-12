ScriptName HM_Actor Extends Quest Conditional

HM_Mod Property _mod Auto
;Smithing
Perk Property steelSmithing Auto
Perk Property ArcaneBlacksmith Auto
Perk Property DwarvenSmithing Auto
Perk Property OrcishSmithing Auto
Perk Property EbonySmithing Auto
Perk Property DaedricSmithing Auto
Perk Property ElvenSmithing Auto
Perk Property AdvancedArmors Auto
Perk Property GlassSmithing Auto
Perk Property DragonArmor Auto

;Enchanting
Perk Property Enchanter00 Auto
Perk Property Enchanter20 Auto
Perk Property Enchanter40 Auto
Perk Property Enchanter60 Auto
Perk Property Enchanter80 Auto
Perk Property FireEnchanter Auto
Perk Property FrostEnchanter Auto
Perk Property StormEnchanter Auto
Perk Property InsightfulEnchanter Auto
Perk Property CorpusEnchanter Auto
Perk Property ExtraEffect Auto
Perk Property SoulSqueezer Auto
Perk Property SoulSiphon Auto

FormList Property emptyList Auto
FormList Property enchantingPerksList Auto
FormList Property smithingPerksList Auto
FormList Property smithingPerksListToAddNPC Auto

Perk Property enchantingNPCPower Auto

;Mcm
Bool Property enchanting Auto Conditional
Bool Property tempering Auto Conditional
Bool Property crafting Auto Conditional
Bool Property vendors_have_basic_mats Auto
Bool Property vendors_have_rare_mats Auto
Bool Property vendors_know_basic_enchantments Auto
Bool Property lore_based_smithing Auto
Bool Property skill_affects_quality Auto
Bool Property npc_skill_rebalance Auto
Float Property minimum_skill_level Auto
Float Property maximum_skill_level Auto
Float Property craft_price_multiplier Auto
Float Property enchant_price_multiplier Auto
Float Property recharge_price_multiplier Auto
Float Property temper_price_multiplier Auto
Float Property materials_price_multiplier Auto
Float Property time_crafting_takes Auto
Float Property time_enchanting_takes Auto
Float Property time_recharging_takes Auto
Bool Property allow_dual_enchantment Auto
Bool Property allow_courier_notification Auto

;Miscellaneous
Perk Property StopSkillGain Auto
Float Property player_skill Auto Hidden
Int Property crafting_service Auto Hidden
Form[] Property player_perks Auto Hidden
Form[] Property player_enchantments Auto Hidden
Actor Property player Auto
Actor Property vendor Auto Hidden
Actor Property sale_merchant Auto
Actor Property mannequin Auto
Race Property orc_race Auto
Faction Property smithing_faction Auto
Faction Property enchanting_faction Auto
ReferenceAlias Property npc_stay_idle_alias Auto
FormList Property enchantments Auto
FormList Property orders_list Auto
String Property crafting_discipline Auto Hidden
Actor[] Property sent_letters Auto Hidden
Int Property last_letter_read Auto Hidden
Bool Property player_third_person Auto Hidden

Int Property NPC_SERVICE_COMPLETION_TIME Auto Hidden ;;Enumerator. Defined in HM_mod::createStructureElements() 
Int Property TIME_STARTED_WORKING Auto Hidden ;Enumerator. Defined in HM_mod::createStructureElements()
Int Property VENDOR_SKILL Auto Hidden ;Enumerator. Defined in HM_mod::createStructureElements()
Int Property TRANSACTION_TYPE Auto Hidden ;Enumerator. Defined in HM_mod::createStructureElements()

Int Property RECHARGE_SERVICE  = 1 AutoReadOnly ;Enumerator
Int Property CRAFT_SERVICE = 2 AutoReadOnly ;Enumerator
Int Property ENCHANT_SERVICE = 3 AutoReadOnly ;Enumerator
Int Property TEMPER_ARMOR_SERVICE = 4 AutoReadOnly ;Enumerator
Int Property TEMPER_WEAPON_SERVICE = 5 AutoReadOnly ;Enumerator
Int Property RACK_SERVICE = 6 AutoReadOnly ;Enumerator
Int Property SMITHING_PERKS = 7 AutoReadOnly ;Enumerator
Int Property ENCHANTING_PERKS = 8 AutoReadOnly ;Enumerator

Perk[] Property perks Auto Hidden
Form[] craftmen
Int[] craftmen_skill

string sEnchanting = "enchanting"
string sSmithing = "smithing"
bool bAddPerks = true
bool bRemovePerks = false

Function addPerks (Bool Add = True)	
EndFunction

; sActorValue - Ќужно отдвать им€ с глобального пространства (sEnchanting или sSmithing)
; currentMod - два режима, true - выдает перки, false - забирает перки
Function getterSetterPerks(string sActorValue, bool currentMod)
    if sActorValue == sSmithing
        if currentMod

            int index = smithingPerksListToAddNPC.GetSize()
            While index
                index = index - 1
                Perk currentPerk = smithingPerksListToAddNPC.GetAt(index) as Perk
                if currentPerk
                    if !Game.GetPlayer().HasPerk(currentPerk)
                        Game.GetPlayer().AddPerk(currentPerk)
                    endif
                endif
            EndWhile

        else

            int index = smithingPerksListToAddNPC.GetSize()
            While index
                index = index - 1
                Perk currentPerk = smithingPerksListToAddNPC.GetAt(index) as Perk
                if currentPerk
                    if Game.GetPlayer().HasPerk(currentPerk)
                        Game.GetPlayer().RemovePerk(currentPerk)
                    endif
                endif
            EndWhile

        endif
    endif
    if sActorValue == sEnchanting
        if currentMod
            if !Game.GetPlayer().HasPerk(enchantingNPCPower)
                Game.GetPlayer().AddPerk(enchantingNPCPower)
            endif
        else
            if Game.GetPlayer().HasPerk(enchantingNPCPower)
                Game.GetPlayer().RemovePerk(enchantingNPCPower)
            endif
        endif
    endif
EndFunction

Function trueFillList(FormList list)
    int indLs = list.GetSize()
    while indLs
        indLs = indLs - 1
        Perk currentPerk = list.GetAt(indLs) as Perk
        if currentPerk
            if Game.GetPlayer().HasPerk(currentPerk)
                emptyList.AddForm(currentPerk as Form)
                Game.GetPlayer().RemovePerk(currentPerk)
            endif
        endif
    endwhile
EndFunction

; sActorValue - Ќужно отдвать им€ с глобального пространства (sEnchanting или sSmithing)
Function fillEmptyListAndRemovePerks(string sActorValue)

    if sActorValue == sEnchanting
        trueFillList(enchantingPerksList)
    endif
    if sActorValue == sSmithing
        trueFillList(smithingPerksList)
    endif

EndFunction

;ќчищает лист в котором хран€тс€ перки игрока, перед этим добавл€ет игроку перки заново
Function revertEmptyListAndAddPerks()
    int indLs = emptyList.GetSize()
    while indLs
        indLs = indLs - 1
        Perk currentPerk = emptyList.GetAt(indLs) as Perk
        if currentPerk
            if !Game.GetPlayer().HasPerk(currentPerk)
                Game.GetPlayer().AddPerk(currentPerk)
            endif
        endif
    endwhile
    emptyList.Revert()
EndFunction

float HH_Skill_level_smith
float HH_Skill_level_ench

Function HH_addPerks ()	

	If (crafting_service != ENCHANT_SERVICE)

	    crafting_discipline = sSmithing
	    HH_Skill_level_smith = Game.GetPlayer().GetActorValue(crafting_discipline)
        ;заполн€ем пустой лист перками игрока, и удал€ем перки что у него есть
        fillEmptyListAndRemovePerks(crafting_discipline)
	    ;“еперь добавл€ем всЄ что нужно
	    Game.GetPlayer().SetActorValue(crafting_discipline, 65)
        getterSetterPerks(crafting_discipline, bAddPerks)

	Else

		crafting_discipline = sEnchanting
		HH_Skill_level_ench = player.GetActorValue(crafting_discipline)
        ;заполн€ем пустой лист перками игрока, и удал€ем перки что у него есть
        fillEmptyListAndRemovePerks(crafting_discipline)
	    ;“еперь добавл€ем всЄ что нужно
	    Game.GetPlayer().SetActorValue(crafting_discipline, 65)
        getterSetterPerks(crafting_discipline, bAddPerks)

	EndIf

EndFunction

Function HH_removePerks ()	

    If (crafting_service != ENCHANT_SERVICE)

	    crafting_discipline = sSmithing
        getterSetterPerks(crafting_discipline, bRemovePerks)
	    Game.GetPlayer().SetActorValue(crafting_discipline, HH_Skill_level_smith)
        revertEmptyListAndAddPerks()

	Else

	    crafting_discipline = sEnchanting
        getterSetterPerks(crafting_discipline, bRemovePerks)
	    Game.GetPlayer().SetActorValue(crafting_discipline, HH_Skill_level_ench)
        revertEmptyListAndAddPerks()

	EndIf

EndFunction

Function addPerks1 (Bool Add = True)	
	Debug.MessageBox("addPerks")
	HM_array_extension_library _hmael = _mod._hmael;
	Perk[] perks_to_add = New Perk[32]
	int map_identifier
	if (crafting_service == ENCHANT_SERVICE)
		map_identifier = ENCHANTING_PERKS
	else
		map_identifier = SMITHING_PERKS
	endif	
	Form[] perk_ids = _hmael.getMapKeys_formInt(map_identifier)
	int[] perk_skill_req = _hmael.getMapValues_formInt(map_identifier)	

	perks_to_add[0] = StopSkillGain
	if (lore_based_smithing  && crafting_service != ENCHANT_SERVICE && vendor.GetRace() == orc_race)
		perks_to_add[ 1] = OrcishSmithing
	endif
	
	int skill_level = player.GetActorValue(crafting_discipline) as Int
	int counter = perk_ids.find(none)
	int perks_index  = perks_to_add.find(none)
	while (counter)
		counter -= 1
		if (perk_skill_req[counter] <= skill_level)			
			perks_to_add[perks_index] = perk_ids[counter] as Perk
			perks_index += 1
		endif
	endwhile	
	
	int perk_count = perks_to_add.Find(None)
	If (Add)		
		While (counter < perk_count)				
			If (player.HasPerk(perks_to_add[counter]) )
				player_perks[counter] = perks_to_add[counter]
			Else
				player.AddPerk(perks_to_add[counter] )				
			EndIf
			counter += 1
		EndWhile		
	Else		
		While (counter <= perk_count)
			If (player_perks.Find(perks_to_add[counter]) < 0)
				player.RemovePerk(perks_to_add[counter] )
			EndIf
			counter += 1
		EndWhile
			Debug.MessageBox("RemovePerk")
	EndIf		
	
EndFunction

Function initializePerks ()	
	HM_array_extension_library _hmael = _mod._hmael
	_hmael.createStandanloneMap(SMITHING_PERKS)
	_hmael.createStandanloneMap(ENCHANTING_PERKS)
	_hmael.addMapElement_formInt(SMITHING_PERKS, steelSmithing, 5)
	_hmael.addMapElement_formInt(SMITHING_PERKS, DwarvenSmithing, 30)	
	_hmael.addMapElement_formInt(SMITHING_PERKS, ElvenSmithing, 30)	
	_hmael.addMapElement_formInt(SMITHING_PERKS, AdvancedArmors, 50)
	_hmael.addMapElement_formInt(SMITHING_PERKS, OrcishSmithing, 50)
	_hmael.addMapElement_formInt(SMITHING_PERKS, ArcaneBlacksmith, 60)
	_hmael.addMapElement_formInt(SMITHING_PERKS, GlassSmithing, 70)
	_hmael.addMapElement_formInt(SMITHING_PERKS, EbonySmithing, 80)
	_hmael.addMapElement_formInt(SMITHING_PERKS, DaedricSmithing, 90)
	_hmael.addMapElement_formInt(SMITHING_PERKS, DragonArmor, 100)	
	_hmael.addMapElement_formInt(ENCHANTING_PERKS, Enchanter00, 5)
	_hmael.addMapElement_formInt(ENCHANTING_PERKS, Enchanter20, 20)
	_hmael.addMapElement_formInt(ENCHANTING_PERKS, Enchanter40, 40)
	_hmael.addMapElement_formInt(ENCHANTING_PERKS, Enchanter60, 60)
	_hmael.addMapElement_formInt(ENCHANTING_PERKS, Enchanter80, 80)	
	_hmael.addMapElement_formInt(ENCHANTING_PERKS, FireEnchanter, 30)	
	_hmael.addMapElement_formInt(ENCHANTING_PERKS, FrostEnchanter, 40)	
	_hmael.addMapElement_formInt(ENCHANTING_PERKS, InsightfulEnchanter, 50)	
	_hmael.addMapElement_formInt(ENCHANTING_PERKS, StormEnchanter, 50)	
	_hmael.addMapElement_formInt(ENCHANTING_PERKS, CorpusEnchanter, 70)	
	;_hmael.addMapElement_formInt(ENCHANTING_PERKS, ExtraEffect, 100)	 ; This is handled through the MCM option now.
	_hmael.addMapElement_formInt(ENCHANTING_PERKS, SoulSqueezer, 20)	;These two perks do not serve any purpose for an NPC enchanter, yet some mods may rework their functionality in a way that changes this
	_hmael.addMapElement_formInt(ENCHANTING_PERKS, SoulSiphon, 40)		
EndFunction


Function resetPerks ()
	
	Form[] smith_perks = _mod._hmael.getMapKeys_formInt(SMITHING_PERKS)
	Form[] enchant_perks = _mod._hmael.getMapKeys_formInt(ENCHANTING_PERKS)
	
	Int perk_points
	Int perk_number = smith_perks.Find(None)
	Perk current_perk
	
	While (perk_number)
		perk_number -= 1
		current_perk = smith_perks[perk_number] As Perk
		If (player.HasPerk(current_perk) )
			player.RemovePerk(current_perk)
			perk_points += 1
		EndIf		
	EndWhile
	
	perk_number = enchant_perks.Find(None)	
	While (perk_number)
		perk_number -= 1
		current_perk = enchant_perks[perk_number] As Perk
		If (player.HasPerk(current_perk) )
			player.RemovePerk(current_perk)
			perk_points += 1
		EndIf		
	Endwhile
	
	Game.AddPerkPoints(perk_points)
	player.SetActorValue ("smithing", 10)
	player.SetActorValue ("enchanting", 10)
	
EndFunction

Function modifySkillLevel (Bool modify_skill = True)
EndFunction

Function modifySkillLevel1 (Bool modify_skill = True)
	If (!modify_skill)
		player.SetActorValue(crafting_discipline, player_skill)
		Return		
	EndIf	
	If (crafting_service != ENCHANT_SERVICE)
		crafting_discipline = "smithing"
	Else
		crafting_discipline = "enchanting"
	EndIf
	Float skill_level = vendor.GetActorValue(crafting_discipline)
	If (npc_skill_rebalance)
		Float adjusted_skill = getPredeterminedSkillLevel(vendor.GetBaseObject() )
		if (!adjusted_skill)
			adjusted_skill = Math.Ceiling(((skill_level / vendor.GetLevel() ) * (maximum_skill_level / 10) ) )
			If (adjusted_skill >= skill_level && adjusted_skill > minimum_skill_level)
				skill_level = adjusted_skill
			Else
				adjusted_skill = (vendor.GetLevel() * 3)
				If (skill_level < adjusted_skill)
					skill_level = adjusted_skill
				EndIf
			EndIf
		Else
			skill_level = adjusted_skill
		EndIF		
	EndIf
	If (skill_level < minimum_skill_level)
		skill_level = minimum_skill_level
	ElseIf (skill_level > maximum_skill_level)
		skill_level = maximum_skill_level
	EndIf
	
	player_skill = player.GetBaseActorValue(crafting_discipline)
	player.SetActorValue(crafting_discipline, skill_level)
EndFunction


Function InitializePredeterminedSkills (Bool include_dragonborn, Bool include_dawnguard)
	craftmen = New Form[30]
	craftmen_skill = New Int[30]
	
	;Smiths
	craftmen[0] = Game.GetFormFromFile(0x0001361E, "Skyrim.esm"); Rustleif
	craftmen[1] = Game.GetFormFromFile(0x00013B7C, "Skyrim.esm") ; Gharol
	craftmen[2] = Game.GetFormFromFile(0x00013650, "Skyrim.esm"); Lod
	craftmen[3] = Game.GetFormFromFile(0x0001B079, "Skyrim.esm"); Dushnamub
	craftmen[4] = Game.GetFormFromFile(0x0001339A, "Skyrim.esm"); Ghorza gra-Bagol
	craftmen[5] = Game.GetFormFromFile(0x00055A5E, "Skyrim.esm"); Moth gro-Bagol
	craftmen[6] = Game.GetFormFromFile(0x00019957, "Skyrim.esm") ;Shuftharz
	craftmen[7] = Game.GetFormFromFile(0x00029DAD, "Skyrim.esm") ;Arnskar Ember-Master
	craftmen[8] = Game.GetFormFromFile(0x00019DF2, "Skyrim.esm") ;Asbjorn Fire-Tamer
	craftmen[9] = Game.GetFormFromFile(0x0001334C, "Skyrim.esm") ;Balimund 
	craftmen[10] = Game.GetFormFromFile(0x00013475, "Skyrim.esm") ;Alvor
	craftmen[11] = Game.GetFormFromFile(0x00013261, "Skyrim.esm") ;Beirand
	craftmen[12] = Game.GetFormFromFile(0x00013B9D, "Skyrim.esm") ;Eorlund Gray-Mane
	craftmen[13] = Game.GetFormFromFile(0x00013BB9, "Skyrim.esm") ;Adrianne Avenicci
	craftmen[14] = Game.GetFormFromFile(0x00014142, "Skyrim.esm") ;Oengul War-Anvil
	craftmen[15] = Game.GetFormFromFile(0x000136C3, "Skyrim.esm") ;Filnjar
	craftmen[16] = Game.GetFormFromFile(0x00013B9F, "Skyrim.esm") ;Ulfberth War Bear
	craftmen_skill[0] = 29
	craftmen_skill[1] = 50
	craftmen_skill[2] = 50
	craftmen_skill[3] = 80
	craftmen_skill[4] = 80
	craftmen_skill[5] = 90
	craftmen_skill[6] = 50
	craftmen_skill[7] = 70
	craftmen_skill[8] = 30
	craftmen_skill[9] = 80
	craftmen_skill[10] = 29
	craftmen_skill[11] = 80
	craftmen_skill[12] = 100
	craftmen_skill[13] = 50
	craftmen_skill[14] = 60
	craftmen_skill[15] = 29
	craftmen_skill[16] = 50 ; Same as Adrianne, since she's the one doing the crafting. Ulfberth states that himself.
	
	;Enchanters
	craftmen[17] = Game.GetFormFromFile(0x00014146, "Skyrim.esm") ;Wuunferth the Unliving 
	craftmen[18] = Game.GetFormFromFile(0x000132AA, "Skyrim.esm") ;Sybille Stentor
	craftmen[19] = Game.GetFormFromFile(0x0001365F, "Skyrim.esm") ;Dravynea the Stoneweaver 
	craftmen[20] = Game.GetFormFromFile(0x0001338E, "Skyrim.esm") ;Cacelmo
	craftmen[21] = Game.GetFormFromFile(0x00019DEF, "Skyrim.esm") ;Wylandriah
	craftmen[22] = Game.GetFormFromFile(0x00013BBB, "Skyrim.esm") ;Farengar Secret-Fire
	craftmen[23] = Game.GetFormFromFile(0x0001E765, "Skyrim.esm") ;Hammal
	craftmen[24] = Game.GetFormFromFile(0x0001C23E, "Skyrim.esm") ;Sergius Turrianus
	craftmen_skill[17] = 70
	craftmen_skill[18] = 60
	craftmen_skill[19] = 45
	craftmen_skill[20] = 80
	craftmen_skill[21] = 65
	craftmen_skill[22] = 55
	craftmen_skill[23] = 90
	craftmen_skill[24] = 100

	If (include_dawnguard)
		craftmen[25] =  Game.GetFormFromFile(0x0000336C, "Dawnguard.esm") ;Gunmar 0x0000336C
		craftmen[26] =  Game.GetFormFromFile(0x00003365, "Dawnguard.esm") ;Hestla
		craftmen_skill[25] = 70		
		craftmen_skill[26] = 45
	endif
	if (include_dragonborn)
		craftmen[27] =  Game.GetFormFromFile(0x0001828E, "Dragonborn.esm") ;Glover Mallory
		craftmen[28] =  Game.GetFormFromFile(0x00018FB5, "Dragonborn.esm") ;Baldor Iron-Shaper		
		craftmen_skill[27] = 80	
		craftmen_skill[28] = 90		
	Endif	
EndFunction

Function overridePredeterminedSkill (actor npc, int new_skill_value)
	int craftman_index = craftmen.find(npc.GetBaseObject() );
	if (npc && craftman_index > -1)
		craftmen_skill[craftman_index] = new_skill_value;		
	endif	
EndFunction


Actor Function getClosestActor ()
	Float posX = player.GetPositionX()
	Float posY = player.GetPositionY()
	Float posZ = player.GetPositionZ()
	Float rotation = player.GetAngleZ()
	Float distance = 128.0
	Float offsetX = (Math.sin(rotation) * distance) + posX
	Float offsetY = (Math.cos(rotation) * distance) + posY
	
	Return Game.FindClosestActor(offsetX, offsetY, posZ, 256)	
EndFunction


Function addNPCToFaction (Bool smithing)
	HM_Mod mod = ((Self As Quest) As HM_mod)
	Actor npc = getClosestActor()
	If (smithing)
		npc.AddToFaction(smithing_faction)
	Else
		npc.AddToFaction(enchanting_faction)
	EndIf
	Debug.MessageBox(npc.GetBaseObject().GetName() + mod.messages.ADDED_FACTION)
EndFunction


Function learnEnchantments (Bool learn = True)	
	Form[] enchantments_list = enchantments.ToArray()
	Int enchantment_number = enchantments_list.Length
	
	While (enchantment_number)
		enchantment_number -= 1		
		If (learn && enchantments_list[enchantment_number].PlayerKnows() )
			player_enchantments[enchantment_number] = enchantments_list[enchantment_number]
		elseif (!player_enchantments[enchantment_number])
			enchantments_list[enchantment_number].SetPlayerKnows(learn)
		EndIf	
	EndWhile	
EndFunction


Function immobilizeNPC (Actor vendor, Bool restrain = True)
	If (restrain)
		npc_stay_idle_alias.ForceRefTo(vendor)
		vendor.EvaluatePackage()
	Else
		npc_stay_idle_alias.Clear()
	EndIf
EndFunction


Function increasePlayerEncumbrance (Bool increase = True)
	Float encumbrance = 90000.0
	If (increase)		
		player.ModAV("carryWeight", encumbrance)
	Else
		player.ModAV("carryWeight", (encumbrance * -1) )
	EndIf
EndFunction


Function calculateNpcServiceTime ()	
	HM_inventory _inventory = _mod._inventory	
	Form[] materials_used = _inventory.materials_used
	Int[] materials_used_count = _inventory.materials_used_count
	Float rare_materials_time_cost = _inventory.rare_materials_acquisition_time 
	Float common_materials_time_cost = _inventory.common_materials_acquisition_time
	Form[] materials_rare = _inventory.rare_materials.ToArray()	
	Int rare_materials_index = materials_rare.Length
	Int rare_materials_index_reset = rare_materials_index
	Int materials_index = _inventory.materials_used.Find(None)
	Float time
	Int npc_mat_count
	Bool is_rare_material
	
	While (materials_index > 0)
		materials_index -= 1	
		Int npc_materials_index = _inventory.npc_materials.Find(materials_used[materials_index])
		If (npc_materials_index > -1)
			npc_mat_count = _inventory.npc_materials_count[npc_materials_index]
		Else
			npc_mat_count = 0
		EndIf		
		If (materials_used_count[materials_index] > npc_mat_count)
			While (rare_materials_index > 0)
				rare_materials_index -= 1
				If (materials_rare[rare_materials_index] == materials_used[materials_index])
					time += ((materials_used_count[materials_index] - npc_mat_count) * rare_materials_time_cost)
					is_rare_material = True							
				EndIf
			EndWhile
			If (!is_rare_material)
				time += ((materials_used_count[materials_index] - npc_mat_count) * common_materials_time_cost)				
			EndIf
			is_rare_material = False
			rare_materials_index = rare_materials_index_reset				
		EndIf
	EndWhile		
	
	If (crafting_service == ENCHANT_SERVICE)
		time += time_enchanting_takes
	ElseIf (crafting_service == RECHARGE_SERVICE)
		time += time_recharging_takes
	Else
		time += time_crafting_takes
	EndIf	
	Form[] null
	_mod._hmael.aStructureAddMember(vendor, NPC_SERVICE_COMPLETION_TIME, null, 0, time)
EndFunction


Function sendCourierNotification ()
	Float completion_time = _mod._hmael.aStructureGetMember_float(vendor, NPC_SERVICE_COMPLETION_TIME)
	If (completion_time)
		_mod._courier.addPostRequest(vendor, (completion_time * 24.0) ) ;converting from days to hours.
	EndIf
EndFunction


Function removeSendersName (Actor vendor)
	Int vendor_index = sent_letters.Find(vendor)
	If (vendor_index > -1)
		sent_letters[vendor_index] = None
		player.RemoveItem(Game.GetFormFromFile(0x0001d211, "HonedMetal.esp"), abSilent = True)
		hm_array_extension_library.sortActorArray(sent_letters)
		If (sent_letters.Find(None) > 0)
			HM_courier _courier = (Quest.GetQuest("HM_Courier_Quest") As HM_courier)
			_courier.sender_alias.ForceRefTo(sent_letters[0]) ;in case the current alias points to the npc removed.
			last_letter_read = 1
		EndIf	
	EndIf	
EndFunction

;Private

Int Function getPredeterminedSkillLevel (Form base_actor)
	Int index = craftmen.Find(base_actor)
	If (index > -1)
		return craftmen_skill[index]
	EndIf
	;Debug.messageBox("Actor " + base_actor + " " + base_actor.GetName() + " not found in the array " + craftmen[11])
	return 0;
EndFunction

Int Property script_version Hidden
Int Function get ()
	return 6
EndFunction
EndProperty