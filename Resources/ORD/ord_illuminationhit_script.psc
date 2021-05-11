Scriptname ORD_IlluminationHit_Script extends activemagiceffect  

; -----

Float Property ORD_XP Auto
String Property ORD_School Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Game.AdvanceSkill(ORD_School, ORD_XP)

EndEvent

; -----