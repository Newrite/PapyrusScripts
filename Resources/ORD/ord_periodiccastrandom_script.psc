Scriptname ORD_PeriodicCastRandom_Script extends activemagiceffect  

; -----

Spell Property ORD_SpellToCast Auto
Float Property ORD_UpdateRateMin Auto
Float Property ORD_UpdateRateMax Auto
Bool Property ORD_Dispel Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(Utility.RandomFloat(ORD_UpdateRateMin,ORD_UpdateRateMax))

EndEvent

; -----

Event OnUpdate()

	ORD_SpellToCast.Cast(GetTargetActor())
	RegisterForSingleUpdate(Utility.RandomFloat(ORD_UpdateRateMin,ORD_UpdateRateMax))

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If ORD_Dispel
		akTarget.DispelSpell(ORD_SpellToCast)
	EndIf

EndEvent

; -----