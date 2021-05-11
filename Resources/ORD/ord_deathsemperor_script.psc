Scriptname ORD_DeathsEmperor_Script extends activemagiceffect  

; -----

Quest Property ORD_DeathsEmperor_Quest Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_DeathsEmperor_Quest.Start()

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_DeathsEmperor_Quest.Stop()

EndEvent

; -----