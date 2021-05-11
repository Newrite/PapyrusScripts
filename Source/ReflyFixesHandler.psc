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
GlobalVariable Property HasMerchantPerk Auto  

Keyword Property VampireKeyword Auto
Keyword Property VampireWeaponKW Auto
Keyword Property DisallowEnchanting Auto
Keyword Property VampireEnchKW Auto

FormList Property VampireWeaponFormList Auto

Perk Property MerchantPerk Auto

Actor Player

Event OnInit()
	Utility.Wait(5.0)
    Player = Game.GetPlayer()
    RegisterForMenu("StatsMenu")
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
        if !weap.HasKeyword(VampireWeaponKW)
            if !findWeaponInList(weap) && findVampireEnchantment(weap)
                VampireWeaponFormList.AddForm(weap)
            endif
        endif
    endif
EndEvent

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

bool Function findVampireEnchantment(Weapon weap)
    Enchantment ench = weap.GetEnchantment()
    if ench
        if ench.HasKeyword(VampireEnchKW) && !ench.HasKeyword(DisallowEnchanting)
            return true
        endif
    endif
    return false
EndFunction

Function vampireCheck()
    If Player.HasKeyword(VampireKeyword)
        PlayerIsVampire.SetValueInt(0)
    Else
        PlayerIsVampire.SetValueInt(100)
    endif
EndFunction

Function merchantPerkCheck()
    If Player.HasPerk(MerchantPerk)
        HasMerchantPerk.SetValueInt(0)
    else
        HasMerchantPerk.SetValueInt(100)
    endif
EndFunction

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