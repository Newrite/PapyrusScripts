#load "GameSettings.fsx"
#load "Block.fsx"
#load "Enchanting.fsx"
#load "Alchemy.fsx"
#load "ResourceManager.fsx"

Block.shieldPercentBlocked 50. (1.6 * 1.9) true |> printfn "BLOCK: %A"
