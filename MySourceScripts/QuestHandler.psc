Scriptname QuestHandler extends ReferenceAlias
{Handler quest for dead bodyes.}

bool isUtilisation = false

Function Utilisation(actor target)
    while isUtilisation
        Utility.WaitMenuMode(1.0)
    endWhile
    isUtilisation = true
    ;Start Utili there
    isUtilisation = false
EndFunction

Function ChopChop(actor target)
    Utility.WaitMenuMode(1.0)
    while isUtilisation
        Utility.WaitMenuMode(1.0)
    endWhile
    ;Start ChopChop there
EndFunction