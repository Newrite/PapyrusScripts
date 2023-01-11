Scriptname ArcaneCurseMCM extends SKI_ConfigBase  

arcanecursewidgetscript Property ACW Auto

int widgetOptionNumbet = 0

bool widgetOptionToggle = true


Event OnPageReset(string page)
SetCursorFillMode(TOP_TO_BOTTOM)
AddHeaderOption("Arcane Curse")
widgetOptionNumbet = AddToggleOption("˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜", widgetOptionToggle)
AddSliderOptionST("NW_PosX", "˜˜˜˜˜˜˜ ˜˜ X", ACW.GetPositionX(), "{1}")
AddSliderOptionST("NW_PosY", "˜˜˜˜˜˜˜ ˜˜ Y", ACW.GetPositionY(), "{1}")
AddSliderOptionST("NW_Scale", "˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜", ACW.GetScale(), "{1}")
EndEvent

Event OnOptionSelect(int option)
	If(option == widgetOptionNumbet)
		widgetOptionToggle = !widgetOptionToggle
		SetToggleOptionValue(widgetOptionNumbet, widgetOptionToggle)
		ACW.ChangeVisible()
	EndIf
EndEvent

Event OnOptionHighlight(int option)
	If(option == widgetOptionNumbet)
		SetInfoText("˜˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ Arcane Curse")
	EndIf	
EndEvent

State NW_PosX
    Event OnSliderOpenST()
        SetSliderDialogStartValue(ACW.GetPositionX())
        SetSliderDialogDefaultValue(ACW.GetDefaultPositionX())
        SetSliderDialogRange(0.0, 1920.0)
        SetSliderDialogInterval(0.5)
    EndEvent

    Event OnSliderAcceptST(float value)
		ACW.SetPositionX(value)
        SetSliderOptionValueST(ACW.GetPositionX(), "{1}")
    EndEvent

    Event OnDefaultST()
        ACW.SetDefaultPositionX()
        SetSliderOptionValueST(ACW.GetPositionX(), "{1}")
    EndEvent

    Event OnHighlightST()
        SetInfoText("˜˜˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜ X ˜˜˜˜˜˜˜˜˜˜, ˜˜˜˜˜˜˜˜˜˜ ˜˜˜ ˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜ 1280˜720.")
    EndEvent
EndState

State NW_PosY
    Event OnSliderOpenST()
        SetSliderDialogStartValue(ACW.GetPositionY())
        SetSliderDialogDefaultValue(ACW.GetDefaultPositionY())
        SetSliderDialogRange(0.0, 1080.0)
        SetSliderDialogInterval(0.5)
    EndEvent

    Event OnSliderAcceptST(float value)
		ACW.SetPositionY(value)
        SetSliderOptionValueST(ACW.GetPositionY(), "{1}")
    EndEvent

    Event OnDefaultST()
        ACW.SetDefaultPositionY()
        SetSliderOptionValueST(ACW.GetPositionY(), "{1}")
    EndEvent

    Event OnHighlightST()
        SetInfoText("˜˜˜˜˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜ Y ˜˜˜˜˜˜˜˜˜˜, ˜˜˜˜˜˜˜˜˜˜ ˜˜˜ ˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜ ˜˜˜˜˜ ˜˜˜˜˜˜˜˜˜˜ 1280˜720.")
    EndEvent
EndState

State NW_Scale
    Event OnSliderOpenST()
        SetSliderDialogStartValue(ACW.GetScale())
        SetSliderDialogDefaultValue(ACW.GetDefaultScale())
        SetSliderDialogRange(1.0, 200.0)
        SetSliderDialogInterval(0.5)
    EndEvent

    Event OnSliderAcceptST(float value)
		ACW.SetScale(value)
        SetSliderOptionValueST(ACW.GetScale(), "{1}")
    EndEvent

    Event OnDefaultST()
        ACW.SetDefaultScale()
        SetSliderOptionValueST(ACW.GetScale(), "{1}")
    EndEvent

    Event OnHighlightST()
        SetInfoText("˜˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜ ˜˜˜˜˜˜˜.")
    EndEvent
EndState

