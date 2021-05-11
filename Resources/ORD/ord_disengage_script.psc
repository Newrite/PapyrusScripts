Scriptname ORD_Disengage_Script extends activemagiceffect  

; -----

Int Property ORD_XP Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.StopCombat()
	Game.AdvanceSkill("Sneak", ORD_XP)

EndEvent

; -----