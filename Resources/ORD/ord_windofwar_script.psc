Scriptname ORD_WindOfWar_Script extends activemagiceffect  

; -----

Spell Property ORD_Hea_WindOfWar_Spell_RallyingStandard Auto
Actor Property PlayerRef Auto
Perk Property ORD_Hea40_FaceOfDeath_Perk_40 Auto

Keyword Property MagicInvisibility Auto
MagicEffect Property VoiceMakeEthereal auto
MagicEffect Property ORD_Hea_RallyingStandard_Effect_WindOfWar Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If !PlayerRef.HasMagicEffect(ORD_Hea_RallyingStandard_Effect_WindOfWar)
		If !PlayerRef.HasEffectKeyword(MagicInvisibility) && !PlayerRef.HasMagicEffect(VoiceMakeEthereal)
			ORD_Hea_WindOfWar_Spell_RallyingStandard.Cast(PlayerRef)
		EndIf
	EndIf

EndEvent

; -----