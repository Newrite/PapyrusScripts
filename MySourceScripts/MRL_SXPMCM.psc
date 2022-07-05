Scriptname MRL_SXPMCM extends SKI_ConfigBase  

MRL_SXPMainController Property ExpQuest Auto
MRL_SXPWidget Property Widget Auto

int[] SkillsSlider
ActorValueInfo[] SkillsAVI

bool IsInitSkillsSlider = false
bool IsInitSkillsAVI = false

int sliderXpMult = 0
int sliderActorXpMult = 0
int sliderQuestXpMult = 0
int sliderXpForMainQuest = 0
int sliederXpForDaedraQuest = 0

int sliderWidgetPosX = 0
int sliderWidgetPosY = 0
int sliderWidgetScale = 0

int optionWidget = 0
bool optionWidgetToggle = true 

Function InitSkillsAVI()

    if !IsInitSkillsAVI
        SkillsAVI = new ActorValueInfo[18]
    endif

    string[] stats = ExpQuest.GetStatsArray()

    int index = stats.Length - 1
    while index >= 0
        SkillsAVI[index] = ActorValueInfo.GetActorValueInfobyName(stats[index])
        index = index - 1
    endwhile

    IsInitSkillsAVI = true

EndFunction

Function InitSkillsSlider(int currentXP)

    if !IsInitSkillsSlider
        SkillsSlider = new int[18]
    endif
 
    int index = SkillsSlider.Length - 1
    while index >= 0
        int skillLevel = SkillsAVI[index].GetBaseValue(Game.GetPlayer()) as Int
        float skillSale = ExpQuest.GetSkillSale(index)
        string skillSaleString = "[0%]"
        if skillSale > 0.0
            skillSaleString = "[-" + skillSale as int + "%]"
        elseif skillSale < 0.0
            skillSaleString = "[+" + Math.abs(skillSale) as int + "%]"
        endif
        int nextXp = ExpQuest.GetNextXP(skillLevel, skillSale)
        if skillLevel >= 100 || nextXp > currentXP
            SkillsSlider[index] = AddTextOption(SkillsAVI[index].GetName(), skillLevel as string, OPTION_FLAG_DISABLED)
        else
            SkillsSlider[index] = AddSliderOption(SkillsAVI[index].GetName(), skillLevel)
        endif
        string skillString = "    " + skillLevel as string + "->" + (skillLevel + 1) as string + " [" + nextXp as string + " XP]"
        skillString = skillString + skillSaleString
        AddTextOption( "Max: " + ExpQuest.CanPurchaseSkills(index, skillSale) + skillString, currentXP as string + " XP", OPTION_FLAG_DISABLED)
        index = index - 1
    endwhile

    IsInitSkillsSlider = true

EndFunction

Event OnPageReset(string page)
    SetCursorFillMode(LEFT_TO_RIGHT)
    int currentXP = ExpQuest.GetXp() as Int
    AddHeaderOption("Widget")
    AddHeaderOption("Current XP: " + currentXP as string)
    optionWidget = AddToggleOption("Enable\\disable widget", optionWidgetToggle)
    sliderWidgetScale = AddSliderOption("Widget scale", Widget.Scale, "{1}")
    sliderWidgetPosX = AddSliderOption("Widget position X", Widget.PosX, "{1}")
    sliderWidgetPosY = AddSliderOption("Widget position Y", Widget.PosY, "{1}")
    AddHeaderOption("RfaD - Experience")
    sliderXpMult = AddSliderOption("General XP Mult", ExpQuest.GeneralXPMult, "{1}")
    sliderActorXpMult = AddSliderOption("Kill Actors XP Mult", ExpQuest.ActorXPMult, "{1}")
    sliderQuestXpMult = AddSliderOption("Quest XP Mult", ExpQuest.QuestXPMult, "{1}")
    sliderXpForMainQuest = AddSliderOption("XP For Main Quest", ExpQuest.MainQuestExp)
    sliederXpForDaedraQuest = AddSliderOption("XP For Daedra Quest", ExpQuest.DaedraQuestExp)
    AddHeaderOption("Purchase skills")
    AddHeaderOption("Current XP: " + currentXP as string)
    InitSkillsAVI()
    InitSkillsSlider(currentXP)
EndEvent

Event OnOptionSelect(int option)
    
    if option == optionWidget
        optionWidgetToggle = !optionWidgetToggle
        SetToggleOptionValue(optionWidget, optionWidgetToggle)
        Widget.Visible = !Widget.Visible
        Widget.Render()
    endif

EndEvent

Event OnOptionSliderOpen(int option)

    if option == sliderWidgetPosY
        SetSliderDialogStartValue(Widget.PosY)
        SetSliderDialogDefaultValue(Widget.DefaultPosY)
        SetSliderDialogRange(0.0, 1080.0)
        SetSliderDialogInterval(0.5)
    endif

    if option == sliderWidgetPosX
        SetSliderDialogStartValue(Widget.PosX)
        SetSliderDialogDefaultValue(Widget.DefaultPosX)
        SetSliderDialogRange(0.0, 1920.0)
        SetSliderDialogInterval(0.5)
    endif

    if option == sliderWidgetScale
        SetSliderDialogStartValue(Widget.Scale)
        SetSliderDialogDefaultValue(Widget.DefaultScale)
        SetSliderDialogRange(0.1, 100.0)
        SetSliderDialogInterval(0.1)
    endif

    if option == sliderXpMult
        SetSliderDialogStartValue(ExpQuest.GeneralXPMult)
        SetSliderDialogDefaultValue(1.0)
        SetSliderDialogRange(0.1, 100.0)
        SetSliderDialogInterval(0.1)
    endif

    if option == sliderActorXpMult
        SetSliderDialogStartValue(ExpQuest.ActorXPMult)
        SetSliderDialogDefaultValue(1.0)
        SetSliderDialogRange(0.1, 100.0)
        SetSliderDialogInterval(0.1)
    endif

    if option == sliderQuestXpMult
        SetSliderDialogStartValue(ExpQuest.QuestXPMult)
        SetSliderDialogDefaultValue(1.0)
        SetSliderDialogRange(0.1, 100.0)
        SetSliderDialogInterval(0.1)
    endif

    if option == sliderXpForMainQuest
        SetSliderDialogStartValue(ExpQuest.MainQuestExp)
        SetSliderDialogDefaultValue(30000.0)
        SetSliderDialogRange(1.0, 1000000.0)
        SetSliderDialogInterval(1.0)
    endif

    if option == sliederXpForDaedraQuest
        SetSliderDialogStartValue(ExpQuest.DaedraQuestExp)
        SetSliderDialogDefaultValue(60000.0)
        SetSliderDialogRange(1.0, 1000000.0)
        SetSliderDialogInterval(1.0)
    endif

    int index = SkillsSlider.Length - 1
    while index >= 0
        if SkillsSlider[index] == option
            float skillSale = ExpQuest.GetSkillSale(index)
            SetSliderDialogStartValue(0)
            SetSliderDialogDefaultValue(0.0)
            SetSliderDialogRange(0.0, ExpQuest.CanPurchaseSkills(index, skillSale))
            SetSliderDialogInterval(1.0)
        endif
        index = index - 1
    endwhile

EndEvent

Event OnOptionHighlight(int option)
    int index = SkillsSlider.Length - 1
    while index >= 0
        if SkillsSlider[index] == option
            SetInfoText(SkillsAVI[index].GetName())
        endif
        index = index - 1
    endwhile
EndEvent

Event OnOptionSliderAccept(int option, float value)

    if option == sliderWidgetPosY
        Widget.PosY = value
        SetSliderOptionValue(option, value)
        Widget.Render()
    endif

    if option == sliderWidgetPosX
        Widget.PosX = value
        SetSliderOptionValue(option, value)
        Widget.Render()
    endif

    if option == sliderWidgetScale
        Widget.Scale = value
        SetSliderOptionValue(option, value)
        Widget.Render()
    endif

    if option == sliderXpMult
        ExpQuest.GeneralXPMult = value
        SetSliderOptionValue(option, value)
    endif

    if option == sliderActorXpMult
        ExpQuest.ActorXPMult = value
        SetSliderOptionValue(option, value)
    endif

    if option == sliderQuestXpMult
        ExpQuest.ActorXPMult = value
        SetSliderOptionValue(option, value)
    endif

    if option == sliderXpForMainQuest
        ExpQuest.MainQuestExp = value as Int
        SetSliderOptionValue(option, value)
    endif

    if option == sliederXpForDaedraQuest
        ExpQuest.DaedraQuestExp = value as Int
        SetSliderOptionValue(option, value)
    endif
    
    int index = SkillsSlider.Length - 1
    while index >= 0
        if SkillsSlider[index] == option
            float skillSale = ExpQuest.GetSkillSale(index)
            ExpQuest.PurchaseSkill(index, value as Int, skillSale)
            ForcePageReset()
        endif
        index = index - 1
    endwhile

EndEvent