Scriptname ORD_ComboSpell_Script extends activemagiceffect  

; -----

Keyword Property MagicDamageType Auto
Spell Property ORD_Des_Spell_Proc Auto
Explosion Property ORD_Combo_Explosion Auto
Keyword Property ORD_Des_AnyFireDamageHazard_Keyword Auto

; -----

Auto State IsListening

	Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

		If akEffect.HasKeyword(MagicDamageType) && !akEffect.HasKeyword(ORD_Des_AnyFireDamageHazard_Keyword)
			GoToState("IsDeaf")
			Actor TargetActor = GetTargetActor()
			If !TargetActor.IsDead()
				GetCasterActor().DoCombatSpellApply(ORD_Des_Spell_Proc, TargetActor)
			EndIf
			TargetActor.PlaceAtMe(ORD_Combo_Explosion)
			Dispel()
		EndIf

	EndEvent

EndState

; -----

State IsDeaf

EndState

; -----