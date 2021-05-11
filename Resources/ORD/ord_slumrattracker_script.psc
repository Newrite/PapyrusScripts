Scriptname ORD_SlumRatTracker_Script extends activemagiceffect  

; -----

Spell Property ORD_Pic_SlumRat_Spell_Buff Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForTrackedStatsEvent()

EndEvent

; -----

Event OnTrackedStatsEvent(string asStatFilter, int aiStatValue)

	If asStatFilter == "Pockets Picked"
		ORD_Pic_SlumRat_Spell_Buff.Cast(PlayerRef)
	EndIf

EndEvent

; -----