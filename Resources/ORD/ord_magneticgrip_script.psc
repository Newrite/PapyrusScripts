Scriptname ORD_MagneticGrip_Script extends activemagiceffect  

; -----

Keyword Property MagicDamageType Auto
Spell Property ORD_Des_Spell_Proc Auto
Int Property ORD_Threshold Auto
Actor Property PlayerRef Auto

; -----

Int Count = 0

; -----

Auto State IsReceivingEvents

	Event OnSpellCast(Form akSpell)

		If PlayerRef.GetAnimationVariableBool("IsCastingDual") && akSpell.HasKeyword(MagicDamageType)
			Count += 1
			If Count >= ORD_Threshold
				Count = 0
				GoToState("IsNotReceivingEvents")
				ORD_Des_Spell_Proc.Cast(PlayerRef)
			EndIf
		EndIf

	EndEvent

EndState

; -----

State IsNotReceivingEvents

EndState

; -----