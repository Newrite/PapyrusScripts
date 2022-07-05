ScriptName zzzSXPPAlias Extends ReferenceAlias

Import Game

zzzSXPGainExpStatPolling Property XPoll Auto
zzzSXPController Property XPC Auto
zzzSXPWorkerKillActor Property XPWorker Auto
zzzSXPConfig Property XPConfig Auto

Actor Property PlayerREF Auto
Spell Property SXP_Cloak Auto

MiscObject Property Gold001 Auto
MiscObject Property Lockpick Auto

;Furniture
ObjectReference _LastUsedFurniture_

;Spell
int _SPELL_COUNT_RECORD_ = 0

;Barter
int _GOLD_AMOUNT_ = 0
int _BUY_RECORD_ = 0
int _SELL_RECORD_ = 0

;Lockpicking
ObjectReference[] _LockedREF_
int iLockedREF_Count
int _LockedLevel_ = 0
int _BreakLockPickCount_ = 0

;Steal
int _STEAL_RECORD_ = 0

;Craft
bool _CRAFT_PROCESSING

;Misc
bool DragonbornInstalled
bool SpellLearningRequirementsInstalled
string[] MenuEventStrings
string[] StateStrings

;ActionToGain
Package Property zzzSXPHelperPlayerPray Auto
Package Property zzzSXPHelperDoNothing Auto

Function GameInit()
	StringSetup()
	GameReloaded()
EndFunction

Function GameReloaded()
	GetPlayer().RemoveSpell(SXP_Cloak)
	GetPlayer().AddSpell(SXP_Cloak, False)
	StartEventListener()
	DragonbornInstalled = GetDragonbornDLC()
	SpellLearningRequirementsInstalled = GetSLR()
EndFunction

Event OnPlayerLoadGame()
	GameReloaded()
	(GetOwningQuest() as zzzSXPHelper).GameReloaded()
	XPConfig.GameReloaded()
	XPC.GameReloaded()
	XPWorker.GameReloaded()
EndEvent

Event OnMenuOpen( string sMenuName )
	int iIndex = MenuEventStrings.Find(sMenuName)
	GoToState(StateStrings[iIndex])
EndEvent

Event OnMenuClose( string sMenuName )
	SetEmptyState()
EndEvent

Event OnSit( ObjectReference akFurniture )
	SetLastUsedFurniture(akFurniture)
EndEvent

Event OnGetUp( ObjectReference akFurniture )
	if ( akFurniture.HasKeywordString( "FurnitureWoodChoppingBlock" ) )
		XPC.GainXPMessage(47, XPoll.SXPGameStats[47])
	elseif ( akFurniture.HasKeywordString( "FurnitureResourceObjectSawmill" ) )
		XPC.GainXPMessage(48, XPoll.SXPGameStats[48])
	elseif ( akFurniture.HasKeywordString( "IsGrainMill" ) )
		XPC.GainXPMessage(49, XPoll.SXPGameStats[49])
	endif
	
	_LastUsedFurniture_ = None
	SetEmptyState()
EndEvent

Event OnPackageEnd(Package akOldPackage)
	if akOldPackage == zzzSXPHelperPlayerPray
		SendModEvent("SXPMiddlePray")
	elseif akOldPackage == zzzSXPHelperDoNothing
		SendModEvent("SXPStopPray")
	endif
EndEvent

Auto State Empty
EndState
;=============================================================;
;InventoryMenu
;=============================================================;
State InventoryMenu
Event OnBeginState()
	if SpellLearningRequirementsInstalled
		return
	endif
	_SPELL_COUNT_RECORD_ = QueryStat("Spells Learned")
EndEvent

Event OnItemRemoved( Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer )
	Book pBook = akBaseItem as Book
	if ( pBook == None )
		return
	endif
	Spell pSpell = pBook.GetSpell()
	if ( pSpell == None )
		return
	endif
	if SpellLearningRequirementsInstalled
		return
	endif
	HandleSpellLearned(pSpell)
EndEvent
EndState
;=============================================================;
;BarterMenu
;=============================================================;
State BarterMenu
Event OnBeginState()
	_GOLD_AMOUNT_ = PlayerREF.GetItemCount(Gold001) as Int
	_BUY_RECORD_ = 0
	_SELL_RECORD_ = 0
EndEvent

Event OnItemAdded( Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer )
	if ( akBaseItem == None )
		return
	endif
	if ( aiItemCount <= 0 )
		return
	endif
	
	if ( akBaseItem == Gold001 as Form )
		return
	endif
	int i_last = _GOLD_AMOUNT_
	int i_current = PlayerREF.GetItemCount(Gold001) as Int
	int i_sub = i_last - i_current
	if ( i_sub > 0 )
		IncreaseBuyRecord( i_sub )
		_GOLD_AMOUNT_ = i_current
	endif
EndEvent

Event OnItemRemoved( Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer )
	if ( akBaseItem == Gold001 as Form )
		return
	endif

	int i_last = _GOLD_AMOUNT_
	int i_current = PlayerREF.GetItemCount(Gold001) as Int
	int i_sub = i_current - i_last
		
	if ( i_sub > 0 )
		IncreaseSellRecord( i_sub )
		_GOLD_AMOUNT_ = i_current
	endif
EndEvent

Event OnEndState()
	if _BUY_RECORD_ > 0
		XPC.GainXPMessage(53, _BUY_RECORD_)
	endif
	
	if _SELL_RECORD_ > 0
		XPC.GainXPMessage(54, _SELL_RECORD_)
	endif
EndEvent
EndState
;=============================================================;
;LockpickingMenu
;=============================================================;
State LockpickingMenu
Event OnBeginState()
	_LockedLevel_ = 0
	_BreakLockPickCount_ = 0
	FindNearestLockedReference()
EndEvent

Event OnItemRemoved( Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer )
	if ( akBaseItem != Lockpick as Form )
		return
	endif		
	_BreakLockPickCount_ += 1
EndEvent

Event OnEndState()
	HandleLockPicking()
EndEvent
EndState
;=============================================================;
;ContainerMenu
;=============================================================;
State ContainerMenu
Event OnBeginState()
	_STEAL_RECORD_ = 0
EndEvent

Event OnItemAdded( Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer )
	if ( akBaseItem == None )
		return
	endif
	if ( aiItemCount <= 0 )
		return
	endif

	int i_value = akBaseItem.GetGoldValue()
	int i_total = i_value * aiItemCount
		
	if (akBaseItem == Gold001 as Form)
		i_total = (i_total * 0.25) as Int
			
		if (i_total <= 0)
			i_total = 1
		endif

		if (i_total > 1000)
			i_total = 1000
		endif
	endif
	
	if (i_total > 0)
		AddStealRecord(i_total)
	endif
EndEvent
EndState
;=============================================================;
;CraftingMenu
;=============================================================;
State CraftingMenu
Event OnItemAdded( Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer )
	HandleCraftItem(akBaseItem, aiItemCount)
EndEvent

Event OnItemRemoved( Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer )
	HandleCraftConsume(akBaseItem, aiItemCount)
EndEvent
  
Event OnEndState()
	_CRAFT_PROCESSING = False
EndEvent
EndState
;=============================================================;
;Mining
;=============================================================;
State Mining
Event OnItemAdded( Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer )
	if ( akBaseItem == None )
		return
	endif
	if ( aiItemCount <= 0 )
		return
	endif
	
	int i_value = (XPoll.SXPGameStats[46] / 100) * akBaseItem.GetGoldValue()
	XPC.GainXPMessage(46, i_value)
EndEvent
EndState

;;--------------------------------------------------------------------------------;;
;; Furniture Functions
;;--------------------------------------------------------------------------------;;
Function SetLastUsedFurniture(ObjectReference pObj)
	_LastUsedFurniture_ = pObj
	
	if ( _LastUsedFurniture_.HasKeywordString( "isPickaxeFloor" ) || _LastUsedFurniture_.HasKeywordString( "isPickaxeTable" ) || _LastUsedFurniture_.HasKeywordString( "isPickaxeWall" ) )
		StartActionMining()
	elseif DragonbornInstalled
		if ( _LastUsedFurniture_.HasKeywordString( "DLC2IsPickaxeFloor" ) || _LastUsedFurniture_.HasKeywordString( "DLC2IsPickaxeTable" ) || _LastUsedFurniture_.HasKeywordString( "DLC2IsPickaxeWall" ) )
			StartActionMining()
		endif
	endif
EndFunction

;;--------------------------------------------------------------------------------;;
;; Spell Learned Functions
;;--------------------------------------------------------------------------------;;
Function HandleSpellLearned(Spell pSpell)
	if ( pSpell == None )
		return
	endif
	
	int i_spell = QueryStat( "Spells Learned" )
	if ( i_spell <= _SPELL_COUNT_RECORD_ )
		return
	endif
	
	int i_cost = pSpell.GetMagickaCost()
	int i_xp = XPoll.SXPGameStats[43] + i_cost * 2
	
	if XPoll.SXPGameStats[43] > 0
		XPC.GainXPMessage(43, i_xp)
	endif
EndFunction

Function SLRHandleSpellLearned(Spell pSpell)
	int i_cost = pSpell.GetMagickaCost()
	int i_xp = XPoll.SXPGameStats[43] + i_cost * 2
	
	if XPoll.SXPGameStats[43] > 0
		XPC.GainXPMessage(43, i_xp)
	endif
EndFunction

;;--------------------------------------------------------------------------------;;
;; Barter Functions
;;--------------------------------------------------------------------------------;;
Function IncreaseBuyRecord( int n )
	int i_gain = ( XPoll.SXPGameStats[53] * Math.Sqrt( n ) ) as Int
	_BUY_RECORD_ += i_gain
EndFunction

Function IncreaseSellRecord( int n )
	int i_gain = ( XPoll.SXPGameStats[54] * Math.Sqrt( n * 0.5 ) ) as Int
	_SELL_RECORD_ += i_gain
EndFunction

;;--------------------------------------------------------------------------------;;
;; Lockpicking Functions
;;--------------------------------------------------------------------------------;;
Function FindNearestLockedReference()
	Cell pCell = PlayerREF.GetParentCell()
	_LockedREF_ = new ObjectReference[20]
	int iLength = _LockedREF_.Length
	iLockedREF_Count = 0
	
	int Door_index = pCell.GetNumRefs(29) ; kDoor = 29 ;
	While Door_index && (iLength > iLockedREF_Count)
		Door_index -= 1
		ObjectReference akReference = pCell.GetNthRef(Door_index, 29)
		if (akReference.IsLocked()) && (akReference.GetLockLevel() < 255)
			_LockedREF_[iLockedREF_Count] = akReference
			iLockedREF_Count += 1
		endif
	EndWhile
	
	int Container_index = pCell.GetNumRefs(28) ; kContainer = 28 ;
	While Container_index && (iLength > iLockedREF_Count)
		Container_index -= 1
		ObjectReference akReference = pCell.GetNthRef(Container_index, 28)
		if (akReference.IsLocked()) && (akReference.GetLockLevel() < 255)
			_LockedREF_[iLockedREF_Count] = akReference
			iLockedREF_Count += 1
		endif
	EndWhile
EndFunction

Function HandleLockPicking()
	bool PlayerREFLockPick = False
	While iLockedREF_Count && !PlayerREFLockPick
		iLockedREF_Count -= 1
		ObjectReference akReference = _LockedREF_[iLockedREF_Count]
		if !(akReference.IsLocked())
			_LockedLevel_ = akReference.GetLockLevel()
			PlayerREFLockPick = True
		endif
	EndWhile
	
	if !PlayerREFLockPick
		return
	endif
	
	int i_xp = (XPoll.SXPGameStats[52] * (_LockedLevel_ /10)) + (XPoll.SXPGameStats[52] * (_LockedLevel_/25))
			
	if ( _LockedLevel_ <= 1 )
		i_xp = XPoll.SXPGameStats[52]
	endif

	if ( _BreakLockPickCount_ == 0 )
		if XPoll.SXPGameStats[57] >= 100
			i_xp = i_xp * (XPoll.SXPGameStats[57] / 100)
		endif
	endif
	
	XPC.GainXPMessage(52, i_xp)
EndFunction

Function RSSLHandleLockPicking(int i_LockLevel, string NotificationMessage)
	_LockedLevel_ = i_LockLevel
	int i_xp = (XPoll.SXPGameStats[52] * (_LockedLevel_ /10)) + (XPoll.SXPGameStats[52] * (_LockedLevel_/25))
			
	if ( _LockedLevel_ <= 1 )
		i_xp = XPoll.SXPGameStats[52]
	endif

	if XPoll.SXPGameStats[57] >= 100
		i_xp = i_xp * (XPoll.SXPGameStats[57] / 100)
	endif
	
	XPC.GainXPMessage(52, i_xp, NotificationMessage, True)
EndFunction

;;--------------------------------------------------------------------------------;;
;; Steal Functions
;;--------------------------------------------------------------------------------;;
Function AddStealRecord( int n )
	int i_value = (XPoll.SXPGameStats[50] * Math.Sqrt( n )) as Int
	_STEAL_RECORD_ += i_value
EndFunction

int Function GetStealRecordPickpocket()
	return _STEAL_RECORD_
EndFunction

bool Function HasOwnerOrIsOwner( ObjectReference pObj )
	if ( pObj == None )
		return False
	endif

	MannequinActivatorScript pMannequin = pObj as MannequinActivatorScript
	if ( pMannequin != None )
		return False
	endif
	
	Actor pActor = pObj as Actor
	if ( pActor != None )
		if ( pActor.IsDead() == False )
			if ( pActor != PlayerREF )
				if ( pActor.GetCrimeFaction() != None )
					if ( pActor.IsPlayerTeammate() == False )
						return True
					endif
				endif
			endif
		endif
	endif
	
	ActorBase pBase = pObj.GetActorOwner()
	if ( pBase != None )
		if ( pBase != PlayerREF.GetActorBase() )
			return True
		endif
	endif
	
	Faction pFaction = pObj.GetFactionOwner()
	if ( pFaction != None )
		if ( PlayerREF.IsInFaction( pFaction ) == False )
			return True
		endif
	endif
	
	Cell pCell = PlayerREF.GetParentCell()
	if ( pCell != None )
		pBase = pCell.GetActorOwner()
		if ( pBase != None )
			if ( pBase != PlayerREF.GetActorBase() )
				return True
			endif
		endif

		pFaction = pCell.GetFactionOwner()
		if ( pFaction != None )
			if ( PlayerREF.IsInFaction( pFaction ) == False )
				return True
			endif
		endif
	endif
	
	return False
EndFunction

int Function GetStealRecord(ObjectReference akOwner, ObjectReference akContainer)
	bool bOwnRef = HasOwnerOrIsOwner(akOwner)
	bool bOwnCnt = HasOwnerOrIsOwner(akContainer)
		
	if ( ( bOwnRef == False ) && ( bOwnCnt == False ) )
		return 0
	endif
	
	return _STEAL_RECORD_
EndFunction

Function ClearStealRecord()
	_STEAL_RECORD_ = 0
EndFunction

;;--------------------------------------------------------------------------------;;
;; Craft Functions
;;--------------------------------------------------------------------------------;;
Function HandleCraftItem(Form pForm, int num)
	if ( pForm == None )
		return
	endif
	if ( num <= 0 )
		return
	endif
	
	if !_CRAFT_PROCESSING
	int TimeOut = 0
		While !_CRAFT_PROCESSING && TimeOut < 5
			Utility.WaitMenuMode(0.1)
			TimeOut += 1
		EndWhile
		if TimeOut >= 5
			return
		endif
	endif
	
	int i_base = pForm.GetGoldValue()
	int i_total = i_base * num
	if ( i_total <= 0 )
		return
	endif
	
	if (pForm.HasKeywordString("ArmorJewelry"))
		i_total = (i_total * (XPoll.SXPGameStats[55] / 100)) as Int
	endif
	
	i_total = (XPoll.SXPGameStats[44] * Math.Sqrt(i_total)) as Int
	
	if (_LastUsedFurniture_.HasKeywordString("CraftingSmithingSkyforge"))
		i_total = (i_total * (XPoll.SXPGameStats[56] / 100)) as Int
	endif
	
	_CRAFT_PROCESSING = False
	XPC.GainXPMessage(44, i_total)
EndFunction

Function HandleCraftConsume( Form pForm, int num )	
	if ( pForm == None )
		return
	endif
	if ( num <= 0 )
		return
	endif
	if ( _LastUsedFurniture_ == None )
		return
	endif
	if ( _LastUsedFurniture_.HasKeywordString( "CraftingCookpot" ) )
		_CRAFT_PROCESSING = True
		return
	endif
	if ( _LastUsedFurniture_.HasKeywordString( "CraftingSmelter" ) )
		_CRAFT_PROCESSING = True
		return
	endif
	if ( _LastUsedFurniture_.HasKeywordString( "CraftingSmithingForge" ) )
		_CRAFT_PROCESSING = True
		return
	endif
	if ( _LastUsedFurniture_.HasKeywordString( "CraftingTanningRack" ) )
		_CRAFT_PROCESSING = True
		return
	endif
	if ( _LastUsedFurniture_.HasKeywordString( "IsAlchemy" ) )
		_CRAFT_PROCESSING = True
		return
	endif

	int i_base = pForm.GetGoldValue()
	int i_total = i_base * num
	if ( i_total <= 0 )
		return
	endif
	
	i_total = ( XPoll.SXPGameStats[45] * Math.Sqrt( i_total ) ) as Int	
	
	XPC.GainXPMessage(45, i_total)
EndFunction

;;--------------------------------------------------------------------------------;;
;; Utility Functions
;;--------------------------------------------------------------------------------;;
Function StartEventListener()
	RegisterForMenu( "InventoryMenu" )
	RegisterForMenu( "BarterMenu" )
	RegisterForMenu( "Lockpicking Menu" )
	RegisterForMenu( "ContainerMenu" )
	RegisterForMenu( "Crafting Menu" )
EndFunction

bool Function GetDragonbornDLC()
	if GetModByName("Dragonborn.esm") != 255
		return True
	else
		return False
	endif
EndFunction

bool Function GetSLR()
	if GetModByName("SpellLearningRequirements.esp") != 255
		return True
	else
		return False
	endif
EndFunction

Function StringSetup()
	MenuEventStrings = new string[5]
	StateStrings = new string[5]
	
	MenuEventStrings[0] = "InventoryMenu"
	MenuEventStrings[1] = "BarterMenu"
	MenuEventStrings[2] = "Lockpicking Menu"
	MenuEventStrings[3] = "ContainerMenu"
	MenuEventStrings[4] = "Crafting Menu"
	
	StateStrings[0] = "InventoryMenu"
	StateStrings[1] = "BarterMenu"
	StateStrings[2] = "LockpickingMenu"
	StateStrings[3] = "ContainerMenu"
	StateStrings[4] = "CraftingMenu"
EndFunction

Function SetEmptyState()
	GoToState("Empty")
EndFunction

Function StartActionMining()
	GoToState("Mining")
EndFunction