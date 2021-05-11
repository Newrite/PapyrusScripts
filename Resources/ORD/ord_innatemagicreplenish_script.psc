Scriptname ORD_InnateMagicReplenish_Script extends activemagiceffect  

; -----

Message Property ORD_Alt_InnateMagic_Message_ShowCount Auto
GlobalVariable Property ORD_Alt_InnateMagic_Global_Count_Current Auto
GlobalVariable Property ORD_Alt_InnateMagic_Global_Count_Cap Auto
Message Property ORD_Alt_InnateMagic_Message_OneBack Auto
Message Property ORD_Alt_InnateMagic_Message_CappedAgain Auto
GlobalVariable Property ORD_Alt_InnateMagic_Global_Count_ChargeRate Auto
Actor Property PlayerRef Auto
GlobalVariable Property ORD_Alt_InnateMagic_Global_Fixed auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_Alt_InnateMagic_Global_Count_ChargeRate.GetValue())

EndEvent

; -----

Event OnUpdate()

	Float OldValue = ORD_Alt_InnateMagic_Global_Count_Current.GetValue()
	Float CapValue = ORD_Alt_InnateMagic_Global_Count_Cap.GetValue()
	If OldValue < CapValue
		ORD_Alt_InnateMagic_Global_Count_Current.Mod(1)
		If OldValue == (CapValue - 1.0)
			; just filled
			ORD_Alt_InnateMagic_Message_CappedAgain.Show()
		ElseIf OldValue == 0.0
			; just started filling
			ORD_Alt_InnateMagic_Message_OneBack.Show()
		EndIf

	EndIf
	RegisterForSingleUpdate(ORD_Alt_InnateMagic_Global_Count_ChargeRate.GetValue())
	If ORD_Alt_InnateMagic_Global_Fixed.GetValue() == 0
		Fix()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Alt_InnateMagic_Message_ShowCount.Show(ORD_Alt_InnateMagic_Global_Count_Current.GetValue(), ORD_Alt_InnateMagic_Global_Count_Cap.GetValue())

EndEvent

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell as Spell) && (PlayerRef.GetEquippedSpell(0) == akSpell || PlayerRef.GetEquippedSpell(1) == akSpell)
		; this is actually an equipped spell

		; reset update
		RegisterForSingleUpdate(ORD_Alt_InnateMagic_Global_Count_ChargeRate.GetValue())
	EndIf

EndEvent

; -----

Function Fix()

	; fixer
	If ORD_Alt_InnateMagic_Global_Count_Cap.GetValue() == 7 || ORD_Alt_InnateMagic_Global_Count_Cap.GetValue() == 5
		ORD_Alt_InnateMagic_Global_Count_Cap.SetValue(5)
	Else
		ORD_Alt_InnateMagic_Global_Count_Cap.SetValue(3)
	EndIf
	If ORD_Alt_InnateMagic_Global_Count_Current.GetValue() > ORD_Alt_InnateMagic_Global_Count_Cap.GetValue()
		ORD_Alt_InnateMagic_Global_Count_Current.SetValue(ORD_Alt_InnateMagic_Global_Count_Cap.GetValue())
	EndIf
	ORD_Alt_InnateMagic_Global_Fixed.SetValue(1)

Endfunction

; -----