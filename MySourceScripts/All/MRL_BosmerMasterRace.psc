Scriptname MRL_BosmerMasterRace extends ActiveMagicEffect
{При пожирании опр. ингридиентов выдает абилки.}

;Абилки стоек
Spell Property BosmerStanceBear Auto
Spell Property BosmerStanceWolf Auto
Spell Property BosmerStanceSpider Auto
Spell Property BosmerStanceMudcrab Auto
Spell Property BosmerStanceSabrecat Auto

;Ингридиенты
Ingredient Property BearHeart Auto
Ingredient Property WolfHeart Auto
Ingredient Property SpiderEgg Auto
Ingredient Property MudcrabClaw Auto
Ingredient Property SabrecatHeart Auto

Event OnSpellCast(Form akSpell)

    Ingredient ingr = akSpell as Ingredient
    if ingr

        if ingr == BearHeart
            Game.GetPlayer().AddSpell(BosmerStanceBear)
            return
        endif

        if ingr == WolfHeart
            Game.GetPlayer().AddSpell(BosmerStanceWolf)
            return
        endif

        if ingr == SpiderEgg
            Game.GetPlayer().AddSpell(BosmerStanceSpider)
            return
        endif

        if ingr == MudcrabClaw
            Game.GetPlayer().AddSpell(BosmerStanceMudcrab)
            return
        endif

        if ingr == SabrecatHeart
            Game.GetPlayer().AddSpell(BosmerStanceSabrecat)
            return
        endif

    endif

EndEvent