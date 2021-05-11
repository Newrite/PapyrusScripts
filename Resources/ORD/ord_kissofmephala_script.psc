Scriptname ORD_KissOfMephala_Script extends activemagiceffect  

; -----

Int Property ORD_XP Auto
Message Property ORD_Pic_KissOfMephala_Message_Fail auto

; -----

Faction CurrentCrimeFaction

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	CurrentCrimeFaction = akTarget.GetCrimeFaction()
	If CurrentCrimeFaction != NONE
		akTarget.SetCrimeFaction(NONE)
		Game.AdvanceSkill("Pickpocket", ORD_XP)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.SetCrimeFaction(CurrentCrimeFaction)

EndEvent

; -----