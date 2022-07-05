Scriptname MRL_LearnEnchsFromList extends ActiveMagicEffect
{Этот скрипт автоматически добавляет игроку знание зачарований из форм листа, содержит проверки на то, знает ли игрок уже это зачарование и является ли объект в форм листе зачарованием. Способность с этим эффектом автоматически диспелится в конце работы.}

FormList Property enchList Auto
Spell Property spellToRemove Auto

Function AddFromList(Actor akTarget)
    int index = enchList.GetSize()
    While index
        index -= 1
        Enchantment ench = enchList.GetAt(index) as Enchantment
        if ench
            if !ench.PlayerKnows()
                ench.SetPlayerKnows(true)
            endIf
        endIf
    EndWhile   
EndFunction

Function RemoveFromList(Actor akTarget)
   int index = enchList.GetSize()
    While index
        index -= 1
        Enchantment ench = enchList.GetAt(index) as Enchantment
        if ench
            if  ench.PlayerKnows()
                ench.SetPlayerKnows(false)
            endIf
        endIf
    EndWhile     
EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
    RemoveFromList(akTarget)
    Utility.Wait(1.0)
    AddFromList(akTarget)
    Utility.Wait(1.0)
    akTarget.RemoveSpell(spellToRemove)
EndEvent

