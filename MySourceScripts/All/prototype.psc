Scriptname prototype extends  Quest Conditional
{The documentation string.}

FormList Property emptyList Auto
FormList Property enchantingPerksList Auto
FormList Property smithingPerksList Auto
FormList Property smithingPerksListToAddNPC Auto

Perk Property enchantingNPCPower Auto

string sEnchanting = "enchanting"
string sSmithing = "smithing"
bool bAddPerks = true
bool bRemovePerks = false

; sActorValue - Нужно отдвать имя с глобального пространства (sEnchanting или sSmithing)
; currentMod - два режима, true - выдает перки, false - забирает перки
Function getterSetterPerks(string sActorValue, bool currentMod)
    if sActorValue == sSmithing
        if currentMod

            int index = smithingPerksListToAddNPC.GetSize()
            While index
                Perk currentPerk = smithingPerksListToAddNPC.GetAt(index) as Perk
                if currentPerk
                    if !Game.GetPlayer().HasPerk(currentPerk)
                        Game.GetPlayer().AddPerk(currentPerk)
                    endif
                endif
                index = index - 1
            EndWhile

        else

            int index = smithingPerksListToAddNPC.GetSize()
            While index
                Perk currentPerk = smithingPerksListToAddNPC.GetAt(index) as Perk
                if currentPerk
                    if Game.GetPlayer().HasPerk(currentPerk)
                        Game.GetPlayer().RemovePerk(currentPerk)
                    endif
                endif
                index = index - 1
            EndWhile

        endif
    endif
    if sActorValue == sEnchanting
        if currentMod
            if !Game.GetPlayer().HasPerk(enchantingNPCPower)
                Game.GetPlayer().AddPerk(enchantingNPCPower)
            endif
        else
            if Game.GetPlayer().HasPerk(enchantingNPCPower)
                Game.GetPlayer().RemovePerk(enchantingNPCPower)
            endif
        endif
    endif
EndFunction

Function trueFillList(FormList list)
    int indLs = list.GetSize()
    while indLs
        Perk currentPerk = list.GetAt(indLs) as Perk
        if currentPerk
            if Game.GetPlayer().HasPerk(currentPerk)
                emptyList.AddForm(currentPerk as Form)
                Game.GetPlayer().RemovePerk(currentPerk)
            endif
        endif
        indLs = indLs - 1
    endwhile
EndFunction

; sActorValue - Нужно отдвать имя с глобального пространства (sEnchanting или sSmithing)
Function fillEmptyListAndRemovePerks(string sActorValue)

    if sActorValue == sEnchanting
        trueFillList(enchantingPerksList)
    endif
    if sActorValue == sSmithing
        trueFillList(smithingPerksList)
    endif

EndFunction

;Очищает лист в котором хранятся перки игрока, перед этим добавляет игроку перки заново
Function revertEmptyListAndAddPerks()
    int indLs = emptyList.GetSize()
    while indLs
        Perk currentPerk = emptyList.GetAt(indLs) as Perk
        if currentPerk
            if !Game.GetPlayer().HasPerk(currentPerk)
                Game.GetPlayer().AddPerk(currentPerk)
            endif
        endif
        indLs = indLs - 1
    endwhile
    emptyList.Revert()
EndFunction

float HH_Skill_level_smith
float HH_Skill_level_ench

Function HH_addPerks ()	

	If (crafting_service != ENCHANT_SERVICE)

	    crafting_discipline = sSmithing
	    HH_Skill_level_smith = Game.GetPlayer().GetActorValue(crafting_discipline)
        ;заполняем пустой лист перками игрока, и удаляем перки что у него есть
        fillEmptyListAndRemovePerks(crafting_discipline)
	    ;Теперь добавляем всё что нужно
	    Game.GetPlayer().SetActorValue(crafting_discipline, 65)
        getterSetterPerks(crafting_discipline, bAddPerks)

	Else

		crafting_discipline = sEnchanting
		HH_Skill_level_ench = player.GetActorValue(crafting_discipline)
        ;заполняем пустой лист перками игрока, и удаляем перки что у него есть
        fillEmptyListAndRemovePerks(crafting_discipline)
	    ;Теперь добавляем всё что нужно
	    Game.GetPlayer().SetActorValue(crafting_discipline, 65)
        getterSetterPerks(crafting_discipline, bAddPerks)

	EndIf

EndFunction

Function HH_removePerks ()	

    If (crafting_service != ENCHANT_SERVICE)

	    crafting_discipline = sSmithing
        getterSetterPerks(crafting_discipline, bRemovePerks)
	    Game.GetPlayer().SetActorValue(crafting_discipline, HH_Skill_level_smith)
        revertEmptyListAndAddPerks()

	Else

	    crafting_discipline = sEnchanting
        getterSetterPerks(crafting_discipline, bRemovePerks)
	    Game.GetPlayer().SetActorValue(crafting_discipline, HH_Skill_level_ench)
        revertEmptyListAndAddPerks()

	EndIf

EndFunction