;/ Decompiled by Champollion V1.0.1
Source   : UIStatsMenu.psc
Modified : 2014-07-23 10:23:50
Compiled : 2015-03-23 00:30:18
User     : Brendan
Computer : BRENDAN-PC
/;
scriptName UIStatsMenu extends UIMenuBase

;-- Properties --------------------------------------
String property ROOT_MENU
	String function get()

		return "CustomMenu"
	endFunction
endproperty
String property MENU_ROOT
	String function get()

		return "_root.ActorStatsPanelFader.actorStatsPanel."
	endFunction
endproperty

;-- Variables ---------------------------------------
Form _form

;-- Functions ---------------------------------------

function UpdateStatsForm()

	ui.InvokeForm(self.ROOT_MENU, self.MENU_ROOT + "setActorStatsPanelForm", _form)
endFunction

String function GetMenuName()

	return "UIStatsMenu"
endFunction

function OnLoadMenu(String eventName, String strArg, Float numArg, Form formArg)

	self.UpdateStatsForm()
endFunction

; Skipped compiler generated GotoState

Int function OpenMenu(Form inForm, Form akReceiver)

	_form = inForm
	if !self.BlockUntilClosed() || !self.WaitForReset()
		return 0
	endIf
	self.RegisterForModEvent("UIStatsMenu_LoadMenu", "OnLoadMenu")
	self.RegisterForModEvent("UIStatsMenu_CloseMenu", "OnUnloadMenu")
	ui.OpenCustomMenu("statssheetmenu", 0)
	return 1
endFunction

function OnUnloadMenu(String eventName, String strArg, Float numArg, Form formArg)

	self.UnregisterForModEvent("UIStatsMenu_LoadMenu")
	self.UnregisterForModEvent("UIStatsMenu_CloseMenu")
endFunction

; Skipped compiler generated GetState
