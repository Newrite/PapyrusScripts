Scriptname ReflyFixesHandler extends ReferenceAlias  

Perk Property AlterationAdept Auto
Perk Property AlterationExpert Auto
Perk Property AlterationMaster Auto

Perk Property DestructionAdept Auto
Perk Property DestructionExpert Auto
Perk Property DestructionMaster Auto

Perk Property RestorationAdept Auto
Perk Property RestorationExpert Auto
Perk Property RestorationMaster Auto

Perk Property ConjurationAdept Auto
Perk Property ConjurationExpert auto
Perk Property ConjurationMaster auto

Perk Property IllusionAdept auto
Perk Property IllusionExpert auto
Perk Property IllusionMaster auto

GlobalVariable Property PCAlterationAdept  Auto  
GlobalVariable Property PCAlterationExpert  Auto  
GlobalVariable Property PCAlterationMaster  Auto  

GlobalVariable Property PCConjurationAdept  Auto  
GlobalVariable Property PCConjurationExpert  Auto  
GlobalVariable Property PCConjurationMaster  Auto  

GlobalVariable Property PCDestructionAdept  Auto  
GlobalVariable Property PCDestructionExpert  Auto  
GlobalVariable Property PCDestructionMaster  Auto  

GlobalVariable Property PCIllusionAdept  Auto  
GlobalVariable Property PCIllusionExpert  Auto  
GlobalVariable Property PCIllusionMaster  Auto  

GlobalVariable Property PCRestorationAdept  Auto  
GlobalVariable Property PCRestorationExpert  Auto  
GlobalVariable Property PCRestorationMaster  Auto  

GlobalVariable Property PlayerIsVampire  Auto
GlobalVariable Property SibillaQuestComplite  Auto

Keyword Property VampireKeyword Auto

Perk Property MerchantPerk Auto

Spell Property HandlerAlterationMasterQuest Auto
Spell Property HandlerIllusionMasterQuest Auto
Spell Property HandlerRestorationMasterQuest Auto
Spell Property HandlerDestructionMasterQuest Auto
Spell Property HandlerConjurationMasterQuest Auto

;Квест Сибиллы
Quest Property Favor109 Auto

Actor Player

Event OnInit()
	Utility.Wait(5.0)
    Player = Game.GetPlayer()

    RegisterForMenu("StatsMenu")

    ;Добавляем спелы обработчики на выполнение мастер квестов школл магии
    Player.AddSpell(HandlerAlterationMasterQuest, false)
    Player.AddSpell(HandlerIllusionMasterQuest, false)
    Player.AddSpell(HandlerRestorationMasterQuest, false)
    Player.AddSpell(HandlerDestructionMasterQuest, false)
    Player.AddSpell(HandlerConjurationMasterQuest, false)
EndEvent

Event OnMenuOpen(string menuName)
    if menuName == "StatsMenu"
        vampireCheck()
    endif
EndEvent

Event OnMenuClose(string menuName)
    If menuName == "StatsMenu"
        spellPerkCheck()
    endif
EndEvent

;Проверяется является ли игрок вампиров и выполнен ли квест Сибиллы на уничтожение вампира. Нужно для лвл листов торговцев.
Function vampireCheck()
    If Player.HasKeyword(VampireKeyword)
        PlayerIsVampire.SetValueInt(0)
    Else
        PlayerIsVampire.SetValueInt(100)
    endif
    If Favor109.GetStage() >= 20
        SibillaQuestComplite.SetValueInt(0)
    EndIf
EndFunction

;Переписанный хендлер на продажу заклинаний, теперь новые заклинания появляются в продаже когда взят перк, а не достигнуто нужное количество навыка.
Function spellPerkCheck()
    if Player.HasPerk(AlterationAdept)
        PCAlterationAdept.SetValue(0)
    endif
    if Player.HasPerk(AlterationExpert)
        PCAlterationExpert.SetValue(0)
    endif
    if Player.HasPerk(AlterationMaster)
        PCAlterationMaster.SetValue(0)
    endif
    if Player.HasPerk(DestructionAdept)
        PCDestructionAdept.SetValue(0)
    endif
    if Player.HasPerk(DestructionExpert)
        PCDestructionExpert.SetValue(0)
    endif
    if Player.HasPerk(DestructionMaster)
        PCDestructionMaster.SetValue(0)
    endif
    if Player.HasPerk(IllusionAdept)
        PCIllusionAdept.SetValue(0)
    endif
    if Player.HasPerk(IllusionExpert)
        PCIllusionExpert.SetValue(0)
    endif
    if Player.HasPerk(IllusionMaster)
        PCIllusionMaster.SetValue(0)
    endif
    if Player.HasPerk(RestorationAdept)
        PCRestorationAdept.SetValue(0)
    endif
    if Player.HasPerk(RestorationExpert)
        PCRestorationExpert.SetValue(0)
    endif
    if Player.HasPerk(RestorationMaster)
        PCRestorationMaster.SetValue(0)
    endif
    if Player.HasPerk(ConjurationAdept)
        PCConjurationAdept.SetValue(0)
    endif
    if Player.HasPerk(ConjurationExpert)
        PCConjurationExpert.SetValue(0)
    endif
    if Player.HasPerk(ConjurationMaster)
        PCConjurationMaster.SetValue(0)
    endif
EndFunction