Scriptname ORD_WalkingDisaster_Script extends activemagiceffect  

; -----

Spell[] Property ORD_Alc_ElementalOil_Spell_Power Auto
Float Property ORD_UpdateRateMin Auto
Float Property ORD_UpdateRateMax Auto
MagicEffect[] Property ORD_Alc_ElementalOil_Effect_SelfPower Auto

Keyword Property MagicInvisibility Auto
MagicEffect Property VoiceMakeEthereal auto

Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(Utility.RandomFloat(ORD_UpdateRateMin,ORD_UpdateRateMax))

EndEvent

; -----

Event OnUpdate()

	RegisterForSingleUpdate(Utility.RandomFloat(ORD_UpdateRateMin,ORD_UpdateRateMax))
	If ((PlayerRef.HasMagicEffect(VoiceMakeEthereal) == false) && (PlayerRef.HasEffectKeyword(MagicInvisibility) == false))
		Int i = Utility.RandomInt(0,ORD_Alc_ElementalOil_Spell_Power.Length - 1)
		Spell TheSpell = ORD_Alc_ElementalOil_Spell_Power[i]
		TheSpell.Cast(PlayerRef)
	EndIf

EndEvent

; -----