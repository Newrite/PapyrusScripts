Scriptname MRL_MAGDetonatePoison extends activemagiceffect  

; ------

Spell Property DetonateSpell Auto

; ------

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.RestoreActorValue("Health", 100000)
	DetonateSpell.SetNthEffectMagnitude(0, akTarget.GetActorValue("health") * 0.50)
	DetonateSpell.Cast(akCaster, akTarget)
	akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateStart)
	akTarget.SetAlpha (0.0,True)
	akTarget.AttachAshPile()
	akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateEnd)

EndEvent

; ------
