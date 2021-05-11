Scriptname ORD_DesOnHitFrost_Script extends activemagiceffect  

; -----

Spell Property ORD_Des_Frostfall_Spell_Proc Auto
Spell Property ORD_Des_Shatter_Spell_Proc Auto
Perk Property ORD_Des50_Shatter_Perk_50_OrdASISExclude Auto
MagicEffect Property ORD_Des_WintersMajesty_Effect_CloakProc Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	; frostfall
	ORD_Des_Frostfall_Spell_Proc.Cast(akCaster, akTarget)

	; shatter
	If akCaster.HasPerk(ORD_Des50_Shatter_Perk_50_OrdASISExclude)
		Float TargetFrostResist = akTarget.GetActorValue("FrostResist")
		If TargetFrostResist > 0 || (akTarget.HasMagicEffect(ORD_Des_WintersMajesty_Effect_CloakProc) && TargetFrostResist > -50)
			ORD_Des_Shatter_Spell_Proc.Cast(akCaster, akTarget)
		EndIf
	EndIf

EndEvent

; -----