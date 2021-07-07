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
GlobalVariable Property HasMerchantPerk Auto  

Keyword Property VampireKeyword Auto
Keyword Property VampireWeaponKW Auto
Keyword Property DisallowEnchanting Auto
Keyword Property VampireEnchKW Auto

FormList Property VampireWeaponFormList Auto

Perk Property MerchantPerk Auto

Actor Property Malborn01 Auto
Actor Property Malborn02 Auto

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

    ;Пробуем на старте игры выдать белый стат переносимого веса
    Malborn01.SetActorValue("CarryWeight", 300.0)
    Malborn02.SetActorValue("CarryWeight", 300.0)

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
        merchantPerkCheck()
    endif
EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
    Weapon weap = akBaseObject as Weapon
    if weap

        ;Проверяется имеется ли у оружия кейворд вампирского, оружию с таким кейвордом не надо находиться в лисе. Если кейворда нет, проверяется есть ли оружие уже  листе и есть ли нужный чант на оружии, если чант есть и нет в листе - добавляет в лист.
        if !weap.HasKeyword(VampireWeaponKW)
            if !findWeaponInList(weap) && findVampireEnchantment(weap)
                VampireWeaponFormList.AddForm(weap)
            endif
        endif
    endif
EndEvent

;Проверяет находится ли оружие в заданном листе
bool Function findWeaponInList(Weapon weap)
    int index = VampireWeaponFormList.GetSize()
    While index
        index -= 1
        Weapon vw = VampireWeaponFormList.GetAt(index) as Weapon
        if vw == weap
            return true
        endIf
    EndWhile
    return false
EndFunction

;Проверяет есть ли вампирская чарка на оружии и это оружие не имеет кейворда на невозможности разбирания на столе зачарования
bool Function findVampireEnchantment(Weapon weap)
    Enchantment ench = weap.GetEnchantment()
    if ench
        if ench.HasKeyword(VampireEnchKW) && !ench.HasKeyword(DisallowEnchanting)
            return true
        endif
    endif
    return false
EndFunction

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

;Проверяется наличие перка купца, для лвл листов торговцев.
Function merchantPerkCheck()
    If Player.HasPerk(MerchantPerk)
        HasMerchantPerk.SetValueInt(0)
    else
        HasMerchantPerk.SetValueInt(100)
    endif
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