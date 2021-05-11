Scriptname ORD_PyromancerAscension_Script extends activemagiceffect  

; -----

Keyword Property MagicDamageFire Auto
GlobalVariable Property ORD_Des_PyromancerAscension_Global_Count Auto
Float Property ORD_UpdateRate Auto
Spell Property ORD_Des_PyromancerAscension_Spell_Proc Auto
Float Property ORD_Threshold Auto
Float Property ORD_ResetValue Auto
Actor Property PlayerRef Auto
Spell Property ORD_Des_ArcBurn_Spell_Proc Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Des_PyromancerAscension_Global_Count.SetValue(0.0)
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	If ORD_Des_PyromancerAscension_Global_Count.GetValue() >= 1.0
		ORD_Des_PyromancerAscension_Global_Count.Mod(-1.0)
	EndIf
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnSpellCast(Form akSpell)

	If akSpell.HasKeyword(MagicDamageFire) && akSpell != ORD_Des_ArcBurn_Spell_Proc

		; single or dual cast
		If PlayerRef.GetAnimationVariableBool("IsCastingDual")
			ORD_Des_PyromancerAscension_Global_Count.Mod(2.0)
		Else
			ORD_Des_PyromancerAscension_Global_Count.Mod(1.0)
		EndIf

		; increment
		If ORD_Des_PyromancerAscension_Global_Count.GetValue() >= ORD_Threshold
			ORD_Des_PyromancerAscension_Global_Count.SetValue(ORD_ResetValue)
			ORD_Des_PyromancerAscension_Spell_Proc.Cast(PlayerRef)
		EndIf
	EndIf

EndEvent

; -----