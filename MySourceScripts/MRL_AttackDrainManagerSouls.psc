Scriptname MRL_AttackDrainManagerSouls extends ActiveMagicEffect
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
GlobalVariable Property GlobalUpdateTimeRecovery Auto ;Скорость восстановления расхода ресурсов
GlobalVariable Property GlobalPercentRecovery Auto ;Процент восстановления ресурса
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

Keyword Property AmmoLight Auto
Keyword Property AmmoMedium Auto
Keyword Property AmmoHeavy Auto
Keyword Property AmmoMassive Auto

;------
;ПЕРЕМЕННЫЕ
;------

;Актор на котором стартует эффект
Actor Target
ObjectReference TargetRef; Референс на актор для регистрации анимаций

;Переменные для проверки состояния и расхода ресурса лука
;Bool IsDrawn = false
Float DrawnValue = 0.0

;Переменные для проверки состояния и расхода ресурса арбалета
Bool IsReload     = false
Float ReloadValue = 0.0

;Актор велью для модификатором удешевления силовых атак
String PowerAttackSpend  = "marksmanskilladvance"
String NormalAttackSpend = "alchemyskilladvance"

;Souls Var, расход запаса сил к след удару и общее количество потраченного запаса сил
float SwingDrainST = 0.0
float TotalDrainST = 0.0

;------
;ФУНКЦИИ
;------

;Главная функция расхода оружия ближнего боя
Function MeleeWeaponCalc(Weapon Weap, bool PowerAttack)

    ;Рассчет значения расхода ресурса
    float DrainValue = GetDrainValue(GetEquippedWeaponWeight(Weap) * GetNormalAttackMult(), GetPowerAttackMult(PowerAttack))

    ;Проверка расходует ли оружие два стата сразу (стамина + доп стат или только один из)
    if Weap.HasKeyword(DualWeapon)

        if Weap.HasKeyword(MagicWeapon)

            DefaultDualDrainStamina(MagickaValueString, DrainValue / 2.0)
            return

        endif

        if Weap.HasKeyword(HealthWeapon)

            DefaultDualDrainStamina(HealthValueString, DrainValue / 2.0)
            return

        endif

        DefaultDrainStamina(StaminaValueString, DrainValue)
    
    else

        if Weap.HasKeyword(MagicWeapon)

            DefaultDrain(MagickaValueString, DrainValue)
            return

        endif

        if Weap.HasKeyword(HealthWeapon)

            DefaultDrain(HealthValueString, DrainValue)
            return

        endif

        DefaultDrainStamina(StaminaValueString, DrainValue)

    endif

EndFunction

;Главная функция расхода ресурса лука
Function BowWeaponCalc(Weapon Weap)

    ;Рассчет значения расхода ресурса
    DrawnValue = GetAmmowWeightValue() + GetDrainValueRanger(GetEquippedWeaponWeight(Weap) * GetNormalAttackMult())

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
        ReloadValue = GetAmmowWeightValue() + GetDrainValueRanger(GetEquippedWeaponWeight(Weap) * GetNormalAttackMult()) * 0.7
    else
        ReloadValue = GetAmmowWeightValue() + GetDrainValueRanger(GetEquippedWeaponWeight(Weap)* GetNormalAttackMult())
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

    ;Проверка на силовую
    if PowerAttackMult > 0.0

        ;Бонус расхода от силовой рассчитывается отдельно
        if infamy > 1.0
            return ((Weight * infamy) + (Weight * infamy * PowerAttackMult ) + (5.0 + (1.0 - (Weight * 3.0 / 100.0)))) *  GlobalMult.GetValue() as Float
        else
            return (Weight + (Weight * PowerAttackMult ) + (5.0 + (1.0 - (Weight * 3.0 / 100.0)))) * GlobalMult.GetValue() as Float
        endif

    else

        if infamy > 1.0
            return ((Weight * infamy) + (5.0 + (1.0 - (Weight * 3.0 / 100.0)))) *  GlobalMult.GetValue() as Float
        else
            return (Weight + (5.0 + (1.0 - (Weight * 3.0 / 100.0)))) * GlobalMult.GetValue() as Float
        endif

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

;Функция доп расхода на затраты перезарядки или натягивания в зависимости от веса снаряда
float Function GetAmmowWeightValue()

    if Target.WornHasKeyword(AmmoLight)
        return 1.5
    endif

    if Target.WornHasKeyword(AmmoMedium)
        return 3.0
    endif

    if Target.WornHasKeyword(AmmoHeavy)
        return 4.5
    endif

    if Target.WornHasKeyword(AmmoMassive)
        return 6.0
    endif

    return 0.0

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

        ;Кап удешевления силовой
        if PowerValue > 90.0
            PowerValue = 90.0
        endif

        return PowerMod * (1.0 - ( PowerValue / 100.0 ))

    endif

    ;Возвращая ноль мы не прибавляем бонусного расхода на атаки, возращается если не силовая атака
    return 0.0

EndFunction

;Функция рассчета мультипликатора нормальной атаки (и ренж и мили)
float Function GetNormalAttackMult()

    ;Рассчет мультипликатора на обычную атаку или выстрел
    float AttackValue = Target.GetActorValue(NormalAttackSpend) as float

    if AttackValue > 0.0
        ;Кап кап удешевления
        if AttackValue > 90.0
            AttackValue = 90.0
        endif

        return 1.0 - ( AttackValue / 100.0 )

    endif

    ;Возвращаяем ноль если нет никакого удешевления
    return 1.0

EndFunction

;Функции расхода ресурса по итогам рассчета, дуал функция как правило наносит 50% одному стату и 50% другому
Function DefaultDrain(string ActorValue, float DrainValue)
    Target.DamageActorValue(ActorValue, DrainValue)
EndFunction

Function DefaultDualDrain(string ActorValue, float DrainValue)

    Target.DamageActorValue(ActorValue, DrainValue)
    Target.DamageActorValue(StaminaValueString, DrainValue)

EndFunction

;Доп функции расхода ресурса для соулс лайк стамины, записывают сколько потратить на след взмах и сколько было в сумме потрачено
Function DefaultDrainStamina(string ActorValue, float DrainValue)

    float CurrentStamina = Target.GetActorValue(ActorValue) as float

    if SwingDrainST == 0.0

        if DrainValue > CurrentStamina

            Target.DamageActorValue(ActorValue, CurrentStamina)
            TotalDrainST += CurrentStamina
            SwingDrainST += CurrentStamina
            GotoState("Recover")
            return

        endif

        Target.DamageActorValue(ActorValue, DrainValue)
        TotalDrainST += DrainValue
        SwingDrainST += DrainValue
        GotoState("Recover")
        return

    endif

    if SwingDrainST > CurrentStamina

        Target.DamageActorValue(ActorValue, CurrentStamina)
        TotalDrainST += CurrentStamina
        SwingDrainST += CurrentStamina
        return

    endif

    Target.DamageActorValue(ActorValue, SwingDrainST)
    TotalDrainST += SwingDrainST
    SwingDrainST += DrainValue
    return


EndFunction

Function DefaultDualDrainStamina(string ActorValue, float DrainValue)

    Target.DamageActorValue(ActorValue, DrainValue)
    float CurrentStamina = Target.GetActorValue(StaminaValueString) as float

    if SwingDrainST == 0.0

        if DrainValue > CurrentStamina

            Target.DamageActorValue(StaminaValueString, CurrentStamina)
            TotalDrainST += CurrentStamina
            SwingDrainST += CurrentStamina
            GotoState("Recover")
            return

        endif

        Target.DamageActorValue(StaminaValueString, DrainValue)
        TotalDrainST += DrainValue
        SwingDrainST += DrainValue
        GotoState("Recover")
        return

    endif

    if SwingDrainST > CurrentStamina

        Target.DamageActorValue(StaminaValueString, CurrentStamina)
        TotalDrainST += CurrentStamina
        SwingDrainST += CurrentStamina
        return

    endif

    Target.DamageActorValue(StaminaValueString, SwingDrainST)
    TotalDrainST += SwingDrainST
    SwingDrainST += DrainValue
    return

EndFunction

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

EndFunction

Function RegisterAll()

    RegisterForAnimationEvent(TargetRef, "WeaponSwing")
	RegisterForAnimationEvent(TargetRef, "WeaponLeftSwing")
	RegisterForAnimationEvent(TargetRef, "bowDrawStart")
	RegisterForAnimationEvent(TargetRef, "arrowRelease")
    RegisterForAnimationEvent(TargetRef, "bowReset")
	RegisterForAnimationEvent(TargetRef, "reload")
	RegisterForAnimationEvent(TargetRef, "ReloadFast")
	RegisterForAnimationEvent(TargetRef, "reloadStop")
    RegisterForAnimationEvent(TargetRef, "JumpUp")
    
EndFunction


;------
;ЭВЕНТЫ
;------


Event OnEffectStart(Actor akTarget, Actor akCaster)

    ;Инициализируем и запоминаем актора на котором все запускается
	Target = akTarget
	TargetRef = akTarget as ObjectReference

    Utility.WaitMenuMode(0.25)
    RegisterAll()

EndEvent

;Перегистрируем при смене расы
Event OnRaceSwitchComplete()

	Utility.Wait(0.25)
	UnregisterAll()
	Utility.Wait(0.25)
	RegisterAll()

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
        if asEventName == "bowDrawStart"

            BowWeaponCalc(Target.GetEquippedWeapon())
            return

        endif

        ;Заканчиваем дрейн когда произведен выстрел, изменяем значение переменной и сжираем доп ресурс за стрелы крови \ магии через каст спела в котором находятся все нужные эффекты (немного разгружаем папирус и расширяем функциональность)
        if asEventName == "arrowRelease"

            DrawnValue = 0.0
            GotoState("")
            SpellForArrowCost.Cast(Target, Target)
            return

        endif

        ;Заканчиваем дрейн и меняем переменную когда просто отменили натяжение
        If asEventName == "bowReset"

            DrawnValue = 0.0
            GotoState("")
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
        ;Дополнительная проверка на стадию не перезарядки для подстраховки, от третьего лица почему-то при перезарядке арбалета запускается анимация arrowRelease и происходит выполнение функции
        if asEventName == "arrowRelease"

            if !IsReload
                SpellForArrowCost.Cast(Target, Target)
            endif
            
            return

        endif

        ;Перезарядка окончена, останавливаем дрейн и меняем переменную
        if asEventName == "reloadStop"
            
            IsReload = false
            ReloadValue = 0.0
            GotoState("")
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

    UnregisterAll()
    
EndEvent

;------
;СТЕЙТЫ
;------

state Recover

	function onBeginState()
		RegisterForSingleUpdate(GlobalUpdateTimeRecovery.GetValue() as Float)
	endFunction

	function OnUpdate()

		if Target.GetAnimationVariableBool("IsAttacking")
			RegisterForSingleUpdate(GlobalUpdateTimeRecovery.GetValue() as Float)
		else

            Target.RestoreActorValue(StaminaValueString, TotalDrainST * GlobalPercentRecovery.GetValue() as Float)
            TotalDrainST = 0.0
            SwingDrainST = 0.0
			self.GotoState("")

		endIf

	endFunction

endState

;Стейты на расход разных ресурсов при натяжении лука
state BowDrawnHealth

    Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

        if akBaseObject as Weapon

            DrawnValue = 0.0
            GoToState("")

        endif

    endEvent

	function OnUpdate()

        if Target.GetAnimationVariableBool("IsAttacking")

            DefaultDrain(HealthValueString, DrawnValue * GlobalUpdateTimeBow.GetValue() as Float)
            RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

        else

            DrawnValue = 0.0
            GoToState("")

        endif

	endFunction

	function onBeginState()

		RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

	endFunction

endState

state BowDrawnStamina

    Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

        if akBaseObject as Weapon

            DrawnValue = 0.0
            GoToState("")

        endif

    endEvent

	function OnUpdate()

        if Target.GetAnimationVariableBool("IsAttacking")

            DefaultDrain(StaminaValueString, DrawnValue * GlobalUpdateTimeBow.GetValue() as Float)
            RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

        else

            DrawnValue = 0.0
            GoToState("")

        endif

	endFunction

	function onBeginState()

        RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

	endFunction

endState

state BowDrawnMagicka

    Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

        if akBaseObject as Weapon

            DrawnValue = 0.0
            GoToState("")

        endif

    endEvent

	function OnUpdate()

        if Target.GetAnimationVariableBool("IsAttacking")

            DefaultDrain(MagickaValueString, DrawnValue * GlobalUpdateTimeBow.GetValue() as Float)
            RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

        else

            DrawnValue = 0.0
            GoToState("")

        endif

	endFunction

	function onBeginState()

		RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

	endFunction

endState

state BowDrawnMagickaStamina

    Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

        if akBaseObject as Weapon

            DrawnValue = 0.0
            GoToState("")

        endif

    endEvent

	function OnUpdate()

        if Target.GetAnimationVariableBool("IsAttacking")

            DefaultDualDrain(MagickaValueString, (DrawnValue * GlobalUpdateTimeBow.GetValue() as Float) / 2.0)
            RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

        else

            DrawnValue = 0.0
            GoToState("")

        endif

	endFunction

	function onBeginState()

		RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

	endFunction

endState

state BowDrawnHealthStamina

    Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

        if akBaseObject as Weapon

            DrawnValue = 0.0
            GoToState("")

        endif

    endEvent

	function OnUpdate()

        if Target.GetAnimationVariableBool("IsAttacking")

            DefaultDualDrain(HealthValueString, (DrawnValue * GlobalUpdateTimeBow.GetValue() as Float) / 2.0)
            RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

        else

            DrawnValue = 0.0
            GoToState("")

        endif

	endFunction

	function onBeginState()

		RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

	endFunction

endState

;Стейты на расход разных ресурсов при перезарядке арбалета
state CrossBowReloadHealth

    Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

        if akBaseObject as Weapon

            ReloadValue = 0.0
            IsReload = false
            GoToState("")

        endif

    endEvent

	function OnUpdate()

        DefaultDrain(HealthValueString, ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float)
        RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

	endFunction

	function onBeginState()

		RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

	endFunction

endState

state CrossBowReloadStamina

    Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

        if akBaseObject as Weapon

            ReloadValue = 0.0
            IsReload = false
            GoToState("")

        endif

    endEvent

	function OnUpdate()

        DefaultDrain(StaminaValueString, ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float)
        RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

	endFunction

	function onBeginState()

        RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

	endFunction

endState

state CrossBowReloadMagicka

    Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

        if akBaseObject as Weapon

            ReloadValue = 0.0
            IsReload = false
            GoToState("")

        endif

    endEvent

	function OnUpdate()

        DefaultDrain(MagickaValueString, ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float)
        RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

	endFunction

	function onBeginState()

		RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

	endFunction

endState

state CrossBowReloadMagickaStamina

    Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

        if akBaseObject as Weapon

            ReloadValue = 0.0
            IsReload = false
            GoToState("")

        endif

    endEvent

	function OnUpdate()

        DefaultDualDrain(MagickaValueString, (ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float) / 2.0)
        RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

	endFunction

	function onBeginState()

		RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)
        
	endFunction

endState

state CrossBowReloadHealthStamina

    Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

        if akBaseObject as Weapon

            ReloadValue = 0.0
            IsReload = false
            GoToState("")

        endif

    endEvent

	function OnUpdate()

        DefaultDualDrain(HealthValueString, (ReloadValue * GlobalUpdateTimeCrossBow.GetValue() as Float) / 2.0)
        RegisterForSingleUpdate(GlobalUpdateTimeCrossBow.GetValue() as Float)

	endFunction

	function onBeginState()

		RegisterForSingleUpdate(GlobalUpdateTimeBow.GetValue() as Float)

	endFunction

endState
