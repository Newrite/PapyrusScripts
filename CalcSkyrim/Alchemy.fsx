//Формулы алхимии
module Alchemy

#load "GameSettings.fsx"

//Описание эффекта в ингридиенте и игридиента
type Effect =
    { Magnitude: float
      IsRestoreValue: bool; }

type Ingridient =
    { Effects: Effect list }

//Общий множитель с настроек игры и с первом перком
let private fAlchemyBaseMult = GameSettings.fAlchemySkillFactor * GameSettings.fAlchemyIngredientInitMult

//Множители с перков алхимии
let private fPerkAlchemicalLore = 1.5
let private fPerkCatalysus = 1.2 * 1.154
let private fPerkImprovedeLixirs = 1.25
let private fPerkPurificationProcess = 1.3
let private fPerksMult = fPerkAlchemicalLore * fPerkCatalysus * fPerkImprovedeLixirs * fPerkPurificationProcess

//Дополнительный множитель для эффекта восстановления здоровья \ запаса сил \ магии
let private fRestoreValueMult = 1.25 * 1.25

//Формула конечной силы эффектов в ингридиенте
let alchemyMaxIngredientPower ingridient =
    ingridient.Effects
    |>List.map (fun effect ->
        if effect.IsRestoreValue then
            effect.Magnitude * fAlchemyBaseMult * fPerksMult * fRestoreValueMult
        else
            effect.Magnitude * fAlchemyBaseMult * fPerksMult)