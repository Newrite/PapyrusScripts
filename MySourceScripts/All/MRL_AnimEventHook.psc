Scriptname MRL_AnimEventHook extends ActiveMagicEffect
{Скрипт расхода ресурсов на атаки.}

;------
;СВОЙСТВА
;------

Spell Property SpellWeaponSwingLeft Auto
Spell Property SpellWeaponSwingRight Auto
Spell property SpellJump auto
Spell property SpellBowDraw auto
Spell property SpellArrowRelease auto
Spell property SpellBowReset auto
Spell property SpellBoltRelease auto
Spell property SpellReloadStart auto
Spell property SpellReloadStop auto
Spell property SpellWeapEquipOut auto

;------
;ПЕРЕМЕННЫЕ
;------

;Актор на котором стартует эффект
Actor Target
ObjectReference TargetRef; Референс на актор для регистрации анимаций
bool IsReload = false
bool IsRegistred = false

;Функции регистрации и отмены регистрации анимаций
Function UnregisterAll()

    UnregisterForAnimationEvent(TargetRef, "WeaponSwing")
	UnregisterForAnimationEvent(TargetRef, "WeaponLeftSwing")
	UnregisterForAnimationEvent(TargetRef, "bowDrawStart")
	UnregisterForAnimationEvent(TargetRef, "arrowRelease")
    UnregisterForAnimationEvent(TargetRef, "bowReset")
	UnregisterForAnimationEvent(TargetRef, "reload")
	UnregisterForAnimationEvent(TargetRef, "ReloadFast")
	UnregisterForAnimationEvent(TargetRef, "reloadStop")
    UnregisterForAnimationEvent(TargetRef, "JumpUp")
    UnregisterForAnimationEvent(TargetRef, "WeapEquip_Out")

EndFunction

Function RegisterExceptCrossbow()

    RegisterForAnimationEvent(TargetRef, "WeaponSwing")
	RegisterForAnimationEvent(TargetRef, "WeaponLeftSwing")
	RegisterForAnimationEvent(TargetRef, "bowDrawStart")
	RegisterForAnimationEvent(TargetRef, "arrowRelease")
    RegisterForAnimationEvent(TargetRef, "bowReset")
    RegisterForAnimationEvent(TargetRef, "JumpUp")
    RegisterForAnimationEvent(TargetRef, "WeapEquip_Out")
    
EndFunction

Function RegisterCrossbow()

    RegisterForAnimationEvent(TargetRef, "reload")
	RegisterForAnimationEvent(TargetRef, "ReloadFast")
	RegisterForAnimationEvent(TargetRef, "reloadStop")
    
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
    if Target.GetEquippedItemType(0) == 12
		RegisterCrossbow()
        IsRegistred = true
	endif

EndEvent

;Перегистрируем при смене расы
Event OnRaceSwitchComplete()

	Utility.WaitMenuMode(0.25)
	UnregisterAll()
	Utility.WaitMenuMode(0.25)
	RegisterExceptCrossbow()
    RegisterCrossbow()

EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject as Weapon && Target.GetEquippedItemType(0) == 12 && !IsRegistred
		RegisterCrossbow()
        IsRegistred = true
	endif
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

    ;Атака с правой руки (либо двуручное оружие)
    if asEventName == "WeaponSwing"

        SpellWeaponSwingRight.Cast(Target, Target)
        return

    endif

    ;Атака с левой руки, в этом случае в функцию отправляется оружие с левой руки
    if asEventName == "WeaponLeftSwing"

        SpellWeaponSwingLeft.Cast(Target, Target)
        return

    endif

    ;Устанавливаем тип оружия что бы точно знать это лук или арбалет
    int type = Target.GetEquippedItemType(0)

    if type == 7 ;Это лук

        ;Начинаем дрейн ресурса когда натягиваем лук, записываем что в данный момент идет натягивание лука
        if asEventName == "bowDrawStart"

            Target.DoCombatSpellApply(SpellBowDraw, TargetRef)
            return

        endif

        ;Заканчиваем дрейн когда произведен выстрел, изменяем значение переменной и сжираем доп ресурс за стрелы крови \ магии через каст спела в котором находятся все нужные эффекты (немного разгружаем папирус и расширяем функциональность)
        if asEventName == "arrowRelease"

            Target.DoCombatSpellApply(SpellArrowRelease, TargetRef)
            return

        endif

        ;Заканчиваем дрейн и меняем переменную когда просто отменили натяжение
        If asEventName == "bowReset"

            Target.DoCombatSpellApply(SpellBowReset, TargetRef)
            return

        EndIf

    endif


    if type == 12 ;Это арбалет

        int necr = game.GetModByName("hz_NonExploitableCrossbowReload.esp")

        if necr

            ;Начало перезарядки, устанавливаем что идет перезарядка и начинаем дрейн ресурса
            if asEventName == "reload" || asEventName == "ReloadFast"

                Target.DoCombatSpellApply(SpellReloadStart, TargetRef)
                IsReload = true
                return

            endif

            ;Небольшая подстраховка, болт выпущен значит дрейна и перезарядки точно нет, также сжираем доп ресурс за болты крови \ магии через каст спела в котором находятся все нужные эффекты (немного разгружаем папирус и расширяем функциональность)
            ;Дополнительная проверка на стадию не перезарядки для подстраховки, от третьего лица почему-то при перезарядке арбалета запускается анимация arrowRelease и происходит выполнение функции
            if asEventName == "arrowRelease"

                if !IsReload
                    Target.DoCombatSpellApply(SpellBoltRelease, TargetRef)
                endif
                return

            endif

        else

            ;Небольшая подстраховка, болт выпущен значит дрейна и перезарядки точно нет, также сжираем доп ресурс за болты крови \ магии через каст спела в котором находятся все нужные эффекты (немного разгружаем папирус и расширяем функциональность)
            ;Дополнительная проверка на стадию не перезарядки для подстраховки, от третьего лица почему-то при перезарядке арбалета запускается анимация arrowRelease и происходит выполнение функции
            if asEventName == "arrowRelease"

                if !IsReload
                    Target.DoCombatSpellApply(SpellBoltRelease, TargetRef)
                endif

            endif

            ;Начало перезарядки, устанавливаем что идет перезарядка и начинаем дрейн ресурса
            if asEventName == "reload" || asEventName == "ReloadFast" || asEventName == "arrowRelease"

                Target.DoCombatSpellApply(SpellReloadStart, TargetRef)
                IsReload = true
                return

            endif
        
        endif

        ;Перезарядка окончена, останавливаем дрейн и меняем переменную
        if asEventName == "reloadStop"
            
            Target.DoCombatSpellApply(SpellReloadStop, TargetRef)
            IsReload = false
            return

        endif
    
    endif

    ;Прыжок
    if asEventName == "JumpUp"

        Target.DoCombatSpellApply(SpellJump, TargetRef)
        return

    endif

    if asEventName == "WeapEquip_Out"

        Target.DoCombatSpellApply(SpellWeapEquipOut, TargetRef)
        return

    endif

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

    UnregisterAll()
    IsRegistred = false

EndEvent
