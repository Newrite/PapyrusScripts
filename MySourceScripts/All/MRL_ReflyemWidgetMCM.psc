Scriptname MRL_ReflyemWidgetMCM extends SKI_ConfigBase  

MRL_ReflyemWidgetQuest Property QuestManager Auto

int sliderWidgetPosHealthX = 0
int sliderWidgetPosHealthY = 0

int sliderWidgetPosStaminaX = 0
int sliderWidgetPosStaminaY = 0

int sliderWidgetPosMagickaX = 0
int sliderWidgetPosMagickaY = 0

int sliderWidgetScale = 0

int sliderUpdateRate = 0

int optionWidget = 0
bool optionWidgetToggle = true 


Event OnPageReset(string page)

    SetCursorFillMode(LEFT_TO_RIGHT)

    AddHeaderOption("Widget")
    AddHeaderOption("Health")

    sliderWidgetScale = AddSliderOption("Widget scale", QuestManager.InnerWidget.Scale, "{1}")
    sliderWidgetPosHealthX = AddSliderOption("Health position X", QuestManager.InnerWidget.PosHealthX, "{1}")

    sliderUpdateRate = AddSliderOption("Update rate", QuestManager.UpdateRate, "{1}")
    sliderWidgetPosHealthY = AddSliderOption("Health position Y", QuestManager.InnerWidget.PosHealthY, "{1}")

    optionWidget = AddToggleOption("Enable\\disable widget", optionWidgetToggle)
    AddEmptyOption()

    AddHeaderOption("Stamina")
    AddHeaderOption("Magicka")

    sliderWidgetPosStaminaX = AddSliderOption("Stamina position X", QuestManager.InnerWidget.PosStaminaX, "{1}")
    sliderWidgetPosMagickaX = AddSliderOption("Magicka position X", QuestManager.InnerWidget.PosMagickaX, "{1}")

    sliderWidgetPosStaminaY = AddSliderOption("Stamina position Y", QuestManager.InnerWidget.PosStaminaY, "{1}")
    sliderWidgetPosMagickaY = AddSliderOption("Magicka position Y", QuestManager.InnerWidget.PosMagickaY, "{1}")

EndEvent

Event OnOptionSelect(int option)
    
    if option == optionWidget
        optionWidgetToggle = !optionWidgetToggle
        SetToggleOptionValue(optionWidget, optionWidgetToggle)
        QuestManager.InnerWidget.Visible = !QuestManager.InnerWidget.Visible
    endif

EndEvent

Event OnOptionSliderOpen(int option)

    if option == sliderWidgetScale
        SetSliderDialogStartValue(QuestManager.InnerWidget.Scale)
        SetSliderDialogDefaultValue(QuestManager.InnerWidget.DefaultScale)
        SetSliderDialogRange(0.1, 200.0)
        SetSliderDialogInterval(0.1)
    endif

    if option == sliderUpdateRate
        SetSliderDialogStartValue(QuestManager.UpdateRate)
        SetSliderDialogDefaultValue(QuestManager.DefaultUpdateRate)
        SetSliderDialogRange(0.1, 10.0)
        SetSliderDialogInterval(0.1)
    endif

    if option == sliderWidgetPosHealthY
        SetSliderDialogStartValue(QuestManager.InnerWidget.PosHealthY)
        SetSliderDialogDefaultValue(QuestManager.InnerWidget.DefaultPosHealthY)
        SetSliderDialogRange(0.0, 1080.0)
        SetSliderDialogInterval(0.5)
    endif

    if option == sliderWidgetPosHealthX
        SetSliderDialogStartValue(QuestManager.InnerWidget.PosHealthX)
        SetSliderDialogDefaultValue(QuestManager.InnerWidget.DefaultPosHealthX)
        SetSliderDialogRange(0.0, 1920.0)
        SetSliderDialogInterval(0.5)
    endif

    if option == sliderWidgetPosMagickaY
        SetSliderDialogStartValue(QuestManager.InnerWidget.PosMagickaY)
        SetSliderDialogDefaultValue(QuestManager.InnerWidget.DefaultPosMagickaY)
        SetSliderDialogRange(0.0, 1080.0)
        SetSliderDialogInterval(0.5)
    endif

    if option == sliderWidgetPosMagickaX
        SetSliderDialogStartValue(QuestManager.InnerWidget.PosMagickaX)
        SetSliderDialogDefaultValue(QuestManager.InnerWidget.DefaultPosMagickaX)
        SetSliderDialogRange(0.0, 1920.0)
        SetSliderDialogInterval(0.5)
    endif

    if option == sliderWidgetPosStaminaY
        SetSliderDialogStartValue(QuestManager.InnerWidget.PosStaminaY)
        SetSliderDialogDefaultValue(QuestManager.InnerWidget.DefaultPosStaminaY)
        SetSliderDialogRange(0.0, 1080.0)
        SetSliderDialogInterval(0.5)
    endif

    if option == sliderWidgetPosStaminaX
        SetSliderDialogStartValue(QuestManager.InnerWidget.PosStaminaX)
        SetSliderDialogDefaultValue(QuestManager.InnerWidget.DefaultPosStaminaX)
        SetSliderDialogRange(0.0, 1920.0)
        SetSliderDialogInterval(0.5)
    endif

EndEvent

Event OnOptionSliderAccept(int option, float value)

    if option == sliderWidgetScale
        QuestManager.InnerWidget.Scale = value
        SetSliderOptionValue(option, value)
    endif

    if option == sliderUpdateRate
        QuestManager.UpdateRate = value
        SetSliderOptionValue(option, value)
    endif

    if option == sliderWidgetPosHealthY
        QuestManager.InnerWidget.PosHealthY = value
        SetSliderOptionValue(option, value)
    endif

    if option == sliderWidgetPosHealthX
        QuestManager.InnerWidget.PosHealthX = value
        SetSliderOptionValue(option, value)
    endif

    if option == sliderWidgetPosStaminaY
        QuestManager.InnerWidget.PosStaminaY = value
        SetSliderOptionValue(option, value)
    endif

    if option == sliderWidgetPosStaminaX
        QuestManager.InnerWidget.PosStaminaX = value
        SetSliderOptionValue(option, value)
    endif

    if option == sliderWidgetPosMagickaY
        QuestManager.InnerWidget.PosMagickaY = value
        SetSliderOptionValue(option, value)
    endif

    if option == sliderWidgetPosMagickaX
        QuestManager.InnerWidget.PosMagickaX = value
        SetSliderOptionValue(option, value)
    endif


EndEvent