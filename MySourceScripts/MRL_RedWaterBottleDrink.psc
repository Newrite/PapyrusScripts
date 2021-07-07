Scriptname MRL_RedWaterBottleDrink extends ActiveMagicEffect 

Spell Property DLC1dunRedwaterDenPower auto

GlobalVariable Property DLC1dunRedwaterDenPowerStopDay auto
GlobalVariable Property GameDaysPassed auto

Event OnEffectStart(Actor Target, Actor Caster)
    float today = GameDaysPassed.GetValue()
    float PowerStopDay = today + 1
    DLC1dunRedwaterDenPowerStopDay.SetValue(PowerStopDay)
    RegisterForSingleUpdateGameTime(24 * 1)
    debug.Trace("Сила красноводного источника наполняет меня.")
    Game.GetPlayer().AddSpell(DLC1dunRedwaterDenPower)
EndEvent

Event OnUpdateGameTime()
		
	if (Game.GetPlayer() as Actor).HasSpell(DLC1dunRedwaterDenPower)
		debug.Trace("Сила красноводного источника иссякла.")
		Game.GetPlayer().RemoveSpell(DLC1dunRedwaterDenPower)
	endif

EndEvent