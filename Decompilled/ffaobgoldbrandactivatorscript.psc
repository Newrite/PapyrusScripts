;/ Decompiled by Champollion V1.0.1
Source   : FFAOBGoldbrandActivatorScript.psc
Modified : 2018-02-27 17:53:13
Compiled : 2018-02-27 17:53:14
User     : borja
Computer : DESKTOP-BORJA
/;
scriptName FFAOBGoldbrandActivatorScript extends ObjectReference

;-- Properties --------------------------------------
weapon property FFAOBGoldbrand1H auto
globalvariable property FFAOBGoldbrandTaken auto
weapon property FFAOBGoldbrand2H auto
message property FFAOBGoldbrandActivatorMessage auto

;-- Variables ---------------------------------------
Int Choice

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnActivate(ObjectReference akActionRef)

	self.GotoState("Inactive")
	if akActionRef == game.Getplayer() as ObjectReference
		Choice = FFAOBGoldbrandActivatorMessage.show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		if Choice == 0
			akActionRef.AddItem(FFAOBGoldbrand1H as form, 1, false)
		elseIf Choice == 1
			akActionRef.AddItem(FFAOBGoldbrand2H as form, 1, false)
		endIf
		FFAOBGoldbrandTaken.SetValue(1.00000)
		self.Disable(false)
	endIf
	self.GotoState("")
endFunction

; Skipped compiler generated GotoState

;-- State -------------------------------------------
state Inactive

	function OnActivate(ObjectReference akActionRef)

		; Empty function
	endFunction
endState
