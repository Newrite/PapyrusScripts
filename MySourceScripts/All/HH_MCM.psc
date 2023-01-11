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
	AddHeaderOption("Настройки мода")
       keyMapOptionID = AddKeymapOption("Клавиша для броска", currentKeyCode); Для ножей
	   keyMapOptionID1=AddKeymapOption("Клавиша для маскарада", currentKeyCode_M); Для маскарад
	   enableModOptionID = AddToggleOption("Вкл/выкл мод", modActive)
	   AddEmptyOption()
	   widgetOptionNumbet = AddToggleOption("Включение виджета", widgetOptionToggle)
	   AddSliderOptionST("NW_PosX", "Позиция по X", DPWS.GetPositionX(), "{1}")
	   AddSliderOptionST("NW_PosY", "Позиция по Y", DPWS.GetPositionY(), "{1}")
	AddHeaderOption("Статистика и параметры")
	   AddEmptyOption()
	   AddTextOption1 = AddTextOption("Урон от выбранного ножа", Ddmg)
	   AddEmptyOption()
	   AddTextOption2 = AddTextOption("Пробитие брони", DPenetr+ "%")
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
		SetInfoText("Назначьте клавишу для активации броска")
			ElseIf(option == enableModOptionID)
		If(!modActive)
			SetInfoText("Нажмите чтобы включить мод")
		Else
			SetInfoText("Для перезапуска - выключите мод и выйдете из главного меню, затем зайдите в меню еще раз и нажмите включить мод. Используйте это только в случае возникновения ошибок или при обновлении мода")
		EndIf
	EndIf
	If(option == AddTextOption1)
	SetInfoText("Урон зависит от базового урона ножа, значения белой стамины, взятых перков или других бонусов.")
	ElseIf (option == AddTextOption2)
	SetInfoText("Количество игнорируемой брони  зависит от материала ножа, зеленого бонуса к карманным кражам и взятых перков.")
	endif
	If(option == keyMapOptionID1)
		SetInfoText("Назначьте клавишу для перехода в режим Маскарада. В этом режиме при наличии перка Игра в маскарад и необходимой экипировки, вы станете дружественны к одной из фракций: бандиты, изгои, Доминион, Колдуны, Некроманты, Вампиры.\nНеобходимое снаряжение можно купить у Скульптора лиц")
	endIf
	If(option == widgetOptionNumbet)
		SetInfoText("Переключение отображение виджета PickPocket")
	EndIf		
EndEvent

Event OnOptionSelect(int option)
	If(option == enableModOptionID)
		modActive = !modActive
		SetToggleOptionValue(enableModOptionID, modActive)
		If(modActive)
		HH_BQ.Start()
			debug.messagebox("Мод включен")
		Else
		HH_BQ.Stop()
		debug.messagebox("Мод выключен")
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
        SetInfoText("Устанавливает позицию виджета по X координате, учитывайте что как правило полотно на котором рисуется интерфейс имеет разрешение 1280х720.")
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
        SetInfoText("Устанавливает позицию виджета по Y координате, учитывайте что как правило полотно на котором рисуется интерфейс имеет разрешение 1280х720.")
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
        SetInfoText("Изменяет масштаб виджета.")
    EndEvent
EndState
