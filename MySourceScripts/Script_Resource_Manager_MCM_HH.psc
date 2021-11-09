Scriptname Script_Resource_Manager_MCM_HH extends SKI_ConfigBase  

GlobalVariable Property GlobalMult  Auto  ; ���������� �������������� ������� �� �����
GlobalVariable Property GlobalWeightMult  Auto  ; ���������� �������������� ������� ���� �� �����(���� ������� �������� ����� ������ ��� ���==0)
GlobalVariable Property GlobalUpdateTimeBow  Auto  ; �� ������� ������ ��� �������� ������ ���
GlobalVariable Property GlobalUpdateTimeCrossBow  Auto  ; �� ������� ������ �������� ������ �������
GlobalVariable Property GlobalUpdateTimeRecovery  Auto  ; ����� ������������� ������ ��� ����� ��������� �����
GlobalVariable Property GlobalPercentRecovery  Auto  ; �������������� ����������� �������������� �������
GlobalVariable Property GlobalJumpValueBase  Auto  ; ������� �������� ������� ������ ��� �� ������
GlobalVariable Property GlobalSoulsON  Auto  ; ��������� ���� ������� 
GlobalVariable Property GlobalNPCON  Auto ;  ���������/���������� �������� ������� �� ���
int enableModOptionID = 0
bool souls = false
int enableModOptionID1 = 0
bool NPC = true

Event OnPageReset(string page)
SetCursorFillMode(TOP_TO_BOTTOM)
AddHeaderOption("��������� ��������")
AddSliderOptionST("NW_GlobalMult", "����� ���������", GlobalMult.GetValue(), "{2}")
AddSliderOptionST("NW_GlobalWeightMult", "��������� ���� ������", GlobalWeightMult.GetValue(), "{2}")
AddSliderOptionST("NW_GlobalJumpValueBase", "��������� ������", GlobalJumpValueBase.GetValue(), "{0}")
AddHeaderOption("����� ���� ����� ������ ���")
enableModOptionID = AddToggleOption("��������� �����-���� ������", souls)
AddSliderOptionST("NW_GlobalUpdateTimeRecovery", "�������� ����� ���������������", GlobalUpdateTimeRecovery.GetValue(), "{1}")
AddSliderOptionST("NW_GlobalPercentRecovery", "����������� ��������������", GlobalPercentRecovery.GetValue(), "{2}")
EndEvent

Event OnOptionSelect(int option)
	If(option == enableModOptionID)
		souls = !souls
		SetToggleOptionValue(enableModOptionID, souls)
		If(souls)
			GlobalSoulsON.SetValue(1.0)
		Else
			GlobalSoulsON.SetValue(0.0)
		EndIf
	EndIf
EndEvent

Event OnOptionHighlight(int option)
	If(option == enableModOptionID)
		SetInfoText("��������� �����-���� ������ ��� ���� �������� ���. ������ ������ ��� ������������� � ������ ����������� ������, �� ����� ����� ��������������� ����� ������������ ������ ���. �������� ������ ��� ������.")
	EndIf	
EndEvent

State NW_GlobalMult
    Event OnSliderOpenST()
        SetSliderDialogStartValue(GlobalMult.GetValue())
        SetSliderDialogDefaultValue(1.0)
        SetSliderDialogRange(0.0, 5.0)
        SetSliderDialogInterval(0.01)
    EndEvent

    Event OnSliderAcceptST(float value)
		GlobalMult.SetValue(value)
        SetSliderOptionValueST(GlobalMult.GetValue(), "{2}")
    EndEvent

    Event OnDefaultST()
        GlobalMult.SetValue(1.0)
        SetSliderOptionValueST(GlobalMult.GetValue(), "{2}")
    EndEvent

    Event OnHighlightST()
        SetInfoText("��������� �� ������� ���������� �������� ������ �������� �� �����/����������� ������/����������� ��������.")
    EndEvent
EndState

State NW_GlobalWeightMult
    Event OnSliderOpenST()
        SetSliderDialogStartValue(GlobalWeightMult.GetValue())
        SetSliderDialogDefaultValue(1.5)
        SetSliderDialogRange(0.0, 5.0)
        SetSliderDialogInterval(0.01)
    EndEvent

    Event OnSliderAcceptST(float value)
		GlobalWeightMult.SetValue(value)
        SetSliderOptionValueST(GlobalWeightMult.GetValue(), "{2}")
    EndEvent

    Event OnDefaultST()
        GlobalWeightMult.SetValue(1.5)
        SetSliderOptionValueST(GlobalWeightMult.GetValue(), "{2}")
    EndEvent

    Event OnHighlightST()
        SetInfoText("��������� ������� ���� (���� �������� ����� ������ ���� �������� ���� ����� ����) �� ������ ������� ��� ����.")
    EndEvent
EndState

State NW_GlobalUpdateTimeRecovery
    Event OnSliderOpenST()
        SetSliderDialogStartValue(GlobalUpdateTimeRecovery.GetValue())
        SetSliderDialogDefaultValue(2.0)
        SetSliderDialogRange(1.0, 5.0)
        SetSliderDialogInterval(0.1)
    EndEvent

    Event OnSliderAcceptST(float value)
		GlobalUpdateTimeRecovery.SetValue(value)
        SetSliderOptionValueST(GlobalUpdateTimeRecovery.GetValue(), "{1}")
    EndEvent

    Event OnDefaultST()
        GlobalUpdateTimeRecovery.SetValue(2.0)
        SetSliderOptionValueST(GlobalUpdateTimeRecovery.GetValue(), "{1}")
    EndEvent

    Event OnHighlightST()
        SetInfoText("����� ����� ��������������� ������ ��� ����� ��������� ����������� �����, ��� �����-���� ������.")
    EndEvent
EndState

State NW_GlobalPercentRecovery
    Event OnSliderOpenST()
        SetSliderDialogStartValue(GlobalPercentRecovery.GetValue())
        SetSliderDialogDefaultValue(0.70)
        SetSliderDialogRange(0.10, 1.00)
        SetSliderDialogInterval(0.01)
    EndEvent

    Event OnSliderAcceptST(float value)
		GlobalPercentRecovery.SetValue(value)
        SetSliderOptionValueST(GlobalPercentRecovery.GetValue(), "{2}")
    EndEvent

    Event OnDefaultST()
        GlobalPercentRecovery.SetValue(0.70)
        SetSliderOptionValueST(GlobalPercentRecovery.GetValue(), "{2}")
    EndEvent

    Event OnHighlightST()
        SetInfoText("��������� �������������� ������ ��� ����� �����. ������: ���� ���� ��������� 100 ������ ��� �� �����, � �������� ����� 0.70, ����������� 70 ������ ������ ���, ��� �����-���� ������.")
    EndEvent
EndState

State NW_GlobalJumpValueBase
    Event OnSliderOpenST()
        SetSliderDialogStartValue(GlobalJumpValueBase.GetValue())
        SetSliderDialogDefaultValue(15.0)
        SetSliderDialogRange(0.0, 100.0)
        SetSliderDialogInterval(1.0)
    EndEvent

    Event OnSliderAcceptST(float value)
		GlobalJumpValueBase.SetValue(value)
        SetSliderOptionValueST(GlobalJumpValueBase.GetValue(), "{0}")
    EndEvent

    Event OnDefaultST()
        GlobalJumpValueBase.SetValue(15.0)
        SetSliderOptionValueST(GlobalJumpValueBase.GetValue(), "{0}")
    EndEvent

    Event OnHighlightST()
        SetInfoText("���������� �������������� ������ ��� �� ������, �� ���� �� ������ �����-���� ���������, ������ �������� ������� ����������.")
    EndEvent
EndState