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
	AddHeaderOption("Настройки мода")
       keyMapOptionID = AddKeymapOption("Клавиша для установки", currentKeyCode); 
	   keyMapOptionID1 = AddKeymapOption("Клавиша для детонации", currentKeyCode2)
	   AddEmptyOption()
	   enableModOptionID = AddToggleOption("Вкл/выкл мод", modActive);
	   enableModOptionID1 = AddToggleOption("Автоматическая активация", ManualActive);
	   AddEmptyOption()
	   widgetOptionNumbet = AddToggleOption("Включение виджета", widgetOptionToggle)
	   AddSliderOptionST("NW_PosX", "Позиция по X", TLPWS.GetPositionX(), "{1}")
	   AddSliderOptionST("NW_PosY", "Позиция по Y", TLPWS.GetPositionY(), "{1}")
	   AddSliderOptionST("NW_Scale", "Масштаб виджета", TLPWS.GetScale(), "{1}")
	AddHeaderOption("Урон от ловушек")
		AddTextOption = AddTextOption("Картечь", Damage)
		AddTextOption2 = AddTextOption("Ледяная", Damage)
		AddTextOption3 = AddTextOption("Огненная", Damage)
		AddTextOption4 = AddTextOption("Грозовая", Damage)
		AddTextOption1 = AddTextOption("Ядовитая", DamagePoison)
	AddHeaderOption("Переключение автоматического взлома на ручной")
		Toggle = AddToggleOption("Переключение Автоматического взлома", BZ_LAndL_Global.GetValueInt())
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
		SetInfoText("Назначьте клавишу для установки ловушек. Для установки ловушки необходимо удерживать клавишу нажатой не менее 0,2 секунд.")
			ElseIf(option == enableModOptionID)
		If(!modActive)
			SetInfoText("Нажмите чтобы включить мод")
		Else
			SetInfoText("Для перезапуска - выключите мод и выйдете из главного меню, затем зайдите в меню еще раз и нажмите включить мод. Используйте это только в случае возникновения ошибок или при обновлении мода")
		EndIf
	EndIf
	if (option == keyMapOptionID1)
		SetInfoText("Назначьте клавишу детонации. Детонируют все ловушки в локации, а так же просто удаляет из игры ловушки, оставленные в других локациях.")
	endif
	if (option ==AddTextOption)
		SetInfoText("Ловушки с картечью наносят: " + Damage +". физического урона который снижается броней цели. Наносит нежити и призракам 10% от урона, а двемерским механизмам 40%.")
	endif
	if (option ==AddTextOption2)
		SetInfoText("Ледяные ловушки наносят: " + Damage +". стихийного урона который снижается только сопротивлением  к холоду у цели. ")
	endif
	if (option ==AddTextOption3)
		SetInfoText("Огненные ловушки наносят: " + Damage +". стихийного урона который снижается только сопротивлением  к огню у цели.")
	endif
	if (option ==AddTextOption4)
		SetInfoText("Грозовые ловушки наносят: " + Damage +". стихийного урона который снижается только сопротивлением  к электричеству у цели.")
	endif
	if (option ==AddTextOption1)
		SetInfoText("Ядовитые ловушки наносят: " + DamagePoison+". урона ядом, в течении 10 секунд. Урон снижается только сопротивлением  к яду у цели.")
	endif
	if (option ==enableModOptionID1)
		SetInfoText("Вкл/выкл автоматической активации ловушек")
	endif
	If (Option == Toggle)
                SetInfoText("Включает/отключает автоматический взлом замков")
	endIF
	If(option == widgetOptionNumbet)
		SetInfoText("Переключение отображение виджета Lock&Pick")
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
			debug.messagebox("Мод включен")
		Else
		HH_Quest_to_restart1.Stop()
		HH_Quest_to_restart2.Stop()
		debug.messagebox("Мод выключен")
		EndIf
	EndIf
	If(option == enableModOptionID1)
		ManualActive = !ManualActive
		SetToggleOptionValue(enableModOptionID1, ManualActive)
		If(ManualActive)
			HH_check_manual_detec.SetValue(0)
			debug.messagebox("Ловушки активируются автоматически")
		Else
		HH_check_manual_detec.SetValue(1)
		debug.messagebox("Ловушки активируются только нажатием клавиши детонации")
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
        SetInfoText("Устанавливает позицию виджета по X координате, учитывайте что как правило полотно на котором рисуется интерфейс имеет разрешение 1280х720.")
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
        SetInfoText("Устанавливает позицию виджета по Y координате, учитывайте что как правило полотно на котором рисуется интерфейс имеет разрешение 1280х720.")
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
        SetInfoText("Изменяет масштаб виджета.")
    EndEvent
EndState
