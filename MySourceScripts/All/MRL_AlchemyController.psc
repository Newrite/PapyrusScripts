Scriptname MRL_AlchemyController extends ActiveMagicEffect

; Poison 0
; Magick 1
; Elemental 2
; Invisible 3
; Physic 4
; Stamina 5
; Resist 6
; Mastery 7

FormList Property Keywords Auto
FormList Property Essentials Auto

Perk Property Synderion Auto

Actor Alchemist

Event OnEffectStart(Actor akTarget, Actor akCaster) 
    Alchemist = akTarget
EndEvent

Event OnSpellCast(Form akSpell)



    Ingredient ingr = akSpell as Ingredient 

    if ingr

        ;Debug.Notification("Ingr: " + ingr.GetName())

        Form[] items = Game.GetPlayer().GetContainerForms()

        int index = 0
        int size = items.Length
        int count = 0

        While index < size
            Ingredient i = items[index] as Ingredient
            if i
                count = count + 1
            endif
            index = index + 1
        EndWhile

        Debug.Notification("Count of ingrs: " + count)

        size = Keywords.GetSize()
        index = 0

        int addItems = ingr.GetGoldValue() / 10
        if addItems < 1
            addItems = 1
        endif
        if  Alchemist.HasPerk(Synderion)
            addItems = addItems * 5
        endif

        while index < size

            if ingr.HasKeyword(Keywords.GetAt(index) as Keyword)
                ;Debug.Notification("FoundKeyword")
                Alchemist.AddItem(Essentials.GetAt(index), addItems)
            endif

            index = index + 1

        endWhile

    endif

EndEvent