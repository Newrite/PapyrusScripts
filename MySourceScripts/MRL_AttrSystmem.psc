Scriptname MRL_AttrSystmem extends ActiveMagicEffect
{ Обрабатывает бонусы от белых характеристик.}

Float[] Property WeightValues Auto
String[] Property ActorValues Auto
Float Property SoftCap Auto
Float Property HardCap Auto

Actor Caster

Event OnEffectStart(Actor akTarget, Actor akCaster)
	OldStamina = akCaster.GetBaseActorValue("stamina")
	Caster = akCaster
	RegisterForMenu("StatsMenu")
EndEvent

Event OnMenuClose(String Menu)

	if Menu == "StatsMenu"

		float Stamina = Caster.GetBaseActorValue("stamina")

		if Stamina >= 150.0
			SetSneakMod(Stamina)
		endif

	endif

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForMenu("StatsMenu")
EndEvent