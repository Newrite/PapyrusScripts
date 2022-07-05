;/ Decompiled by Champollion V1.0.1
Source   : DesmondPickpocketWidgetScript.psc
Modified : 2021-12-12 20:12:01
Compiled : 2021-12-12 20:12:52
User     : nirn2
Computer : WORKSTATION
/;
scriptName DesmondPickpocketWidgetScript extends SKI_WidgetBase
{This script adds functionality to the Attribute Icon Widget}

;-- Properties --------------------------------------
keyword property BottleFire auto
keyword property BottleFrost auto
globalvariable property EnchaterCounterPoison auto
keyword property EffectEnchantFire auto
globalvariable property EnchaterCounterShock auto
globalvariable property EnchaterCounterFrost auto
globalvariable property EnchaterCounterFire auto
keyword property SmokeBomb auto
keyword property EffectEnchantPoison auto
keyword property PowderFire auto
keyword property EffectEnchantFrost auto
keyword property EffectEnchantLightning auto
objectreference property PlayerRef auto
keyword property PowderLightning auto
keyword property PowderFrost auto

;-- Variables ---------------------------------------
Int itemCounter = 0
Bool frostBottleIconVisible = false
Bool enchantCounterVisible = false
Float defualtPosY = 575.000
Float defualtScale = 100.000
Bool daggerIconVisible = false
Bool poisonVisible = false
Bool itemCounterVisible = true
Bool smokeBombIconVisible = false
Float scale = 100.000
Int poisonCounter = 0
Int enchantCounter = 0
Bool visible = true
Float PosY = 575.000
Bool lightningIconVisible = false
Float PosX = 110.000
Bool fireBottleIconVisible = false
Bool fireIconVisible = false
Float defualtPosX = 110.000
Bool render = false
form formForCount
Bool frostIconVisible = false
Bool pawIconVisible = false

;-- Functions ---------------------------------------

function updateStatus()

	if self.Ready
		if !render || !visible
			ui.SetBool(self.HUD_MENU, self.WidgetRoot + "._visible", false)
			return 
		endIf
		actor Player = game.GetPlayer()
		self.HandleEffectIcon(Player)
		itemCounter = Player.GetItemCount(formForCount)
		self.render()
	endIf
endFunction

Float function GetDefaultScale()

	return defualtScale
endFunction

function SetDefaultScale()

	scale = defualtScale
endFunction

function SetDefaultPositionY()

	PosY = defualtPosY
endFunction

String function GetWidgetSource()

	return "skyui/despickpocket.swf"
endFunction

function HandleEffectIcon(actor Player)

	if daggerIconVisible
		if Player.HasEffectKeyword(EffectEnchantPoison)
			poisonVisible = true
			poisonCounter = EnchaterCounterPoison.GetValue() as Int
		else
			poisonVisible = false
		endIf
		if Player.HasEffectKeyword(EffectEnchantFire)
			fireIconVisible = true
			frostIconVisible = false
			lightningIconVisible = false
			enchantCounterVisible = true
			enchantCounter = EnchaterCounterFire.GetValue() as Int
			return 
		endIf
		if Player.HasEffectKeyword(EffectEnchantFrost)
			fireIconVisible = false
			frostIconVisible = true
			lightningIconVisible = false
			enchantCounterVisible = true
			enchantCounter = EnchaterCounterFrost.GetValue() as Int
			return 
		endIf
		if Player.HasEffectKeyword(EffectEnchantLightning)
			fireIconVisible = false
			frostIconVisible = false
			lightningIconVisible = true
			enchantCounterVisible = true
			enchantCounter = EnchaterCounterShock.GetValue() as Int
			return 
		endIf
		fireIconVisible = false
		frostIconVisible = false
		lightningIconVisible = false
		enchantCounterVisible = false
		return 
	endIf
	if pawIconVisible
		if Player.WornHasKeyword(PowderFire)
			fireIconVisible = true
			frostIconVisible = false
			lightningIconVisible = false
			poisonVisible = false
			return 
		endIf
		if Player.WornHasKeyword(PowderFrost)
			fireIconVisible = false
			frostIconVisible = true
			lightningIconVisible = false
			poisonVisible = false
			return 
		endIf
		if Player.WornHasKeyword(PowderLightning)
			fireIconVisible = false
			frostIconVisible = false
			lightningIconVisible = true
			poisonVisible = false
			return 
		endIf
	endIf
	fireIconVisible = false
	frostIconVisible = false
	lightningIconVisible = false
	enchantCounterVisible = false
	poisonVisible = false
endFunction

String function GetWidgetType()

	return "DesmondPickpocketWidgetScript"
endFunction

Float function GetPositionX()

	return PosX
endFunction

function SetDefaultPositionX()

	PosX = defualtPosX
endFunction

function SetPowders()

	fireBottleIconVisible = false
	frostBottleIconVisible = false
	smokeBombIconVisible = false
	daggerIconVisible = false
	pawIconVisible = true
	enchantCounterVisible = false
endFunction

function SetDaggers()

	fireBottleIconVisible = false
	frostBottleIconVisible = false
	smokeBombIconVisible = false
	daggerIconVisible = true
	pawIconVisible = false
endFunction

function SetBottles()

	actor Player = game.GetPlayer()
	fireBottleIconVisible = Player.WornHasKeyword(BottleFire)
	frostBottleIconVisible = Player.WornHasKeyword(BottleFrost)
	smokeBombIconVisible = Player.WornHasKeyword(SmokeBomb)
	daggerIconVisible = false
	pawIconVisible = false
endFunction

function ChangeVisible()

	visible = !visible
endFunction

function SetPositionX(Float newXPos)

	PosX = newXPos
endFunction

function SetFormCount(form newForm)

	formForCount = newForm
endFunction

function SetUIState(Bool newState)

	render = newState
endFunction

Float function GetDefaultPositionY()

	return defualtPosY
endFunction

function SetPositionY(Float newYPos)

	PosY = newYPos
endFunction

; Skipped compiler generated GotoState

Float function GetScale()

	return scale
endFunction

Float function GetPositionY()

	return PosY
endFunction

; Skipped compiler generated GetState

function SetScale(Float newScale)

	scale = newScale
endFunction

Float function GetDefaultPositionX()

	return defualtPosX
endFunction

function render()

	ui.SetBool(self.HUD_MENU, self.WidgetRoot + "._visible", visible)
	ui.SetFloat(self.HUD_MENU, self.WidgetRoot + "._x", PosX)
	ui.SetFloat(self.HUD_MENU, self.WidgetRoot + "._y", PosY)
	ui.SetFloat(self.HUD_MENU, self.WidgetRoot + "._xscale", scale)
	ui.SetFloat(self.HUD_MENU, self.WidgetRoot + "._yscale", scale)
	ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setFireIconVisible", fireIconVisible)
	ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setFrostIconVisible", frostIconVisible)
	ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setLightningIconVisible", lightningIconVisible)
	ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setPoisonIconVisible", poisonVisible)
	ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setFireBottleIconVisible", fireBottleIconVisible)
	ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setFrostBottleIconVisible", frostBottleIconVisible)
	ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setSmokeBombIconVisible", smokeBombIconVisible)
	ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setItemCounterVisible", itemCounterVisible)
	ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setEnchantCounterVisible", enchantCounterVisible)
	ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setPoisonCounterVisible", poisonVisible)
	ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setDaggerIconVisible", daggerIconVisible)
	ui.InvokeBool(self.HUD_MENU, self.WidgetRoot + ".setPowderIconVisible", pawIconVisible)
	ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setItemCounterText", itemCounter)
	ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setEnchantCounterText", enchantCounter)
	ui.InvokeInt(self.HUD_MENU, self.WidgetRoot + ".setPoisonCounterText", poisonCounter)
endFunction
