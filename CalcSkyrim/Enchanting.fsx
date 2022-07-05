//Формулы зачарования
module Enchanting

#load "GameSettings.fsx"

//Описание зачарований в игре, его множитель со взятым перком и базовая сила
type Enchantments =
    | FireDamage
    | FireResist

    member self.Multiplay =
        match self with
        | FireDamage -> 1.25
        | FireResist -> 1.5

    member self.BaseMagnitude =
        match self with
        | FireDamage -> 10.0
        | FireResist -> 8.0

//Общий множитель зачарования
let private fEnchMult = 1.15 * 1.5 * 1.15 * GameSettings.fEnchantingSkillFactor

//Формула конечной силы зачарования
let enchantmentPower havePerk (enchantment: Enchantments) =
    match havePerk with
    | true -> enchantment.BaseMagnitude * fEnchMult * enchantment.Multiplay
    | false -> enchantment.BaseMagnitude * fEnchMult