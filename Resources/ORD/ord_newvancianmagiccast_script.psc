Scriptname ORD_NewVancianMagicCast_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Alt_NewVancianMagic_Global_Count Auto
Message Property ORD_Alt_NewVancianMagic_Message_AlmostDepleted Auto
Message Property ORD_Alt_NewVancianMagic_Message_Depleted Auto
Actor Property PlayerRef Auto

; -----

Event OnSpellCast(Form akSpell)

	If !(akSpell as Scroll) && (PlayerRef.GetEquippedSpell(0) == akSpell || PlayerRef.GetEquippedSpell(1) == akSpell)
		ORD_Alt_NewVancianMagic_Global_Count.Mod(-1)

		Int SpellSlots = ORD_Alt_NewVancianMagic_Global_Count.GetValue() as Int
		If SpellSlots == 0
			ORD_Alt_NewVancianMagic_Message_Depleted.Show()
			PlayerRef.InterruptCast()
		ElseIf SpellSlots == 10
			ORD_Alt_NewVancianMagic_Message_AlmostDepleted.Show()
		EndIf
	EndIf

EndEvent

; -----
