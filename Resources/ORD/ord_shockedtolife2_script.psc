Scriptname ORD_ShockedToLife2_Script extends activemagiceffect  

; -----

Keyword Property MagicDamageShock Auto
Spell Property ORD_Con_ShockedToLife_Spell_ProcEnergized Auto

; -----

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

	If akEffect.HasKeyword(MagicDamageShock)
		ORD_Con_ShockedToLife_Spell_ProcEnergized.Cast(GetTargetActor())
	EndIf

EndEvent

; -----