ScriptName MRL_ALCH_Swaps extends activemagiceffect

FormList Property KeywordsOfPotions Auto
FormList Property Potions Auto

Actor Alchemist

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Alchemist = akTarget
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    Potion a = akBaseItem as Potion
    if a
        int index = 0
        int size = KeywordsOfPotions.GetSize()
        while index < size
            if a.HasKeyword(KeywordsOfPotions.GetAt(index) as Keyword)
                Alchemist.RemoveItem(a, aiItemCount, true)
                Alchemist.Additem(Potions.GetAt(index), aiItemCount, true)
            endif
            index = index + 1
        endWhile
    endif
EndEvent