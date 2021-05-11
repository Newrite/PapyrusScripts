Scriptname ORD_DualCastDetector_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Des_DualCastDetector_Global_DualCastFlag Auto
Float Property ORD_RevertDelay Auto
Actor Property PlayerRef Auto

; -----

Event OnSpellCast(Form akSpell)

	If PlayerRef.GetAnimationVariableBool("IsCastingDual")
		ORD_Des_DualCastDetector_Global_DualCastFlag.SetValue(1.0)
		RegisterForSingleUpdate(ORD_RevertDelay)
	Else
		ORD_Des_DualCastDetector_Global_DualCastFlag.SetValue(0.0)
	EndIf

EndEvent

; -----

Event OnUpdate()

	ORD_Des_DualCastDetector_Global_DualCastFlag.SetValue(0.0)

EndEvent

; -----

;MRh_SpellFire_Event