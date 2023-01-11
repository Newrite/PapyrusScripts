;/ Decompiled by Champollion V1.0.1
Source   : Clonejuration.psc
Modified : 2017-02-05 00:54:54
Compiled : 2017-02-05 00:55:09
User     : Utopium
Computer : DESKTOP-J4FLIQR
/;
scriptName Clonejuration extends SKI_ConfigBase

;-- Properties --------------------------------------
objectreference property oCloneMarker auto

;-- Variables ---------------------------------------
String[] sCloneCounts
String[] sNpcOptions
Int iCloneCountOID
Int iSearchOID
Int[] iClonedFormsOIDs
Int iCloneLevel = 4
Form[] fClonedForms
Int iCloneCount = 0
Int iCloneLevelOID
Int iCloneOID
ActorBase aCurrentNPC
Int[] iCloneCounts
Int iClearAllOID
String[] sCloneLevels

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnOptionInputAccept(Int option, String value)

	if option == iSearchOID
		Int formID = self.HexStringToInt(value)
		if formID == -1
			debug.MessageBox(value + " is not a valid form ID.")
		else
			ActorBase npc = game.GetForm(formID) as ActorBase
			if npc
				self.AddNPC(npc)
				self.ForcePageReset()
			else
				debug.MessageBox(value + " was not found.")
			endIf
		endIf
	endIf
endFunction

function AddNPC(ActorBase ref)

	if fClonedForms.length >= 100
		return 
	endIf
	self.RemoveNPC(ref)
	Form[] newFormList = utility.CreateFormArray(fClonedForms.length + 1, none)
	Int index = fClonedForms.length
	newFormList[index] = ref as form
	while index
		index -= 1
		newFormList[index] = fClonedForms[index]
	endWhile
	fClonedForms = newFormList
endFunction

function OnCrosshairRefChange(objectreference ref)

	actor currentActor = ref as actor
	if currentActor
		aCurrentNPC = currentActor.GetActorBase()
	else
		aCurrentNPC = none
	endIf
endFunction

; Skipped compiler generated GotoState

Int function HexCharToInt(String chr)

	if chr == "0"
		return 0
	elseIf chr == "1"
		return 1
	elseIf chr == "2"
		return 2
	elseIf chr == "3"
		return 3
	elseIf chr == "4"
		return 4
	elseIf chr == "5"
		return 5
	elseIf chr == "6"
		return 6
	elseIf chr == "7"
		return 7
	elseIf chr == "8"
		return 8
	elseIf chr == "9"
		return 9
	elseIf chr == "a" || chr == "a"
		return 10
	elseIf chr == "b" || chr == "b"
		return 11
	elseIf chr == "c" || chr == "c"
		return 12
	elseIf chr == "d" || chr == "d"
		return 13
	elseIf chr == "e" || chr == "e"
		return 14
	elseIf chr == "f" || chr == "f"
		return 15
	else
		return -1
	endIf
endFunction

function OnVersionUpdate(Int version)

	; Empty function
endFunction

function Clone(ActorBase npc)

	Int index = iCloneCounts[iCloneCount]
	while index
		index -= 1
		Float range = 300 as Float
		Float x = utility.RandomFloat(range / 2 as Float, range)
		Float y = utility.RandomFloat(range / 2 as Float, range)
		if utility.RandomInt(0, 1) == 1
			x *= -1.00000
		endIf
		if utility.RandomInt(0, 1) == 1
			y *= -1.00000
		endIf
		oCloneMarker.MoveTo(game.GetPlayer() as objectreference, x, y, 0.000000, true)
		oCloneMarker.PlaceActorAtMe(npc, iCloneLevel, none)
	endWhile
	debug.MessageBox(iCloneCounts[iCloneCount] as String + " clones of " + npc.GetName() + " have been conjured.")
endFunction

function OnOptionMenuAccept(Int option, Int index)

	if option == iCloneLevelOID
		iCloneLevel = index
		self.SetMenuOptionValue(option, sCloneLevels[iCloneLevel], false)
	elseIf option == iCloneCountOID
		iCloneCount = index
		self.SetMenuOptionValue(option, sCloneCounts[iCloneCount], false)
	else
		Int n = fClonedForms.length
		while n
			n -= 1
			if iClonedFormsOIDs[n] == option
				ActorBase npc = fClonedForms[n] as ActorBase
				if index == 0
					self.Clone(npc)
				elseIf index == 1
					self.RemoveNPC(npc)
					self.ForcePageReset()
				endIf
			endIf
		endWhile
	endIf
endFunction

function OnOptionMenuOpen(Int option)

	if option == iCloneLevelOID
		self.SetMenuDialogOptions(sCloneLevels)
		self.SetMenuDialogStartIndex(iCloneLevel)
		self.SetMenuDialogDefaultIndex(4)
	elseIf option == iCloneCountOID
		self.SetMenuDialogOptions(sCloneCounts)
		self.SetMenuDialogStartIndex(iCloneCount)
		self.SetMenuDialogDefaultIndex(0)
	else
		self.SetMenuDialogOptions(sNpcOptions)
		self.SetMenuDialogStartIndex(2)
		self.SetMenuDialogDefaultIndex(2)
	endIf
endFunction

Int function HexStringToInt(String str)

	Int strLength = stringutil.GetLength(str)
	if strLength > 8 || strLength == 0
		return -1
	endIf
	Int result = 0
	Int index = 0
	while index < strLength
		result = math.LeftShift(result, 4)
		Int nibble = self.HexCharToInt(stringutil.GetNthChar(str, index))
		if nibble == -1
			return -1
		endIf
		result += nibble
		index += 1
	endWhile
	return result
endFunction

function OnPageReset(String page)

	if page == ""
		if aCurrentNPC
			iCloneOID = self.AddTextOption("Add " + aCurrentNPC.GetName(), "ADD", 0)
		else
			iCloneOID = self.AddTextOption("No NPC in crosshairs", "", 0)
		endIf
		iCloneLevelOID = self.AddMenuOption("Clone Level", sCloneLevels[iCloneLevel], 0)
		iSearchOID = self.AddInputOption("Search By Form ID", "", 0)
		iCloneCountOID = self.AddMenuOption("Number Of Clones To Conjure", sCloneCounts[iCloneCount], 0)
		iClearAllOID = self.AddTextOption("Clear All", "CLEAR", 0)
		self.AddEmptyOption()
		self.AddEmptyOption()
		self.AddEmptyOption()
		iClonedFormsOIDs = utility.CreateIntArray(fClonedForms.length, 0)
		Int index = fClonedForms.length
		while index
			index -= 1
			iClonedFormsOIDs[index] = self.AddMenuOption(fClonedForms[index].GetName(), "", 0)
		endWhile
	endIf
endFunction

function RemoveNPC(ActorBase ref)

	Bool found = false
	Int index = fClonedForms.length
	while index
		index -= 1
		if fClonedForms[index] == ref as form
			found = true
		endIf
	endWhile
	if !found
		return 
	endIf
	Form[] newFormList = utility.CreateFormArray(fClonedForms.length - 1, none)
	found = false
	index = fClonedForms.length
	while index
		index -= 1
		if fClonedForms[index] == ref as form
			found = true
		elseIf found
			newFormList[index] = fClonedForms[index]
		else
			newFormList[index - 1] = fClonedForms[index]
		endIf
	endWhile
	fClonedForms = newFormList
endFunction

Int function GetVersion()

	return 10
endFunction

function OnConfigInit()

	debug.Notification("Clonejuration installing, please wait a moment for the MCM menu to register.")
	self.RegisterForCrosshairRef()
	sNpcOptions = new String[3]
	sNpcOptions[0] = "Conjure"
	sNpcOptions[1] = "Remove"
	sNpcOptions[2] = "Cancel"
	sCloneLevels = new String[5]
	sCloneLevels[0] = "Easy"
	sCloneLevels[1] = "Medium"
	sCloneLevels[2] = "Hard"
	sCloneLevels[3] = "Boss"
	sCloneLevels[4] = "Default"
	sCloneCounts = new String[11]
	iCloneCounts = new Int[11]
	iCloneCounts[0] = 1
	iCloneCounts[1] = 2
	iCloneCounts[2] = 3
	iCloneCounts[3] = 4
	iCloneCounts[4] = 5
	iCloneCounts[5] = 10
	iCloneCounts[6] = 20
	iCloneCounts[7] = 50
	iCloneCounts[8] = 100
	iCloneCounts[9] = 200
	iCloneCounts[10] = 500
	Int index = iCloneCounts.length
	while index
		index -= 1
		sCloneCounts[index] = iCloneCounts[index] as String
	endWhile
endFunction

function OnOptionInputOpen(Int option)

	if option == iSearchOID
		self.SetInputDialogStartText("")
	endIf
endFunction

function OnOptionSelect(Int option)

	if option == iCloneOID && aCurrentNPC as Bool
		self.AddNPC(aCurrentNPC)
		self.ForcePageReset()
	elseIf option == iClearAllOID
		Bool continue = self.ShowMessage("Are you sure you want to clear everything?", true, "$Yes", "$No")
		if continue
			fClonedForms = none
			self.ForcePageReset()
		endIf
	endIf
endFunction
