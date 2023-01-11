Scriptname MRL_CurseSummons extends Actor  
{Увеличивает проклятье на величину в проперти, при смерти суммона от кого-то, даже от игрока, и только если у суммона меньше 0.1 единиц здоровья во время смерти.}

Float Property curseValue auto

string cruseAV = "EnchantingSkillAdvance"

Event OnDying(Actor akKiller)
	if akKiller && (self.GetActorValue("Health") < 0.1)
		Game.GetPlayer().ModActorValue(cruseAV, curseValue * 0.75)
	endif
EndEvent


