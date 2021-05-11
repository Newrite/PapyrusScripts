Scriptname ORD_VancianBloodMagic_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Alt_NewVancianMagic_Global_Count Auto
Actor Property PlayerRef Auto
GlobalVariable Property ORD_Alt_NewVancianMagic_Global_DungeonMaster_BloodMagicMult Auto

; -----

Event OnSpellCast(Form akSpell)

	If (PlayerRef.GetEquippedSpell(0) == akSpell || PlayerRef.GetEquippedSpell(1) == akSpell)
		ORD_Alt_NewVancianMagic_Global_Count.Mod(-1)

		Int SpellSlots = ORD_Alt_NewVancianMagic_Global_Count.GetValue() as Int
		PlayerRef.DamageActorValue("Health", -SpellSlots * ORD_Alt_NewVancianMagic_Global_DungeonMaster_BloodMagicMult.GetValue())
	EndIf

EndEvent

; -----
