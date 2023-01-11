Scriptname HH_MCM_For_V extends SKI_ConfigBase  
int enableModOptionID = 0
int enableModOptionID1 = 0
int keyMapOptionID = 0
int keyMapOptionID1 = 0
int currentKeyCode = 21
int currentKeyCode2 = 22
int AddTextOption = 0
int AddTextOption2 = 0
int AddTextOption3 = 0
int AddTextOption4 = 0
float AddTextOption1 = 0.0
bool modActive = true 
bool ManualActive = true 
Float Property BCfloat  Auto
Int Property BCint  Auto 
int Damage
float DamagePoison
;\\\\Property 
GlobalVariable Property HH_Key Auto
GlobalVariable Property HH_key_for_boom Auto
GlobalVariable Property HH_check_manual_detec Auto
GlobalVariable Property HH_Traps_max Auto
GlobalVariable Property BZ_LAndL_Global Auto
Perk Property HH_LockPick_dwmers Auto
Perk Property HH_engineering_2 Auto
Perk Property HH_engineering_3 Auto
Quest Property HH_Quest_to_restart1  Auto  
Quest Property HH_Quest_to_restart2  Auto  
Actor Property PlayerRef  Auto 

TrapsLockPickWidgetScript Property TLPWS Auto
int widgetOptionNumbet = 0
bool widgetOptionToggle = true

Int Toggle


Event OnPageReset(string page)
Damage = ((PlayerRef.GetActorValue("LockpickingMod") as int) * BCint)
DamagePoison = ((PlayerRef.GetActorValue("LockpickingMod") as int) * BCfloat)
SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("��������� ����")
       keyMapOptionID = AddKeymapOption("������� ��� ���������", currentKeyCode); 
	   keyMapOptionID1 = AddKeymapOption("������� ��� ���������", currentKeyCode2)
	   AddEmptyOption()
	   enableModOptionID = AddToggleOption("���/���� ���", modActive);
	   enableModOptionID1 = AddToggleOption("�������������� ���������", ManualActive);
	   AddEmptyOption()
	   widgetOptionNumbet = AddToggleOption("��������� �������", widgetOptionToggle)
	   AddSliderOptionST("NW_PosX", "������� �� X", TLPWS.GetPositionX(), "{1}")
	   AddSliderOptionST("NW_PosY", "������� �� Y", TLPWS.GetPositionY(), "{1}")
	   AddSliderOptionST("NW_Scale", "������� �������", TLPWS.GetScale(), "{1}")
	AddHeaderOption("���� �� �������")
		AddTextOption = AddTextOption("�������", Damage)
		AddTextOption2 = AddTextOption("�������", Damage)
		AddTextOption3 = AddTextOption("��������", Damage)
		AddTextOption4 = AddTextOption("��������", Damage)
		AddTextOption1 = AddTextOption("��������", DamagePoison)
	AddHeaderOption("������������ ��������������� ������ �� ������")
		Toggle = AddToggleOption("������������ ��������������� ������", BZ_LAndL_Global.GetValueInt())
EndEvent 

Event OnOptionKeyMapChange(int option, int keyCode, String conflictControl, String conflictName)
	If(option == keyMapOptionID)
		bool continue = true
		If(conflictControl != "")
			String mssg
			If(conflictName != "")
				mssg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
			Else
				mssg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
			EndIf

			continue = ShowMessage(mssg, true, "$Yes", "$No")
		EndIf

		If(continue)
			currentKeyCode = keyCode
			SetKeyMapOptionValue(keyMapOptionID, currentKeyCode)
			HH_Key.SetValueInt(currentKeyCode)
		EndIf
	EndIf
			If(option == keyMapOptionID1)
				bool continue = true
					If(conflictControl != "")
						String mssg
						If(conflictName != "")
							mssg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
			Else
				mssg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
			EndIf
			continue = ShowMessage(mssg, true, "$Yes", "$No")
					EndIf

			If(continue)
			currentKeyCode2 = keyCode
			SetKeyMapOptionValue(keyMapOptionID1, currentKeyCode2)
			HH_key_for_boom.SetValueInt(currentKeyCode2)
			EndIf
			EndIf
EndEvent

Event OnOptionHighlight(int option)
	If(option == keyMapOptionID)
		SetInfoText("��������� ������� ��� ��������� �������. ��� ��������� ������� ���������� ���������� ������� ������� �� ����� 0,2 ������.")
			ElseIf(option == enableModOptionID)
		If(!modActive)
			SetInfoText("������� ����� �������� ���")
		Else
			SetInfoText("��� ����������� - ��������� ��� � ������� �� �������� ����, ����� ������� � ���� ��� ��� � ������� �������� ���. ����������� ��� ������ � ������ ������������� ������ ��� ��� ���������� ����")
		EndIf
	EndIf
	if (option == keyMapOptionID1)
		SetInfoText("��������� ������� ���������. ���������� ��� ������� � �������, � ��� �� ������ ������� �� ���� �������, ����������� � ������ ��������.")
	endif
	if (option ==AddTextOption)
		SetInfoText("������� � �������� �������: " + Damage +". ����������� ����� ������� ��������� ������ ����. ������� ������ � ��������� 10% �� �����, � ���������� ���������� 40%.")
	endif
	if (option ==AddTextOption2)
		SetInfoText("������� ������� �������: " + Damage +". ���������� ����� ������� ��������� ������ ��������������  � ������ � ����. ")
	endif
	if (option ==AddTextOption3)
		SetInfoText("�������� ������� �������: " + Damage +". ���������� ����� ������� ��������� ������ ��������������  � ���� � ����.")
	endif
	if (option ==AddTextOption4)
		SetInfoText("�������� ������� �������: " + Damage +". ���������� ����� ������� ��������� ������ ��������������  � ������������� � ����.")
	endif
	if (option ==AddTextOption1)
		SetInfoText("�������� ������� �������: " + DamagePoison+". ����� ����, � ������� 10 ������. ���� ��������� ������ ��������������  � ��� � ����.")
	endif
	if (option ==enableModOptionID1)
		SetInfoText("���/���� �������������� ��������� �������")
	endif
	If (Option == Toggle)
                SetInfoText("��������/��������� �������������� ����� ������")
	endIF
	If(option == widgetOptionNumbet)
		SetInfoText("������������ ����������� ������� Lock&Pick")
	EndIf	
EndEvent

Event OnOptionSelect(int option)
	If(option == enableModOptionID)
		modActive = !modActive
		SetToggleOptionValue(enableModOptionID, modActive)
		If(modActive)
		HH_Quest_to_restart1.Start()
		HH_Quest_to_restart2.Start()
			if !PlayerRef.HasPerk(HH_LockPick_dwmers)
				HH_Traps_max.SetValue(1)
			endif
			if PlayerRef.HasPerk(HH_LockPick_dwmers)
			HH_Traps_max.SetValue(2)
			endif
			If PlayerRef.HasPerk(HH_engineering_2)
				HH_Traps_max.SetValue(3)
				endif
					If PlayerRef.HasPerk(HH_engineering_3)
						HH_Traps_max.SetValue(4)
					endif
			debug.messagebox("��� �������")
		Else
		HH_Quest_to_restart1.Stop()
		HH_Quest_to_restart2.Stop()
		debug.messagebox("��� ��������")
		EndIf
	EndIf
	If(option == enableModOptionID1)
		ManualActive = !ManualActive
		SetToggleOptionValue(enableModOptionID1, ManualActive)
		If(ManualActive)
			HH_check_manual_detec.SetValue(0)
			debug.messagebox("������� ������������ �������������")
		Else
		HH_check_manual_detec.SetValue(1)
		debug.messagebox("������� ������������ ������ �������� ������� ���������")
		endif
	EndIf
	If (option == Toggle)
		If BZ_LAndL_Global.GetValue() == 1
					BZ_LAndL_Global.SetValue(0)
					SetToggleOptionValue(Toggle, 0)
		ElseIf BZ_LAndL_Global.GetValue() == 0
					BZ_LAndL_Global.SetValue(1)
					SetToggleOptionValue(Toggle, 1)
		EndIf

	EndIf
	If(option == widgetOptionNumbet)
		widgetOptionToggle = !widgetOptionToggle
		SetToggleOptionValue(widgetOptionNumbet, widgetOptionToggle)
		TLPWS.ChangeVisible()
	EndIf
EndEvent

State NW_PosX
    Event OnSliderOpenST()
        SetSliderDialogStartValue(TLPWS.GetPositionX())
        SetSliderDialogDefaultValue(TLPWS.GetDefaultPositionX())
        SetSliderDialogRange(0.0, 1920.0)
        SetSliderDialogInterval(0.5)
    EndEvent

    Event OnSliderAcceptST(float value)
		TLPWS.SetPositionX(value)
        SetSliderOptionValueST(TLPWS.GetPositionX(), "{1}")
    EndEvent

    Event OnDefaultST()
        TLPWS.SetDefaultPositionX()
        SetSliderOptionValueST(TLPWS.GetPositionX(), "{1}")
    EndEvent

    Event OnHighlightST()
        SetInfoText("������������� ������� ������� �� X ����������, ���������� ��� ��� ������� ������� �� ������� �������� ��������� ����� ���������� 1280�720.")
    EndEvent
EndState

State NW_PosY
    Event OnSliderOpenST()
        SetSliderDialogStartValue(TLPWS.GetPositionY())
        SetSliderDialogDefaultValue(TLPWS.GetDefaultPositionY())
        SetSliderDialogRange(0.0, 1080.0)
        SetSliderDialogInterval(0.5)
    EndEvent

    Event OnSliderAcceptST(float value)
		TLPWS.SetPositionY(value)
        SetSliderOptionValueST(TLPWS.GetPositionY(), "{1}")
    EndEvent

    Event OnDefaultST()
        TLPWS.SetDefaultPositionY()
        SetSliderOptionValueST(TLPWS.GetPositionY(), "{1}")
    EndEvent

    Event OnHighlightST()
        SetInfoText("������������� ������� ������� �� Y ����������, ���������� ��� ��� ������� ������� �� ������� �������� ��������� ����� ���������� 1280�720.")
    EndEvent
EndState

State NW_Scale
    Event OnSliderOpenST()
        SetSliderDialogStartValue(TLPWS.GetScale())
        SetSliderDialogDefaultValue(TLPWS.GetDefaultScale())
        SetSliderDialogRange(1.0, 200.0)
        SetSliderDialogInterval(0.5)
    EndEvent

    Event OnSliderAcceptST(float value)
		TLPWS.SetScale(value)
        SetSliderOptionValueST(TLPWS.GetScale(), "{1}")
    EndEvent

    Event OnDefaultST()
        TLPWS.SetDefaultScale()
        SetSliderOptionValueST(TLPWS.GetScale(), "{1}")
    EndEvent

    Event OnHighlightST()
        SetInfoText("�������� ������� �������.")
    EndEvent
EndState
