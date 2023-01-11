ScriptName HM_main Extends Quest

HM_Stations Property _station Auto
HM_Inventory Property _inventory Auto
HM_Actor Property _actor Auto
HM_player_monitor Property _player Auto
HM_vendor_container Property _vendor_container Auto
HM_mod Property _mod Auto
HM_array_extension_library Property _hmael Auto
Bool scan_completed


Event OnInit ()
	If (_mod.initialize() )
		goToState ("Thread0")
		Debug.Notification(_mod.messages.INITIALIZED)
	EndIf
EndEvent


State Thread0;
	
	Event OnUpdate ()		
		If (_actor.player.IsInCombat() )
			Debug.MessageBox(_mod.messages.COMBAT_STATE)
			Return
		ElseIf (_actor.crafting_service == _actor.CRAFT_SERVICE)
			setUpCraftService()
		ElseIf (_actor.crafting_service == _actor.RECHARGE_SERVICE)
			setUpRechargeService()
		ElseIf (_actor.crafting_service == _actor.RACK_SERVICE)	
			_actor.crafting_service =  _actor.CRAFT_SERVICE ;for all internal purposes, we are crafting. Only difference is we call a different setUp function.
			setUpRackService()
		Else
			setUpEnchantNtemper()
		EndIf	
		Debug.MessageBox ((_actor.vendor.GetBaseObject().GetName() ) + _mod.messages.READY_FOR_ORDER)
		
	EndEvent
	
	Event OnMenuClose (String MenuName)		
		If (MenuName == "ContainerMenu")
			Self.UnregisterForMenu("ContainerMenu")
			_vendor_container.goToState("")			
			If (_inventory.equipment_to_modify.Find(None) )				
				If (_actor.crafting_service == _actor.RECHARGE_SERVICE)					
					_inventory.restoreWeaponCharge(_inventory.equipment_to_modify)
					setUpTransaction()
					cleanUp()
				Else
					activateStations()
				EndIf				
			Else
				cleanUp(True)
			EndIf
			
		ElseIf (MenuName == "Crafting Menu")
			Self.UnregisterForMenu("Crafting Menu")
			_player.goToState ("")			
			If (_actor.crafting_service != _actor.CRAFT_SERVICE)				
				_inventory.findModifiedEquipment()				
			EndIf			
			If (_inventory.equipment_new.Find(None) )
				setUpTransaction()
				cleanUp()
			Else
				cleanUp(True)
			EndIf			
		EndIf		
	EndEvent	
	
EndState


State Thread1
	Event OnUpdate()
		goToState("Thread0")
		scan_completed = False
		_inventory.scanEquipment(_actor.player, _inventory.equipment); Initial scan of the player's inventory so we can get a list of all equipment to remove
		scan_completed = True		
	EndEvent
EndState


Event OnUpdate ()
	Debug.MessageBox(_mod.messages.MOD_PAUSED)
EndEvent

;-------------------------------------------------------------------------------------------------------------------------------------------------------------



Function setUpTransaction ()			
	Form[] NULL ;passing "none" to an array of forms generates a Papyrus warning. 
	If (_actor.crafting_service != _actor.RECHARGE_SERVICE)
		_inventory.getMaterialsUsed()
		_inventory.removeMaterialsFromNPC()
		_hmael.aStructureAddMember(_actor.vendor, _inventory.MATERIALS_COST, NULL, new_int_member = _inventory.getMaterialsAverageCost(_inventory.equipment_new.Find(None) ) )
	EndIf	
	
	_hmael.aStructureAddMember(_actor.vendor, _actor.TRANSACTION_TYPE, NULL, _actor.crafting_service)
	_hmael.aStructureAddMember(_actor.vendor, _actor.VENDOR_SKILL, NULL, _actor.player.GetActorValue(_actor.crafting_discipline) As Int)	
	_hmael.aStructureAddMember(_actor.vendor, _inventory.STORED_EQUIPMENT, _inventory.equipment_new)	
	_hmael.aStructureAddMember(_actor.vendor, _actor.TIME_STARTED_WORKING, NULL, 0, Utility.GetCurrentGameTime() )	
	_actor.calculateNpcServiceTime()
	if (_actor.allow_courier_notification)
		_actor.sendCourierNotification()		
	endif
	_inventory.drop_box.RemoveAllItems(_inventory.item_storage)
	;actor.vendor.AddItem(_inventory.has_equipment_in_storage)		
	_actor.orders_list.AddForm(_actor.vendor.GetBaseObject() );
EndFunction

Function cleanUp (Bool purge = False)		
	If (_actor.crafting_service == _actor.CRAFT_SERVICE)
		cleanUpCraftService()
	ElseIf (_actor.crafting_service != _actor.RECHARGE_SERVICE)
		cleanUpEnchantNtemper()
	EndIf	
	If (purge)
		_hmael.deleteActorStructure(_actor.vendor)
	EndIf
	_mod.resetForms()
EndFunction

Function setUpServices (String menu)
	_hmael.createActorStructure(_actor.vendor)
	_inventory.scanNPCMaterials()
	preparePlayerState()
	_mod.changeGameStrings()
	Self.RegisterForMenu(menu)	
EndFunction

Function cleanUpServices()
	restorePlayerState()
	_mod.changeGameStrings(False)
EndFunction

Function setUpCraftService ()
	setUpServices("Crafting Menu")
	_inventory.addMaterials()
	If (_actor.vendor.GetBaseObject() == Game.GetFormFromFile(0x00013b9d, "Skyrim.esm") ) ;Graymane
		activation_status = _station.skyForge.Activate(_actor.player)
	Else
		activation_status = _station.forge.Activate(_actor.player)
	EndIf
	_player.goToState("CraftItems")
EndFunction

Function setUpRackService ()
	setUpServices("Crafting Menu")
	_inventory.addMaterials()
	activation_status = _station.rack.Activate(_actor.player)	
	_player.goToState("CraftItems")
EndFunction

Function cleanUpCraftService ()
	cleanUpServices()
	_inventory.addMaterials(False)
EndFunction

Function setUpRechargeService ()
	Self.RegisterForMenu ("ContainerMenu")
	_vendor_container.goToState("ReceiveItems")
	activation_status = _inventory.drop_box.Activate(_actor.player)
	_hmael.createActorStructure(_actor.vendor)
EndFunction

Function setUpEnchantNtemper ()
	Self.gotoState ("Thread1")	
	Self.RegisterForSingleUpdate(0)	
	setUpServices("ContainerMenu")
	_vendor_container.goToState("ReceiveItems")	
	While (Self.getState() != "Thread0")
		Utility.Wait(0.01)
	EndWhile
	activation_status = _inventory.drop_box.Activate(_actor.player)
	_mod.pauseFrostfallExposure()
	If (_actor.crafting_service == _actor.ENCHANT_SERVICE && _actor.vendors_know_basic_enchantments)
		_actor.learnEnchantments()
	EndIf	
EndFunction

Function cleanUpEnchantNtemper ()
	If (_inventory.equipment_to_modify.Find(None) )
		_inventory.movePlayerEquipment(False)
		_inventory.addWinterEquipment(False)		
		_inventory.addMaterials(False)
	EndIf
	cleanUpServices()
	_mod.pauseFrostfallExposure(False)
	If (_actor.crafting_service == _actor.ENCHANT_SERVICE && _actor.vendors_know_basic_enchantments)
		_actor.learnEnchantments(False)
	EndIf	
EndFunction

Function activateStations ()
	If (!scan_completed)
		Debug.MessageBox(_mod.messages.SCANNING)
		While (!scan_completed)
			Utility.Wait(0.5)
		EndWhile	
	EndIf
	_inventory.movePlayerEquipment()	;We need to remove all armor and weapons so the player can only temper/enchant the gear that we give them.
;	_inventory.addWinterEquipment()		;To avoid naked commentaries (and freeze to death pre Frostfall 3.0) --> MOVED TO movePlayerEquipment
	_inventory.getEquipmentInitialStats()	
	_inventory.addMaterials()
	Self.RegisterForMenu ("Crafting Menu")
	If (_actor.crafting_service == _actor.TEMPER_ARMOR_SERVICE)
		activation_status = _station.workBench.Activate(_actor.player)
	ElseIf (_actor.crafting_service == _actor.TEMPER_WEAPON_SERVICE)
		activation_status = _station.grindStone.Activate(_actor.player)
	ElseIf (_actor.crafting_service == _actor.ENCHANT_SERVICE)
		activation_status = _station.enchanter.Activate(_actor.player)
	EndIf	
EndFunction

Function preparePlayerState ()
	If (Game.GetCameraState() )
		_actor.player_third_person = True;		
	EndIf
	Game.ForceFirstPerson()
	Game.DisablePlayerControls(True, True, True, False, True, True, True, True)
	_actor.immobilizeNPC(_actor.vendor)
	;_actor.modifySkillLevel()	
	_actor.HH_addPerks()
EndFunction

Function restorePlayerState ()
	_actor.HH_removePerks()
	;_actor.modifySkillLevel(False)
	_actor.immobilizeNPC(_actor.vendor, False)
	If (_actor.player_third_person)
		Game.ForceThirdPerson()
		_actor.player_third_person = False
	EndIf
	Game.EnablePlayerControls()	
EndFunction

Bool property activation_status
	Function set (bool value)
		if (!value)
			cleanUp(True);
			Debug.MessageBox(_mod.messages.ACTIVATION_ERROR)
		endif
	EndFunction
EndProperty

Int Property script_version Hidden
Int Function get ()
	return 6
EndFunction
EndProperty