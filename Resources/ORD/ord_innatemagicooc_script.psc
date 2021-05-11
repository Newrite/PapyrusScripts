Scriptname ORD_InnateMagicOOC_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Alt_InnateMagic_Global_Count_Current Auto
Message Property ORD_Alt_InnateMagic_Message_OutOfSpells Auto
Actor Property PlayerRef Auto
GlobalVariable Property ORD_Alt_InnateMagic_Global_Count_CapBase Auto
GlobalVariable Property ORD_Alt_InnateMagic_Global_Count_Cap Auto

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell as Spell) && (PlayerRef.GetEquippedSpell(0) == akSpell || PlayerRef.GetEquippedSpell(1) == akSpell)
		; this is actually an equipped spell

		ORD_Alt_InnateMagic_Global_Count_Current.Mod(-1.0)
		Float SpellCount = ORD_Alt_InnateMagic_Global_Count_Current.GetValue()
		If SpellCount == 0.0
			; just depleted to zero
			ORD_Alt_InnateMagic_Message_OutOfSpells.Show()
		ElseIf SpellCount < 0.0
			; depleted below zero
			ORD_Alt_InnateMagic_Global_Count_Current.SetValue(0.0)
			SpellCount = 0.0
		EndIf

	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Alt_InnateMagic_Global_Count_Cap.SetValue(ORD_Alt_InnateMagic_Global_Count_CapBase.GetValue())

EndEvent

; -----