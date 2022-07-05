;/ Decompiled by Champollion V1.0.1
Source   : FFAOBBoethiahTombScript.psc
Modified : 2018-02-27 17:01:52
Compiled : 2018-02-27 17:01:53
User     : borja
Computer : DESKTOP-BORJA
/;
scriptName FFAOBBoethiahTombScript extends ObjectReference

;-- Properties --------------------------------------
keyword property GoldbrandKeyword auto
String property Message1 auto
keyword property EltonbrandKeyword auto
String property Message2 auto
quest property FFAOBMainQuest auto
ObjectReference property FearstruckActi auto

;-- Variables ---------------------------------------
Bool isOpened = false

;-- Functions ---------------------------------------

function onLoad()

	if !isOpened
		self.playAnimation("SnapClosed")
	endIf
endFunction

; Skipped compiler generated GetState

function OnActivate(ObjectReference akActionRef)

	if akActionRef == game.Getplayer() as ObjectReference
		self.GotoState("Inactive")
		if akActionRef.GetItemCount(EltonbrandKeyword as form) as Bool || akActionRef.GetItemCount(GoldbrandKeyword as form) as Bool
			isOpened = true
			self.playAnimation("OpenStart")
			FearstruckActi.Enable(false)
			FFAOBMainQuest.SetStage(100)
		else
			if FFAOBMainQuest.GetStage() >= 20
				debug.Messagebox(Message1)
			else
				debug.Messagebox(Message2)
			endIf
			self.GotoState("")
		endIf
	endIf
endFunction

function onReset()

	self.onLoad()
endFunction

; Skipped compiler generated GotoState

;-- State -------------------------------------------
state Inactive

	function OnActivate(ObjectReference akActionRef)

		; Empty function
	endFunction
endState
