Scriptname MRL_SXPMCM extends SKI_ConfigBase  

MRL_SXPMainController Property ExpQuest Auto
MRL_SXPWidget Property Widget Auto

int[] SkillsSlider

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

Function InitSkillsSlider(int[] indexes)

    ActorValueInfo[] SkillsAVI = ExpQuest.GetSkillsAVI()

    Actor player = Game.GetPlayer()
 
    int index = indexes.Length - 1
    while index >= 0
        int skillLevel = SkillsAVI[indexes[index]].GetBaseValue(player) as Int
        float skillSale = ExpQuest.GetSkillSale(indexes[index])
        string skillSaleString = "[0%]"
        if skillSale > 0.0
            skillSaleString = "[-" + skillSale as int + "%]"
        elseif skillSale < 0.0
            skillSaleString = "[+" + Math.abs(skillSale) as int + "%]"
        endif
        int nextXp = ExpQuest.GetNextXP(skillLevel, skillSale)
        if skillLevel >= 100 || nextXp > ExpQuest.GetXP()
            SkillsSlider[indexes[index]] = AddTextOption(SkillsAVI[indexes[index]].GetName(), skillLevel as string, OPTION_FLAG_DISABLED)
        else
            SkillsSlider[indexes[index]] = AddSliderOption(SkillsAVI[indexes[index]].GetName(), skillLevel)
        endif
        string skillString = "    " + skillLevel as string + "->" + (skillLevel + 1) as string + " [" + nextXp as string + " XP]"
        skillString = skillString + skillSaleString
        AddTextOption( "Max: " + ExpQuest.CanPurchaseSkills(indexes[index], skillSale) + skillString, "", OPTION_FLAG_DISABLED)
        index = index - 1
    endwhile

EndFunction

Event OnConfigInit()
    SkillsSlider = new int[18]
EndEvent

Event OnPageReset(string page)
    SetCursorFillMode(LEFT_TO_RIGHT)
    int currentXP = ExpQuest.GetXp() as Int
    if page == "Widget"
        AddHeaderOption("Widget")
        AddHeaderOption("RfaD - Experience")
        optionWidget = AddToggleOption("Enable\\disable widget", optionWidgetToggle)
        sliderActorXpMult = AddSliderOption("Kill Actors XP Mult", ExpQuest.ActorXPMult, "{1}")
        sliderWidgetPosX = AddSliderOption("Widget position X", Widget.PosX, "{1}")
        sliderQuestXpMult = AddSliderOption("Quest XP Mult", ExpQuest.QuestXPMult, "{1}")
        sliderWidgetPosY = AddSliderOption("Widget position Y", Widget.PosY, "{1}")
        sliderXpMult = AddSliderOption("General XP Mult", ExpQuest.GeneralXPMult, "{1}")
        sliderWidgetScale = AddSliderOption("Widget scale", Widget.Scale, "{1}")
        sliderXpForMainQuest = AddSliderOption("XP For Main Quest", ExpQuest.MainQuestExp)
        AddTextOption("Character level", Game.GetPlayer().GetLevel() as String, OPTION_FLAG_DISABLED)
        sliederXpForDaedraQuest = AddSliderOption("XP For Daedra Quest", ExpQuest.DaedraQuestExp)
    elseif page == "Warrior"
        AddHeaderOption("Purchase skills")
        AddHeaderOption("Current XP: " + currentXP as string)
        InitSkillsSlider(ExpQuest.WarriorIndexes())
    elseif page == "Mage"
        AddHeaderOption("Purchase skills")
        AddHeaderOption("Current XP: " + currentXP as string)
        InitSkillsSlider(ExpQuest.MageIndexes())
    elseif page == "Thief"
        AddHeaderOption("Purchase skills")
        AddHeaderOption("Current XP: " + currentXP as string)
        InitSkillsSlider(ExpQuest.ThiefIndexes())
    endif
EndEvent

Event OnOptionSelect(int option)
    
    if option == optionWidget
        optionWidgetToggle = !optionWidgetToggle
        SetToggleOptionValue(optionWidget, optionWidgetToggle)
        Widget.Visible = !Widget.Visible
        Widget.Render()
    endif

EndEvent

Function SliderOpenFunc(int[] indexes, int option)
    int index = indexes.Length - 1
    while index >= 0
        if SkillsSlider[indexes[index]] == option
            float skillSale = ExpQuest.GetSkillSale(indexes[index])
            SetSliderDialogStartValue(0)
            SetSliderDialogDefaultValue(0.0)
            SetSliderDialogRange(0.0, ExpQuest.CanPurchaseSkills(indexes[index], skillSale))
            SetSliderDialogInterval(1.0)
        endif
        index = index - 1
    endwhile
EndFunction

Event OnOptionSliderOpen(int option)

    if CurrentPage == "Widget"

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

    elseif CurrentPage == "Warrior"
        SliderOpenFunc(ExpQuest.WarriorIndexes(), option)
    elseif CurrentPage == "Mage"
        SliderOpenFunc(ExpQuest.MageIndexes(), option)
    elseif CurrentPage == "Thief"
        SliderOpenFunc(ExpQuest.ThiefIndexes(), option)
    endif

EndEvent

Function SliderAcceptFunc(int[] indexes, int option, float value)
    int index = indexes.Length - 1
    while index >= 0
        if SkillsSlider[indexes[index]] == option
            float skillSale = ExpQuest.GetSkillSale(indexes[index])
            ExpQuest.PurchaseSkill(indexes[index], value as Int, skillSale)
            ForcePageReset()
            return
        endif
        index = index - 1
    endwhile
EndFunction

Event OnOptionSliderAccept(int option, float value)

    if CurrentPage == "Widget"

        if option == sliderWidgetPosY
            Widget.PosY = value
            SetSliderOptionValue(option, value)
            Widget.Render()
            return
        endif

        if option == sliderWidgetPosX
            Widget.PosX = value
            SetSliderOptionValue(option, value)
            Widget.Render()
            return
        endif

        if option == sliderWidgetScale
            Widget.Scale = value
            SetSliderOptionValue(option, value)
            Widget.Render()
            return
        endif

        if option == sliderXpMult
            ExpQuest.GeneralXPMult = value
            SetSliderOptionValue(option, value)
            return
        endif

        if option == sliderActorXpMult
            ExpQuest.ActorXPMult = value
            SetSliderOptionValue(option, value)
            return
        endif

        if option == sliderQuestXpMult
            ExpQuest.ActorXPMult = value
            SetSliderOptionValue(option, value)
            return
        endif

        if option == sliderXpForMainQuest
            ExpQuest.MainQuestExp = value as Int
            SetSliderOptionValue(option, value)
            return
        endif

        if option == sliederXpForDaedraQuest
            ExpQuest.DaedraQuestExp = value as Int
            SetSliderOptionValue(option, value)
            return
        endif
    
    elseif CurrentPage == "Warrior"
        SliderAcceptFunc(ExpQuest.WarriorIndexes(), option, value)
    elseif CurrentPage == "Mage"
        SliderAcceptFunc(ExpQuest.MageIndexes(), option, value)
    elseif CurrentPage == "Thief"
        SliderAcceptFunc(ExpQuest.ThiefIndexes(), option, value)
    endif

EndEvent