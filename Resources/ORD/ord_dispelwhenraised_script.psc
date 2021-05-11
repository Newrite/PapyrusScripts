Scriptname ORD_DispelWhenRaised_Script extends activemagiceffect  

; -----

Keyword Property MagicThrallHealthRegen Auto
Keyword Property MagicSummonUndead Auto

; -----

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

	If akEffect.HasKeyword(MagicThrallHealthRegen) || akEffect.HasKeyword(MagicSummonUndead)
		Dispel()
	EndIf

EndEvent

; -----