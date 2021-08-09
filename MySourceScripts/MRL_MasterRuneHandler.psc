Scriptname MRL_MasterRuneHandler extends ActiveMagicEffect
{Скрипт обрабатывает перк мастера рун выдавая автоматический второй тир рун. Формлисты спелов должны маппиться один в один}

Spell Property HandlerSpell Auto

Formlist Property ListOfT1Rune Auto
Formlist Property ListOfT2Rune Auto

Actor PerkOwner

Function MainHandler()

    int T1Index = ListOfT1Rune.GetSize()
    int T2Index = ListOfT2Rune.GetSize()


    While T1Index

        T1Index -= 1
        Spell T1Rune = ListOfT1Rune.GetAt(T1Index) as Spell

        If T1Rune
            
            if PerkOwner.HasSpell(T1Rune) && T1Index < T2Index

                Spell T2Rune = ListOfT2Rune.GetAt(T1Index) as Spell

                if T2Rune
                    PerkOwner.AddSpell(T2Rune)
                endif

            endif

        EndIf

    EndWhile

EndFunction

Bool Function KnowsAllT2Runes()

    int T2Index = ListOfT2Rune.GetSize()


    While T2Index

        T2Index -= 1
        Spell T1Rune = ListOfT1Rune.GetAt(T2Index) as Spell

        If T1Rune
            
            if !PerkOwner.HasSpell(T1Rune)
                return false
            endif

        EndIf

    EndWhile

    return true

EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)

    RegisterForMenu("StatsMenu")
    PerkOwner = akCaster

EndEvent

Event OnMenuClose(string menuName)

    If menuName == "StatsMenu"
        MainHandler()

        if KnowsAllT2Runes()
            PerkOwner.RemoveSpell(HandlerSpell)
        endif
        
    endif

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

    UnregisterForMenu("StatsMenu")

EndEvent