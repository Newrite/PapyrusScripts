Scriptname ORD_RepeatedEvaluation_Script extends activemagiceffect  

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.EvaluatePackage()
	akTarget.StopCombat()

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.EvaluatePackage()

EndEvent

; -----