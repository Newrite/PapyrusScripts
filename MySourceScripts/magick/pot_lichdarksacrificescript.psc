Scriptname POT_LichDarkSacrificeScript extends ActiveMagicEffect

;=====================================================
SoulGem Property SoulGemBlackFilled Auto

Spell Property POT_LichDarkSacrifice Auto
Spell Property POT_LichResurrection Auto

;=====================================================

Event OnEffectStart(Actor akTarget, Actor akCaster)
                    Game.GetPlayer().RemoveItem(SoulGemBlackFilled, 1 )
                    Game.GetPlayer().RemoveSpell(POT_LichDarkSacrifice)
                    Game.GetPlayer().AddSpell(POT_LichResurrection, False)
                    Utility.Wait(1)
EndEvent
