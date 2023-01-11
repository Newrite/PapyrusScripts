Scriptname MRL_MAG_WandCast extends ActiveMagicEffect
{Скрипт расхода ресурсов на атаки.}

;------
;СВОЙСТВА
;------

Spell property FireBall auto
Keyword Property WandFireball Auto

;------
;ПЕРЕМЕННЫЕ
;------

;Актор на котором стартует эффект
Actor Target
ObjectReference TargetRef; Референс на актор для регистрации анимаций

;------
;ЭВЕНТЫ
;------

Function RegisterAll()

    RegisterForAnimationEvent(TargetRef, "WeaponSwing")
	RegisterForAnimationEvent(TargetRef, "WeaponLeftSwing")
    
EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)

    ;Инициализируем и запоминаем актора на котором все запускается
	Target = akTarget
	TargetRef = akTarget as ObjectReference

    Utility.WaitMenuMode(0.25)
    RegisterAll()

EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

    Debug.Notification("Anim: " + asEventName)

    ;Чек на силовую атаку
    bool PowerAttack = TargetRef.GetAnimationVariableBool("bAllowRotation")

    ;Атака с правой руки (либо двуручное оружие)
    if asEventName == "WeaponSwing"

        if PowerAttack

            if Target.GetEquippedWeapon(false).HasKeyword(WandFireball)
                FireBall.Cast(Target, Target)
                Utility.WaitMenuMode(0.15)
                FireBall.Cast(Target, Target)
                Utility.WaitMenuMode(0.15)
                FireBall.Cast(Target, Target)
            endif
            return

        else
            if Target.GetEquippedWeapon(false).HasKeyword(WandFireball)
                FireBall.Cast(Target, Target)
            endif
            return
            
        endif

    endif

    ;Атака с левой руки, в этом случае в функцию отправляется оружие с левой руки
    if asEventName == "WeaponLeftSwing"

        if PowerAttack

            if Target.GetEquippedWeapon(true).HasKeyword(WandFireball)
                FireBall.Cast(Target, Target)
                Utility.WaitMenuMode(0.15)
                FireBall.Cast(Target, Target)
                Utility.WaitMenuMode(0.15)
                FireBall.Cast(Target, Target)
            endif
            return

        else
            if Target.GetEquippedWeapon(true).HasKeyword(WandFireball)
                FireBall.Cast(Target, Target)
            endif
            return
            
        endif

    endif

EndEvent

