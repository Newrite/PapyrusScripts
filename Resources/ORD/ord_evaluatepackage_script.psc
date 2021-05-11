Scriptname ORD_EvaluatePackage_Script extends activemagiceffect  

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.5)
	akTarget.EvaluatePackage()

EndEvent

; -----