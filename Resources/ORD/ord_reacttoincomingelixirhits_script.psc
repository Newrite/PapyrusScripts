Scriptname ORD_ReactToIncomingElixirHits_Script extends activemagiceffect  

; -----

Keyword Property MagicAlchBeneficial Auto
Actor Property PlayerRef Auto
Spell Property ORD_Alc_RefreshingSurge_Spell_Proc Auto

Keyword Property MagicAlchRestoreHealth Auto
Keyword Property MagicAlchRestoreMagicka Auto
Keyword Property MagicAlchRestoreStamina Auto

; witchmaster
Perk Property ORD_Alc80_Witchmaster_Perk_80 Auto
Spell[] Property ORD_Alc_Witchmaster_Spell_Proc Auto
Message[] Property ORD_Alc_Witchmaster_Message Auto
Float Property ORD_Chance Auto
Keyword Property ORD_Alc_SideEffects_Keyword Auto

; chymical wedding
Perk Property ORD_Alc90_ChymicalWedding_Perk_90 auto

; -----

Auto State IsListening

	Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

		GoToState("IsNotListening")
;		If akEffect.HasKeyword(MagicAlchBeneficial)
		; compatibility fix for Morrowloot and Immersive Potions
		If akEffect.HasKeyword(MagicAlchBeneficial) || akEffect.HasKeyword(MagicAlchRestoreHealth) || akEffect.HasKeyword(MagicAlchRestoreMagicka) || akEffect.HasKeyword(MagicAlchRestoreStamina)

			; stimulants
			ORD_Alc_RefreshingSurge_Spell_Proc.Cast(PlayerRef)

			; witchmaster
			If PlayerRef.HasPerk(ORD_Alc80_Witchmaster_Perk_80) && Utility.RandomFloat(0.0,1.0) < ORD_Chance && (PlayerRef.HasPerk(ORD_Alc90_ChymicalWedding_Perk_90) || !akEffect.HasKeyword(ORD_Alc_SideEffects_Keyword))
				Int RandomSpell = Utility.RandomInt(0, ORD_Alc_Witchmaster_Spell_Proc.Length - 1)
				ORD_Alc_Witchmaster_Message[RandomSpell].Show()
				GoToState("IsListening")
				ORD_Alc_Witchmaster_Spell_Proc[RandomSpell].Cast(PlayerRef)
			Else
				GoToState("IsListening")
			EndIf
		Else
			GoToState("IsListening")
		EndIf

	EndEvent

EndState

; -----

State IsNotListening

EndState

; -----