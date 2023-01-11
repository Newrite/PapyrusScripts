;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname MRL_ALCH_PerkControll Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
int button = AlchMessage.Show()
if button == 0

    Form[] items = akActor.GetContainerForms()

    int index = 0
    int size = items.Length
    int count = 0
    int itemCount = 0
    int indexFlst = 0
    int sizeFlst = Keywords.GetSize()
    int value = 0

    While index < size

        Ingredient i = items[index] as Ingredient

        if i

            itemCount = akActor.GetItemCount(i)
            akActor.RemoveItem(i, itemCount, true)

            value = i.GetGoldValue() / 10

            if value < 1
                value = 1
            endif

            itemCount = value * itemCount

            ;Debug.Notification(i.GetName() + " Cost " + i.GetGoldValue() + " CountAdd " + itemCount)

            indexFlst = 0

            while indexFlst < sizeFlst

                if i.HasKeyword(Keywords.GetAt(indexFlst) as Keyword)
                    akActor.AddItem(Essentials.GetAt(indexFlst), itemCount, true)
                endif

                indexFlst = indexFlst + 1

            endWhile

            count = count + itemCount

        endif

        index = index + 1

    EndWhile

    Debug.Notification("Получено " + count + " эссенций.")

elseif button == 1
    akTargetRef.Activate(Game.GetPlayer())
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Message Property AlchMessage Auto

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