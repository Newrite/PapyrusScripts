Scriptname AIWMenuScript extends SKI_ConfigBase
{This script adds a MCM for the Attribute Icon Widget}

AIWidgetScript Property AIW Auto

Int xOID
Int yOID
Int vAnchorOID
Int hAnchorOID
Int visibleOID
Int iconsOID
Int numberOID
Int scaleOID
Int alphaOID
Int numberStyleOID
Int iconStyleOID

Float fScale = 100.00

String[] hAnchorList
String[] vAnchorList

String[] numberStyleList
String[] iconStyleList

Int Function GetVersion()
	Return 2
EndFunction

Event OnConfigInit()
	Pages = new String[1]
	Pages[0] = "$General"

	hAnchorList = new String[2]
	hAnchorList[0] = "left"
	hAnchorList[1] = "right"
	
	vAnchorList = new String[2]
	vAnchorList[0] = "bottom"
	vAnchorList[1] = "top"
EndEvent

Event OnVersionUpdate(Int aiVersion)
	If (aiVersion >= 2 && CurrentVersion < 2)
		numberStyleList = new String[2]
		numberStyleList[0] = "$Percentage"
		numberStyleList[1] = "$Absolute"
		
		iconStyleList = new String[2]
		iconStyleList[0] = "$Dynamic"
		iconStyleList[1] = "$Static"
	EndIf
EndEvent

Event OnPageReset(String asPage)
	SetCursorFillMode(TOP_TO_BOTTOM)
	
	If (asPage == "$General")
		AddHeaderOption("$Header1")
		xOID = AddSliderOption("$X", AIW.X, "{0}")
		yOID = AddSliderOption("$Y", AIW.Y, "{0}")
		;scaleOID = AddSliderOption("$Scale", fScale, "{0} %")
		hAnchorOID = AddMenuOption("$HAnchor", hAnchorList[hAnchorList.Find(AIW.HAnchor)])
		vAnchorOID = AddMenuOption("$VAnchor", vAnchorList[vAnchorList.Find(AIW.VAnchor)])
		;visibleOID = AddToggleOption("$Visible", AIW.isVisible)
		AddEmptyOption()
		AddHeaderOption("$Header2")
		alphaOID = AddSliderOption("$Alpha", AIW.Alpha, "{0} %")
		iconsOID = AddToggleOption("$IconVisible", AIW.iconsVisible)
		numberOID = AddToggleOption("$NumberVisible", AIW.numbersVisible)
		iconStyleOID = AddMenuOption("$IconStyle", iconStyleList[AIW.iconStyle])
		numberStyleOID = AddMenuOption("$NumberStyle", numberStyleList[AIW.numberStyle])
	EndIf
EndEvent

Event OnOptionSliderOpen(Int aiOption)
	If (aiOption == xOID)
		SetSliderDialogStartValue(AIW.X)
		SetSliderDialogRange(0.00, 1280.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(10.00)
	ElseIf (aiOption == yOID)
		SetSliderDialogStartValue(AIW.Y)
		SetSliderDialogRange(0.00, 720.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(710.00)
	ElseIf (aiOption == scaleOID)
		SetSliderDialogStartValue(fScale)
		SetSliderDialogRange(50.00, 200.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	ElseIf (aiOption == alphaOID)
		SetSliderDialogStartValue(AIW.Alpha)
		SetSliderDialogRange(0.00, 100.00)
		SetSliderDialogInterval(1.00)
		SetSliderDialogDefaultValue(100.00)
	EndIf
EndEvent

Event OnOptionSliderAccept(Int aiOption, Float afValue)
	If (aiOption == xOID)
		AIW.setX(afValue)
		SetSliderOptionValue(aiOption, AIW.X, "{0}")
	ElseIf (aiOption == yOID)
		AIW.setY(afValue)
		SetSliderOptionValue(aiOption, AIW.Y, "{0}")
	ElseIf (aiOption == scaleOID)
		AIW.setScaling(afValue)
		fScale = afValue
		SetSliderOptionValue(aiOption, fScale, "{0}%")
	ElseIf (aiOption == alphaOID)
		AIW.setTransparency(afValue)
		SetSliderOptionValue(aiOption, AIW.Alpha, "{0}")
	EndIf
EndEvent

Event OnOptionMenuOpen(Int aiOption)
	If (aiOption == hAnchorOID)
		SetMenuDialogStartIndex(hAnchorList.Find(AIW.HAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(hAnchorList)
	ElseIf (aiOption == vAnchorOID)
		SetMenuDialogStartIndex(vAnchorList.Find(AIW.VAnchor))
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(vAnchorList)
	ElseIf (aiOption == iconStyleOID)
		SetMenuDialogStartIndex(AIW.iconStyle)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(iconStyleList)
	ElseIf (aiOption == numberStyleOID)
		SetMenuDialogStartIndex(AIW.numberStyle)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(numberStyleList)
	EndIf
EndEvent

Event OnOptionMenuAccept(Int aiOption, Int aiIndex)
	If (aiOption == hAnchorOID)
		AIW.HAnchor = hAnchorList[aiIndex]
		SetMenuOptionValue(aiOption, hAnchorList[hAnchorList.Find(AIW.HAnchor)])
	ElseIf (aiOption == vAnchorOID)
		AIW.VAnchor = vAnchorList[aiIndex]
		SetMenuOptionValue(aiOption, vAnchorList[vAnchorList.Find(AIW.VAnchor)])
	ElseIf (aiOption == iconStyleOID)
		AIW.iconStyle = aiIndex
		SetMenuOptionValue(aiOption, iconStyleList[AIW.iconStyle])
	ElseIf (aiOption == numberStyleOID)
		AIW.numberStyle = aiIndex
		SetMenuOptionValue(aiOption, numberStyleList[AIW.numberStyle])
	EndIf
EndEvent

Event OnOptionSelect(Int aiOption)
	If (aiOption == visibleOID)
		AIW.isVisible = !AIW.isVisible
		SetToggleOptionValue(aiOption, AIW.isVisible)
	ElseIf (aiOption == iconsOID)
		AIW.iconsVisible = !AIW.iconsVisible
		SetToggleOptionValue(aiOption, AIW.iconsVisible)
	ElseIf (aiOption == numberOID)
		AIW.numbersVisible = !AIW.numbersVisible
		SetToggleOptionValue(aiOption, AIW.numbersVisible)
	EndIf
EndEvent

Event OnOptionHighlight(Int aiOption)
	If (aiOption == xOID)
		SetInfoText("$InfoX")
	ElseIf (aiOption == yOID)
		SetInfoText("$InfoY")
	ElseIf (aiOption == hAnchorOID)
		SetInfoText("$InfoHAnchor")
	ElseIf (aiOption == vAnchorOID)
		SetInfoText("$InfoVAnchor")
	ElseIf (aiOption == iconsOID)
		SetInfoText("$InfoIcon")
	ElseIf (aiOption == numberOID)
		SetInfoText("$InfoNumber")
	EndIf
EndEvent