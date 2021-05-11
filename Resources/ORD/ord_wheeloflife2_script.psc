Scriptname ORD_WheelOfLife2_Script extends activemagiceffect  

; -----

Keyword Property MagicRestoreHealth Auto
Spell Property ORD_Res_WheelOfLife_Spell_Proc Auto
Actor Property PlayerRef Auto
Float Property ORD_CycleLength Auto
Keyword Property MagicAlchRestoreHealth Auto
Keyword Property ORD_Res_WheelOfLife_Keyword Auto

; enduring ideal
Perk Property ORD_Res80_EnduringIdeal_Perk_80 Auto
Float Property ORD_Decrease Auto

Keyword Property MagicInvisibility Auto
MagicEffect Property VoiceMakeEthereal auto

; -----

Float CycleLength

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	CycleLength = ORD_CycleLength
	RegisterForSingleUpdate(CycleLength)

EndEvent

; -----

Event OnUpdate()

	If PlayerRef.HasPerk(ORD_Res80_EnduringIdeal_Perk_80) && CycleLength > -ORD_Decrease
		CycleLength += ORD_Decrease
	EndIf
	RegisterForSingleUpdate(CycleLength)
	If ((PlayerRef.HasMagicEffect(VoiceMakeEthereal) == false) && (PlayerRef.HasEffectKeyword(MagicInvisibility) == false))
		ORD_Res_WheelOfLife_Spell_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

	If (akEffect.HasKeyword(MagicRestoreHealth) || akEffect.HasKeyword(MagicAlchRestoreHealth)) && !akEffect.HasKeyword(ORD_Res_WheelOfLife_Keyword)
	;	If PlayerRef.HasPerk(ORD_Res80_EnduringIdeal_Perk_80)
	;		UnregisterForUpdate()
	;	Else
			CycleLength = ORD_CycleLength
			RegisterForSingleUpdate(CycleLength)
	;	EndIf
	EndIf

EndEvent

; -----
