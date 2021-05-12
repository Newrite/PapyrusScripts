Scriptname DragonAspectCheck extends activemagiceffect
{Скрипт для того что бы проверять наличие у крикуна нужного количества душ, если хватает, кастует спелл, если нет, уведомляет.}

Int Property soulsNeed Auto
Spell Property aspectSpell Auto

string sDragonSouls = "dragonsouls"

Event OnEffectStart(Actor akTarget, Actor akCaster)

    Int souls = akCaster.GetActorValue(sDragonSouls) as Int
    
    If (souls >= soulsNeed)
        aspectSpell.Cast(akCaster, akTarget)
        akCaster.ModActorValue(sDragonSouls, -soulsNeed as Float)
        Debug.Notification("Драконьих душ осталось: " + (souls-soulsNeed))
    Else
        Debug.Notification("Недостаточно драконьих душ. Текущее количество: " + souls + " Душ нужно: " + soulsNeed)
    EndIf

EndEvent