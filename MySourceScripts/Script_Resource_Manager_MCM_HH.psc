Scriptname Script_Resource_Manager_MCM_HH extends SKI_ConfigBase  

GlobalVariable Property GlobalMult  Auto  ; глобальный мультипликатор расхода на атаки
GlobalVariable Property GlobalWeightMult  Auto  ; глобальный мультипликатор влияния веса на атаки(либо влияние базового урона оружия при вес==0)
GlobalVariable Property GlobalUpdateTimeBow  Auto  ; во сколько секунд лук отнимает ресурс лук
GlobalVariable Property GlobalUpdateTimeCrossBow  Auto  ; во сколько секунд отнимает ресурс арбалет
GlobalVariable Property GlobalUpdateTimeRecovery  Auto  ; время востановления запаса сил после последней атаки
GlobalVariable Property GlobalPercentRecovery  Auto  ; мультипликатор колличества востановленной стамины
GlobalVariable Property GlobalJumpValueBase  Auto  ; базовое значение расхода запаса сил на прыжок
GlobalVariable Property GlobalSoulsON  Auto  ; Включение соул расхода 
GlobalVariable Property GlobalNPCON  Auto ;  Включение/отключение скриптов расхода на нпц
int enableModOptionID = 0
bool souls = false
int enableModOptionID1 = 0
bool NPC = true

Event OnPageReset(string page)
SetCursorFillMode(TOP_TO_BOTTOM)
AddHeaderOption("Настройки Ресурсов")
AddSliderOptionST("NW_GlobalMult", "Общий множитель", GlobalMult.GetValue(), "{2}")
AddSliderOptionST("NW_GlobalWeightMult", "Множитель веса оружия", GlobalWeightMult.GetValue(), "{2}")
AddSliderOptionST("NW_GlobalJumpValueBase", "Стоимость прыжка", GlobalJumpValueBase.GetValue(), "{0}")
AddHeaderOption("Соулс лайк режим запаса сил")
enableModOptionID = AddToggleOption("Включение соулс-лайк режима", souls)
AddSliderOptionST("NW_GlobalUpdateTimeRecovery", "Задержка перед восстановлением", GlobalUpdateTimeRecovery.GetValue(), "{1}")
AddSliderOptionST("NW_GlobalPercentRecovery", "Коэффициент восстановления", GlobalPercentRecovery.GetValue(), "{2}")
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
		SetInfoText("Включение соулс-лайк режима для атак ближнего боя. Расход запаса сил увеличивается с каждой последующей атакой, но после паузы восстанавливает часть затраченного запаса сил. Работает только для игрока.")
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
        SetInfoText("Множитель на который умножается конечный расход ресурсов на атаку/натягивание тетивы/перезарядки арбалета.")
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
        SetInfoText("Множитель влияния веса (либо базового урона оружия если значение веса равно нулю) на расход ресурса для атак.")
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
        SetInfoText("Пауза перед восстановлением запаса сил после последней проведенной атаки, для соулс-лайк режима.")
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
        SetInfoText("Множитель восстановления запаса сил после паузы. Пример: если было потрачено 100 запаса сил на атаки, а значение стоит 0.70, восстановит 70 единиц запаса сил, для соулс-лайк режима.")
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
        SetInfoText("Количество затрачиваемого запаса сил на прыжок, на него не влияет какой-либо множитель, только значение надетой экипировки.")
    EndEvent
EndState