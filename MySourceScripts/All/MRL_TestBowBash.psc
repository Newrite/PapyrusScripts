Scriptname MRL_TestBowBash extends ActiveMagicEffect
{Скрипт расхода ресурсов на атаки.}

;------
;СВОЙСТВА
;------

Spell property Rune auto
;------
;ПЕРЕМЕННЫЕ
;------

;Актор на котором стартует эффект
Actor Target
ObjectReference TargetRef; Референс на актор для регистрации анимаций

;Функции регистрации и отмены регистрации анимаций
Function UnregisterAll()

    UnregisterForAnimationEvent(TargetRef, "bashExit")

EndFunction

Function RegisterExceptCrossbow()

    RegisterForAnimationEvent(TargetRef, "bashExit")
    
EndFunction

;------
;ЭВЕНТЫ
;------

Event OnEffectStart(Actor akTarget, Actor akCaster)

    ;Инициализируем и запоминаем актора на котором все запускается
	Target = akTarget
	TargetRef = akTarget as ObjectReference

    Utility.WaitMenuMode(0.25)
    RegisterExceptCrossbow()

EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

    ;Атака с правой руки (либо двуручное оружие)
    if asEventName == "bashExit"
        Rune.Cast(TargetRef)
    endif

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

    UnregisterAll()

EndEvent
