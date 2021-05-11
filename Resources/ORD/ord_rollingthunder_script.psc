Scriptname ORD_RollingThunder_Script extends activemagiceffect  

; -----

Explosion Property ORD_Spe_RollingThunder_Explosion_Force Auto
Float Property ORD_XPMult Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.PlaceAtMe(ORD_Spe_RollingThunder_Explosion_Force)
	If akTarget == PlayerRef
		Game.AdvanceSkill("Speechcraft", ORD_XPMult * akTarget.GetVoiceRecoveryTime())
	EndIf
	akTarget.SetVoiceRecoveryTime(0.1)

EndEvent

; -----