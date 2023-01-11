scriptname HH_MCM extends SKI_ConfigBase

int enableModOptionID = 0
int enableModOptionID1 = 0
int keyMapOptionID = 0
int keyMapOptionID1 = 0
int currentKeyCode = 45
int currentKeyCode_M = 208
int AddTextOption = 0
int AddTextOption1 = 0
int AddTextOption2 = 0
bool modActive = true
Actor Property PlayerRef Auto 
Armor Property HH_EQ_Steel  Auto  
Armor Property HH_EQ_Elf  Auto  
Armor Property HH_EQ_Glass  Auto  
Armor Property HH_EQ_Dragonick  Auto  
Armor Property HH_EQ_DW  Auto  
Armor Property HH_EQ_ORC  Auto  
Armor Property HH_EQ_EBONY  Auto  
Armor Property HH_EQ_Daedric  Auto  
Armor Property HH_EQ_Silver  Auto  
Armor Property HH_EQ_Silver_T2  Auto  
Quest Property HH_BQ  Auto  
GlobalVariable Property HH_lichtcrit_chance  Auto  
GlobalVariable Property HH_Key Auto
GlobalVariable Property HH_Perk_gotit Auto 
GlobalVariable Property HH_Press_Massc Auto
Perk Property HH_Pickpocket7 Auto

DesmondPickpocketWidgetScript Property DPWS Auto
int widgetOptionNumbet = 0
bool widgetOptionToggle = true

Event OnPageReset(string page)
float Damage
float penetr
int Base_damage
float Base_PEN
float staminaBonus = 1 + ((PlayerRef.GetBaseActorValue("Stamina") - 150.0) * 0.005)
	if staminaBonus < 1.0
		staminaBonus = 1.0
	endif
float Perk_pent = 0.0
if PlayerRef.HasPerk(HH_Pickpocket7)
	Perk_pent = 0.15
endIf
if PlayerRef.IsEquipped(HH_EQ_Steel) 
	Base_damage = 40
	Base_PEN = 0.02 
 elseif PlayerRef.IsEquipped(HH_EQ_Elf)
 	Base_damage = 60
	Base_PEN = 0.05 
 elseif PlayerRef.IsEquipped(HH_EQ_Glass)
 	Base_damage = 80
	Base_PEN = 0.10 
 elseif PlayerRef.IsEquipped(HH_EQ_Dragonick)
 	Base_damage = 100
	Base_PEN = 0.15
 elseif PlayerRef.IsEquipped(HH_EQ_DW)
 	Base_damage = 120
	Base_PEN = 0.1
 elseif PlayerRef.IsEquipped(HH_EQ_ORC)
 	Base_damage = 80
	Base_PEN = 0.05 
 elseif PlayerRef.IsEquipped(HH_EQ_EBONY)
 	Base_damage = 160
	Base_PEN = 0.15 
 elseif PlayerRef.IsEquipped(HH_EQ_Daedric)
 	Base_damage = 200
	Base_PEN = 0.20 
 elseif PlayerRef.IsEquipped(HH_EQ_Silver)
 	Base_damage = 45
	Base_PEN = 0.08 
 elseif PlayerRef.IsEquipped(HH_EQ_Silver_T2)
 	Base_damage = 65
	Base_PEN = 0.12 
endif
float Newrite_chort = PlayerRef.GetActorValue("TwoHandedSkillAdvance")
if Newrite_chort>100.0
Newrite_chort=100.0
endIf
Damage = Base_damage * (1+(PlayerRef.GetActorValue("PickPocketMod")/100)) * (1+(PlayerRef.GetActorValue("OneHandedPowerMod")/100)) * (staminaBonus) *(1+(Newrite_chort/200))
int Ddmg = Damage as int
penetr = (Perk_pent + ((PlayerRef.GetActorValue("Pickpocket")-PlayerRef.GetBaseActorValue("Pickpocket"))*0.005) + Base_PEN ) * 100.0
if penetr > 80.0
	penetr = 80.0
endIf
int DPenetr = penetr as int
SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("��������� ����")
       keyMapOptionID = AddKeymapOption("������� ��� ������", currentKeyCode); ��� �����
	   keyMapOptionID1=AddKeymapOption("������� ��� ���������", currentKeyCode_M); ��� ��������
	   enableModOptionID = AddToggleOption("���/���� ���", modActive)
	   AddEmptyOption()
	   widgetOptionNumbet = AddToggleOption("��������� �������", widgetOptionToggle)
	   AddSliderOptionST("NW_PosX", "������� �� X", DPWS.GetPositionX(), "{1}")
	   AddSliderOptionST("NW_PosY", "������� �� Y", DPWS.GetPositionY(), "{1}")
	AddHeaderOption("���������� � ���������")
	   AddEmptyOption()
	   AddTextOption1 = AddTextOption("���� �� ���������� ����", Ddmg)
	   AddEmptyOption()
	   AddTextOption2 = AddTextOption("�������� �����", DPenetr+ "%")
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
			currentKeyCode_M = keyCode
			SetKeyMapOptionValue(keyMapOptionID1, currentKeyCode_M)
			HH_Press_Massc.SetValueInt(currentKeyCode_M)
		EndIf
	EndIf
EndEvent

Event OnOptionHighlight(int option)
	If(option == keyMapOptionID)
		SetInfoText("��������� ������� ��� ��������� ������")
			ElseIf(option == enableModOptionID)
		If(!modActive)
			SetInfoText("������� ����� �������� ���")
		Else
			SetInfoText("��� ����������� - ��������� ��� � ������� �� �������� ����, ����� ������� � ���� ��� ��� � ������� �������� ���. ����������� ��� ������ � ������ ������������� ������ ��� ��� ���������� ����")
		EndIf
	EndIf
	If(option == AddTextOption1)
	SetInfoText("���� ������� �� �������� ����� ����, �������� ����� �������, ������ ������ ��� ������ �������.")
	ElseIf (option == AddTextOption2)
	SetInfoText("���������� ������������ �����  ������� �� ��������� ����, �������� ������ � ��������� ������ � ������ ������.")
	endif
	If(option == keyMapOptionID1)
		SetInfoText("��������� ������� ��� �������� � ����� ���������. � ���� ������ ��� ������� ����� ���� � �������� � ����������� ����������, �� ������� ������������ � ����� �� �������: �������, �����, ��������, �������, ����������, �������.\n����������� ���������� ����� ������ � ���������� ���")
	endIf
	If(option == widgetOptionNumbet)
		SetInfoText("������������ ����������� ������� PickPocket")
	EndIf		
EndEvent

Event OnOptionSelect(int option)
	If(option == enableModOptionID)
		modActive = !modActive
		SetToggleOptionValue(enableModOptionID, modActive)
		If(modActive)
		HH_BQ.Start()
			debug.messagebox("��� �������")
		Else
		HH_BQ.Stop()
		debug.messagebox("��� ��������")
		EndIf
	EndIf
	If(option == widgetOptionNumbet)
		widgetOptionToggle = !widgetOptionToggle
		SetToggleOptionValue(widgetOptionNumbet, widgetOptionToggle)
		DPWS.ChangeVisible()
	EndIf
EndEvent

State NW_PosX
    Event OnSliderOpenST()
        SetSliderDialogStartValue(DPWS.GetPositionX())
        SetSliderDialogDefaultValue(DPWS.GetDefaultPositionX())
        SetSliderDialogRange(0.0, 1920.0)
        SetSliderDialogInterval(0.5)
    EndEvent

    Event OnSliderAcceptST(float value)
		DPWS.SetPositionX(value)
        SetSliderOptionValueST(DPWS.GetPositionX(), "{1}")
    EndEvent

    Event OnDefaultST()
        DPWS.SetDefaultPositionX()
        SetSliderOptionValueST(DPWS.GetPositionX(), "{1}")
    EndEvent

    Event OnHighlightST()
        SetInfoText("������������� ������� ������� �� X ����������, ���������� ��� ��� ������� ������� �� ������� �������� ��������� ����� ���������� 1280�720.")
    EndEvent
EndState

State NW_PosY
    Event OnSliderOpenST()
        SetSliderDialogStartValue(DPWS.GetPositionY())
        SetSliderDialogDefaultValue(DPWS.GetDefaultPositionY())
        SetSliderDialogRange(0.0, 1080.0)
        SetSliderDialogInterval(0.5)
    EndEvent

    Event OnSliderAcceptST(float value)
		DPWS.SetPositionY(value)
        SetSliderOptionValueST(DPWS.GetPositionY(), "{1}")
    EndEvent

    Event OnDefaultST()
        DPWS.SetDefaultPositionY()
        SetSliderOptionValueST(DPWS.GetPositionY(), "{1}")
    EndEvent

    Event OnHighlightST()
        SetInfoText("������������� ������� ������� �� Y ����������, ���������� ��� ��� ������� ������� �� ������� �������� ��������� ����� ���������� 1280�720.")
    EndEvent
EndState

State NW_Scale
    Event OnSliderOpenST()
        SetSliderDialogStartValue(DPWS.GetScale())
        SetSliderDialogDefaultValue(DPWS.GetDefaultScale())
        SetSliderDialogRange(1.0, 200.0)
        SetSliderDialogInterval(0.5)
    EndEvent

    Event OnSliderAcceptST(float value)
		DPWS.SetScale(value)
        SetSliderOptionValueST(DPWS.GetScale(), "{1}")
    EndEvent

    Event OnDefaultST()
        DPWS.SetDefaultScale()
        SetSliderOptionValueST(DPWS.GetScale(), "{1}")
    EndEvent

    Event OnHighlightST()
        SetInfoText("�������� ������� �������.")
    EndEvent
EndState
