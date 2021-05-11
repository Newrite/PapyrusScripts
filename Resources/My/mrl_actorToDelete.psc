scriptName mrl_actorToDelete extends activemagiceffect

Keyword Property KW_SummonSpirit auto

function OnEffectStart(Actor akTarget, Actor akCaster)
	Utility.Wait(2.0)
	if !Game.GetPlayer().HasMagicEffectWithKeyword(KW_SummonSpirit)
		akTarget.Disable(false)
		akTarget.Delete()
	endif
endFunction
