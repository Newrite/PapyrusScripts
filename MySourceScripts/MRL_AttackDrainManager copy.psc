Scriptname MRL_AttackDrainManager extends ActiveMagicEffect
{Скрипт расхода ресурсов на атаки.}

;------
;СВОЙСТВА
;------

Keyword Property MagicWeapon Auto ;Кейворд на оружии обозначающий что оно расходует магию
Keyword Property HealthWeapon Auto ;Кейворд на оружии обозначающий что оно расходует здоровье
Keyword Property DualWeapon Auto ;Кейворд на оружии обозначает что оно расходует запас сил + что-то еще (на оружии тогда также нужен один из кейвордов выше, иначе будет тратить только запас сил). В этом случае расход делится поровну на обе характеристики
;Глобальные переменные, выведены в мсм
GlobalVariable Property GlobalMult Auto ;Мультипликатор для функции GetDrainValue, отвечает за конечный рассчет ресурса
GlobalVariable Property GlobalWeightMult Auto ;Мультипликатор для функции GetEquippedWeaponWeight, отвечает за конечный рассчет влияния веса
GlobalVariable Property GlobalUpdateTimeBow Auto ;Частота обновления проверки натяжения лука, ресурс тратится каждую единицу обновления и величина умножается на это время
GlobalVariable Property GlobalUpdateTimeCrossBow Auto ;Частота обновления проверки перезарядки арбалета, ресурс тратится каждую единицу обновления и величина умножается на это время
GlobalVariable Property GlobalJumpValueBase Auto ;Отвечает за расход запаса сил на прыжок, флатовое значение, на него не влияют какие либо мультипликаторы

;Модификатор силовой атаки
Float Property PowerMod Auto

;Stamina \ Health \ Magicka стринги, выведенные в проперти для расширения функционала скрипта
String Property StaminaValueString Auto
String Property HealthValueString Auto
String Property MagickaValueString Auto

;Спел который кастуется при выстреле, используется для создания стрел \ болтов которые расходуют какой-то ресурс дополнительно
Spell Property SpellForArrowCost Auto

;Перк на ловкую перезарядку, уменьшает расход ресурса арбалета
Perk Property HotReloadPerk Auto

;------
;ПЕРЕМЕННЫЕ
;------


Actor Target
ObjectReference TargetRef

;Переменные для проверки состояния и расхода ресурса лука
Bool IsDrawn = false
Float DrawnValue = 0.0

;Переменные для проверки состояния и расхода ресурса арбалета
Bool IsReload = false
Float ReloadValue = 0.0

;Актор велью для модификатором удешевления силовых атак
String PowerAttackSpend = "marksmanskilladvance"


;------
;ФУНКЦИИ
;------

;Главная функция расхода оружия ближнего боя
Function MeleeWeaponCalc(Weapon Weap, bool PowerAttack)

    ;Рассчет значения расхода ресурса
    float DrainValue = GetDrainValue(GetEquippedWeaponWeight(Weap), GetPowerAttackMult(PowerAttack))

    ;Проверка расходует ли оружие два стата сразу (стамина + доп стат или только один из)
    if Weap.HasKeyword(DualWeapon)

        if Weap.HasKeyword(MagicWeapon)

            DefaultDualDrain(MagickaValueString, DrainValue / 2.0)
            return

        endif

        if Weap.HasKeyword(HealthWeapon)

            DefaultDualDrain(HealthValueString, DrainValue / 2.0)
            return

        endif

        DefaultDrain(StaminaValueString, DrainValue)
    
    else

        if Weap.HasKeyword(MagicWeapon)

            DefaultDrain(MagickaValueString, DrainValue)
            return

        endif

        if Weap.HasKeyword(HealthWeapon)

            DefaultDrain(HealthValueString, DrainValue)
            return

        endif

        DefaultDrain(StaminaValueString, DrainValue)

    endif

EndFunction

;Главная функция расхода ресурса лука
Function BowWeaponCalc(Weapon Weap)

    ;Рассчет значения расхода ресурса
    DrawnValue = GetDrainValueRanger(GetEquippedWeaponWeight(Weap)) / 2.0

    ;Проверка расходует ли оружие два стата сразу (стамина + доп стат или только один из)
    if Weap.HasKeyword(DualWeapon)

        if Weap.HasKeyword(MagicWeapon)

            GotoState("BowDrawnMagickaStamina")
            return

        endif

        if Weap.HasKeyword(HealthWeapon)

            GotoState("BowDrawnHealthStamina")
            return

        endif

        GotoState("BowDrawnStamina")
    
    else

        if Weap.HasKeyword(MagicWeapon)

            GotoState("BowDrawnMagicka")
            return

        endif

        if Weap.HasKeyword(HealthWeapon)

            GotoState("BowDrawnHealth")
            return

        endif

        GotoState("BowDrawnStamina")

    endif

EndFunction

;Главная функция расхода ресурса арбалета
Function CrossBowWeaponCalc(Weapon Weap)

    ;Рассчет значения расхода ресурса с учетом перка
    if Target.HasPerk(HotReloadPerk)
        ReloadValue = (GetDrainValueRanger(GetEquippedWeaponWeight(Weap)) * 0.7) / 2.0
    else
        ReloadValue = GetDrainValueRanger(GetEquippedWeaponWeight(Weap)) / 2.0
    endif

    ;Проверка расходует ли оружие два стата сразу (стамина + доп стат или только один из)
    if Weap.HasKeyword(DualWeapon)

        if Weap.HasKeyword(MagicWeapon)

            GotoState("CrossBowReloadMagickaStamina")
            return

        endif

        if Weap.HasKeyword(HealthWeapon)

            GotoState("CrossBowReloadHealthStamina")
            return

        endif

        GotoState("CrossBowReloadStamina")
    
    else

        if Weap.HasKeyword(MagicWeapon)

            GotoState("CrossBowReloadMagicka")
            return

        endif

        if Weap.HasKeyword(HealthWeapon)

            GotoState("CrossBowReloadHealth")
            return

        endif

        GotoState("CrossBowReloadStamina")

    endif

EndFunction

;Функция суммарного подсчета расхода ресурса, учитывая негативное влияение веса экипировки
float Function GetDrainValue(float Weight, float PowerAttackMult)

    ;Учитываем значение Infamy если оно больше 1.0
    float infamy = Target.GetActorValue("infamy")

    ;Бонус расхода от силовой рассчитывается отдельно
    if infamy > 1.0
        return ((Weight * infamy / 1.5) + ( (Weight * infamy / 1.5) * PowerAttackMult )) * GlobalMult.GetValue() as Float
    else
        return ((Weight / 1.5) + ( (Weight / 1.5) * PowerAttackMult )) * GlobalMult.GetValue() as Float
    endif

EndFunction

;Функция суммарного подсчета расхода ресурса ренж оружия, учитывая негативное влияение веса экипировки
float Function GetDrainValueRanger(float Weight)

    ;Учитываем значение Infamy если оно больше 1.0
    float infamy = Target.GetActorValue("infamy")

    if infamy > 1.0
        return Weight * infamy * GlobalMult.GetValue() as Float
    else
        return Weight * GlobalMult.GetValue() as Float
    endif

EndFunction

;Возвращает вес оружия учитывая разные нюансы (есть ли само оружие и что делать если ничего не вешает)
float Function GetEquippedWeaponWeight(Weapon Weap)

    ;Если вепон - кулак, базовый вес оружия
    Float WeaponWeight = 4 as Float

    ;Если оружие есть, берется его вес, если веса нет, берется часть его урона
    if Weap != none

        If Weap.GetWeight() > 0.0
            WeaponWeight = Weap.GetWeight()
        else
            WeaponWeight = Weap.GetBaseDamage() as Float / 5.0
        endif

    endif

    return WeaponWeight * GlobalWeightMult.GetValue() as Float

EndFunction

;Функция рассчета мультипликатора силовой атаки
float Function GetPowerAttackMult(bool PowerAttack)

    if PowerAttack

        ;Рассчет мультипликатора на силовую учитывая специальный актор велью который определяет уменьшение или увеличения расхода на силовые
        float PowerValue = Target.GetActorValue(PowerAttackSpend) as float

        if PowerValue >= 100.0
            return 0.0
        endif

        return PowerMod * (1.0 - ( PowerValue / 100.0 ))

    endif

    ;Возвращая ноль мы не прибавляем бонусного расхода на атаки, возращается если не силовая атака
    return 0.0

EndFunction

;Функции расхода ресурса по итогам рассчета, дуал функция как правило наносит 50% одному стату и 50% другому
Function DefaultDrain(string ActorValue, float DrainValue)
    Target.DamageActorValue(ActorValue, DrainValue)
EndFunction

Function DefaultDualDrain(string ActorValue, float DrainValue)

    Target.DamageActorValue(ActorValue, DrainValue)
    Target.DamageActorValue(StaminaValueString, DrainValue)

EndFunction


;------
;ЭВЕНТЫ
;------


Event OnEffectStart(Actor akTarget, Actor akCaster)

	Target = akTarget
	TargetRef = akTarget as ObjectReference

    RegisterForAnimationEvent(TargetRef, "WeaponSwing")
	RegisterForAnimationEvent(TargetRef, "WeaponLeftSwing")
	RegisterForAnimationEvent(TargetRef, "bowDrawn")
	RegisterForAnimationEvent(TargetRef, "arrowRelease")
	RegisterForAnimationEvent(TargetRef, "bowReset")
	RegisterForAnimationEvent(TargetRef, "reload")
	RegisterForAnimationEvent(TargetRef, "ReloadFast")
	RegisterForAnimationEvent(TargetRef, "reloadStop")
    RegisterForAnimationEvent(TargetRef, "JumpUp")

EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

    ;Чек на силовую атаку
    bool PowerAttack = TargetRef.GetAnimationVariableBool("bAllowRotation")

    ;Атака с правой руки (либо двуручное оружие)
    if asEventName == "WeaponSwing"

        MeleeWeaponCalc(Target.GetEquippedWeapon(false), PowerAttack)
        return

    endif

    ;Атака с левой руки, в этом случае в функцию отправляется оружие с левой руки
    if asEventName == "WeaponLeftSwing"

        MeleeWeaponCalc(Target.GetEquippedWeapon(true), PowerAttack)
        return

    endif

    ;Устанавливаем тип оружия что бы точно знать это лук или арбалет
    int type = Target.GetEquippedItemType(0)

    if type == 7 ;Это лук

        ;Начинаем дрейн ресурса когда натягиваем лук, записываем что в данный момент идет натягивание лука
        if asEventName == "bowDrawn"

            IsDrawn = true
            BowWeaponCalc(Target.GetEquippedWeapon())
            return

        endif

        ;Заканчиваем дрейн когда произведен выстрел, изменяем значение переменной и сжираем доп ресурс за стрелы крови \ магии через каст спела в котором находятся все нужные эффекты (немного разгружаем папирус и расширяем функциональность)
        if asEventName == "arrowRelease"

            DrawnValue = 0.0
            IsDrawn = false
            SpellForArrowCost.Cast(Target, Target)
            return

        endif

        ;Заканчиваем дрейн и меняем переменную когда просто отменили натяжение
        If asEventName == "bowReset"

            DrawnValue = 0.0
            IsDrawn = false
            return

        EndIf

    endif

    if type == 12 ;Это арбалет

        ;Начало перезарядки, устанавливаем что идет перезарядка и начинаем дрейн ресурса
        if asEventName == "reload" || asEventName == "ReloadFast"

            IsReload = true
            CrossBowWeaponCalc(Target.GetEquippedWeapon())
            return

        endif

        ;Небольшая подстраховка, болт выпущен значит дрейна и перезарядки точно нет, также сжираем доп ресурс за болты крови \ магии через каст спела в котором находятся все нужные эффекты (немного разгружаем папирус и расширяем функциональность)
        if asEventName == "arrowRelease"

            ReloadValue = 0.0
            IsReload = false
            SpellForArrowCost.Cast(Target, Target)
            return

        endif

        ;Перезарядка окончена, останавливаем дрейн и меняем переменную
        if asEventName == "reloadStop"
            
            ReloadValue = 0.0
            IsReload = false
            return

        endif
    
    endif

    ;Прыжок
    if asEventName == "JumpUp"

        float inf = Target.GetActorValue("infamy")

        if inf > 1.0
            Target.DamageActorValue("Stamina", GlobalJumpValueBase.GetValue() as float * inf)
            return
        else
            Target.DamageActorValue("Stamina", GlobalJumpValueBase.GetValue() as float)
            return
        endif

        return

    endif


EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

    UnregisterForAnimationEvent(TargetRef, "WeaponSwing")
	UnregisterForAnimationEvent(TargetRef, "WeaponLeftSwing")
	UnregisterForAnimationEvent(TargetRef, "bowDrawn")
	UnregisterForAnimationEvent(TargetRef, "arrowRelease")
	UnregisterForAnimationEvent(TargetRef, "bowReset")
	UnregisterForAnimationEvent(TargetRef, "reload")
	UnregisterForAnimationEvent(TargetRef, "ReloadFast")
	UnregisterForAnimationEvent(TargetRef, "reloadStop")
    UnregisterForAnimationEvent(TargetRef, "JumpUp")
    
EndEvent

;------
;СТЕЙТЫ
;------

;Стейты на расход разных ресурсов при натяжении лука
state BowDrawnHealth

	function OnUpdate()

        if IsDrawn

            DefaultDrain(HealthValueString, DrawnValue * GlobalUpdateTimeBow.GetValue() as Float)
            RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

        else

            UnregisterForUpdate()
            GotoState("")

        endif

	endFunction

	function onBeginState()

        DefaultDrain(HealthValueString, DrawnValue * GlobalUpdateTimeBow.GetValue() as Float)
		RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

	endFunction

endState

state BowDrawnStamina

	function OnUpdate()

        if IsDrawn

            DefaultDrain(StaminaValueString, DrawnValue * GlobalUpdateTimeBow.GetValue() as Float)
            RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

        else

            UnregisterForUpdate()
            GotoState("")

        endif

	endFunction

	function onBeginState()

        DefaultDrain(StaminaValueString, DrawnValue * GlobalUpdateTimeBow.GetValue() as Float)
        RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

	endFunction

endState

state BowDrawnMagicka

	function OnUpdate()

        if IsDrawn

            DefaultDrain(MagickaValueString, DrawnValue * GlobalUpdateTimeBow.GetValue() as Float)
            RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

        else

            UnregisterForUpdate()
            GotoState("")

        endif

	endFunction

	function onBeginState()

        DefaultDrain(MagickaValueString, DrawnValue * GlobalUpdateTimeBow.GetValue() as Float)
		RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

	endFunction

endState

state BowDrawnMagickaStamina

	function OnUpdate()

        if IsDrawn

            DefaultDualDrain(MagickaValueString, (DrawnValue * GlobalUpdateTimeBow.GetValue() as Float) / 2.0)
            RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

        else

            UnregisterForUpdate()
            GotoState("")

        endif

	endFunction

	function onBeginState()

        DefaultDualDrain(MagickaValueString, (DrawnValue * GlobalUpdateTimeBow.GetValue() as Float) / 2.0)
		RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

	endFunction

endState

state BowDrawnHealthStamina

	function OnUpdate()

        if IsDrawn

            DefaultDualDrain(HealthValueString, (DrawnValue * GlobalUpdateTimeBow.GetValue() as Float) / 2.0)
            RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

        else

            UnregisterForUpdate()
            GotoState("")

        endif

	endFunction

	function onBeginState()

        DefaultDualDrain(HealthValueString, (DrawnValue * GlobalUpdateTimeBow.GetValue() as Float) / 2.0)
		RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

	endFunction

endState


;Стейты на расход разных ресурсов при перезарядке арбалета
state CrossBowReloadHealth

	function OnUpdate()

        if IsReload

            DefaultDrain(HealthValueString, ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float)
            RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

        else

            UnregisterForUpdate()
            GotoState("")

        endif

	endFunction

	function onBeginState()

        DefaultDrain(HealthValueString, ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float)
		RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

	endFunction

endState

state CrossBowReloadStamina

	function OnUpdate()

        if IsReload

            DefaultDrain(StaminaValueString, ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float)
            RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

        else

            UnregisterForUpdate()
            GotoState("")

        endif

	endFunction

	function onBeginState()

        DefaultDrain(StaminaValueString, ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float)
        RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

	endFunction

endState

state CrossBowReloadMagicka

	function OnUpdate()

        if IsReload

            DefaultDrain(MagickaValueString, ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float)
            RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

        else

            UnregisterForUpdate()
            GotoState("")

        endif

	endFunction

	function onBeginState()

        DefaultDrain(MagickaValueString, ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float)
		RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

	endFunction

endState

state CrossBowReloadMagickaStamina

	function OnUpdate()

        if IsReload

            DefaultDualDrain(MagickaValueString, (ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float) / 2.0)
            RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

        else

            UnregisterForUpdate()
            GotoState("")

        endif

	endFunction

	function onBeginState()

        DefaultDualDrain(MagickaValueString, (ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float) / 2.0)
		RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)
        
	endFunction

endState

state CrossBowReloadHealthStamina

	function OnUpdate()

        if IsReload

            DefaultDualDrain(HealthValueString, (ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float) / 2.0)
            RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

        else

            UnregisterForUpdate()
            GotoState("")

        endif

	endFunction

	function onBeginState()

        DefaultDualDrain(HealthValueString, (ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float) / 2.0)
		RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

	endFunction

endState
