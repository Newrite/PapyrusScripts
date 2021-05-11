Scriptname ORD_NordicBurial_Script extends activemagiceffect  

; -----

Spell Property ORD_One_NordicBurial_Spell_Proc Auto
Float Property ORD_HavokPush Auto
Float Property ORD_Stats Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_One_NordicBurial_Spell_Proc.Cast(PlayerRef)
	akTarget.ApplyHavokImpulse(0.0, 0.0, 1.0, ORD_HavokPush)
	;PlayerRef.RestoreAV("Health", ORD_Stats)
	;PlayerRef.RestoreAV("Stamina", ORD_Stats)
;	Utility.Wait(0.5)
;	akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateStart)
;	Utility.Wait(2.5)
;	akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateEnd)

EndEvent

; -----