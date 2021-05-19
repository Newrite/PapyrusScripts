;/ Decompiled by Champollion V1.0.1
Source   : UIMenuBase.psc
Modified : 2013-12-05 09:59:08
Compiled : 2015-03-23 00:30:18
User     : Brendan
Computer : BRENDAN-PC
/;
scriptName UIMenuBase extends Quest

;-- Properties --------------------------------------
Bool property isResetting = false auto

;-- Variables ---------------------------------------
Bool _waitLock = false

;-- Functions ---------------------------------------

function ResetMenu()

	; Empty function
endFunction

function SetPropertyAlias(String propertyName, Alias value)

	; Empty function
endFunction

Bool function GetPropertyBool(String propertyName)

	return false
endFunction

Int function OpenMenu(Form akForm, Form akReceiver)

	return -1
endFunction

Bool function WaitLock()

	Int lockOut = 0
	while _waitLock
		lockOut += 1
		if lockOut > 50
			_waitLock = false
			return false
		endIf
		utility.Wait(0.100000)
	endWhile
	return true
endFunction

function SetPropertyForm(String propertyName, Form value)

	; Empty function
endFunction

String function GetResultString()

	return ""
endFunction

String function GetMenuName()

	return ""
endFunction

Form function GetResultForm()

	return none
endFunction

function SetPropertyIndexFloat(String propertyName, Int index, Float value)

	; Empty function
endFunction

function SetPropertyBool(String propertyName, Bool value)

	; Empty function
endFunction

Int function GetPropertyInt(String propertyName)

	return 0
endFunction

function SetPropertyIndexString(String propertyName, Int index, String value)

	; Empty function
endFunction

function SetPropertyString(String propertyName, String value)

	; Empty function
endFunction

function SetPropertyAliasA(String propertyName, Alias[] value)

	; Empty function
endFunction

function SetPropertyFormA(String propertyName, Form[] value)

	; Empty function
endFunction

function SetPropertyFloatA(String propertyName, Float[] value)

	; Empty function
endFunction

Alias function GetPropertyAlias(String propertyName)

	return none
endFunction

function SetPropertyBoolA(String propertyName, Bool[] value)

	; Empty function
endFunction

function Unlock()

	_waitLock = false
endFunction

function SetPropertyIntA(String propertyName, Int[] value)

	; Empty function
endFunction

function SetPropertyInt(String propertyName, Int value)

	; Empty function
endFunction

Bool function BlockUntilClosed()

	Int counter = 0
	while ui.IsMenuOpen("CustomMenu")
		counter += 1
		if counter > 50
			return false
		endIf
		utility.Wait(0.100000)
	endWhile
	return true
endFunction

Float function GetPropertyFloat(String propertyName)

	return 0.000000
endFunction

function SetPropertyIndexAlias(String propertyName, Int index, Alias value)

	; Empty function
endFunction

function OnGameReload()

	; Empty function
endFunction

String function GetPropertyString(String propertyName)

	return ""
endFunction

; Skipped compiler generated GotoState

Float function GetResultFloat()

	return 0.000000
endFunction

function Lock()

	_waitLock = true
endFunction

Bool function WaitForReset()

	Int counter = 0
	while isResetting
		counter += 1
		if counter > 50
			isResetting = false
			return false
		endIf
		utility.Wait(0.100000)
	endWhile
	return true
endFunction

function SetPropertyIndexInt(String propertyName, Int index, Int value)

	; Empty function
endFunction

Form function GetPropertyForm(String propertyName)

	return none
endFunction

; Skipped compiler generated GetState

function SetPropertyIndexBool(String propertyName, Int index, Bool value)

	; Empty function
endFunction

Int function GetResultInt()

	return 0
endFunction

function SetPropertyIndexForm(String propertyName, Int index, Form value)

	; Empty function
endFunction

function SetPropertyFloat(String propertyName, Float value)

	; Empty function
endFunction

function SetPropertyStringA(String propertyName, String[] value)

	; Empty function
endFunction
