;/ Decompiled by Champollion V1.0.1
Source   : FFAOBFearstruckActivator.psc
Modified : 2018-02-27 17:52:49
Compiled : 2018-02-27 17:52:50
User     : borja
Computer : DESKTOP-BORJA
/;
scriptName FFAOBFearstruckActivator extends ObjectReference

;-- Properties --------------------------------------
ObjectReference property StaticFearstruckRef auto
armor property FFAOBFearstruck auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnActivate(ObjectReference akActionRef)

	self.GotoState("Inactive")
	if akActionRef == game.Getplayer() as ObjectReference
		StaticFearstruckRef.Disable(false)
		akActionRef.AddItem(FFAOBFearstruck as form, 1, false)
		self.Disable(false)
	endIf
	self.GotoState("")
endFunction

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

;-- State -------------------------------------------
state Inactive

	function OnActivate(ObjectReference akActionRef)

		; Empty function
	endFunction
endState
