Scriptname ORD_ManOWar_OnHit_Script extends activemagiceffect  

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Debug.SendAnimationEvent(akCaster, "attackPowerStartDualWield")

EndEvent

; -----