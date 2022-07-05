//Формулы блока
module Block

#load "GameSettings.fsx"
// Концепт
// Дудрик молот 167 дмг, сыромятный щит около 53 брони, все чарки зелья дают один и тот же эффект и он аддитивен, патчером найти все их
// Следующее скалирование с перком для мульта, перки в сумме должны 1.6 давать

(*
        Dreamer — 26.08.2021
    Типо там правые перки будут
    Первый защита от стрел с щитом, когда щит поднят защита выше + даёт дефлект стрел
    Второй даёт атак спид и дамаг когда именно блочишь щитом удары, стакается до 3-х раз
    Скейлится от зачарки блока
    Третий когда башишь врага который атакует то режешь ему мастерство плюс ещё мб чето
    Тоже скейлится от чарки
    Ну и слева там
    Крепкий щит когда в блок стамину получаешь
    Бег и спринт с щитом
    Резисты когда поднимаешь щит и
    И удалить перк который чисто по центру от первого перка :PeepoPain:
    XandR — 26.08.2021
    мб как-то раскол брони условный, после баша там таргет получает увеличенный урон от физы или всех источников :PeepoPain:
    лан, пора в блайт таун за едой :PeepoPain:
    Dreamer — 26.08.2021
    Ну дамаг просто даёт второй перк справа
    XandR — 26.08.2021
    мб какой-то сплешовый баш :PeepoPain:
    Dreamer — 26.08.2021
    Мастер перк можно какую то абилку с кд на силовой баш
    И замедло времени когда получаешь удар в щит
    bz1k — 26.08.2021
    Да какое замедло
    Dreamer — 26.08.2021
    Не такое какое было и как приятный бонус :PeepoPain:
*)


//Формула для щита
let shieldPercentBlocked baseShieldArmor perkMult isPowerAttack =
    if isPowerAttack then
        (GameSettings.fShieldBaseFactor + GameSettings.fShieldScalingFactor *   baseShieldArmor) * perkMult * GameSettings.fBlockPowerAttackMult
    else
        (GameSettings.fShieldBaseFactor + GameSettings.fShieldScalingFactor *   baseShieldArmor) * perkMult

//Формула для оружия
let weaponPercentBlocked enemyBaseWeaponDamage perkMult isPowerAttack =
    if isPowerAttack then
        (GameSettings.fBlockWeaponBase + GameSettings.fBlockWeaponScaling *     enemyBaseWeaponDamage) * perkMult * GameSettings.fBlockPowerAttackMult
    else
        (GameSettings.fBlockWeaponBase + GameSettings.fBlockWeaponScaling * enemyBaseWeaponDamage) *  perkMult