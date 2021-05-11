Scriptname ORD_AdvancedWorkshop_Script extends activemagiceffect  

; -----

Keyword Property CraftingSmithingSharpeningWheel Auto
Keyword Property CraftingSmithingArmorTable Auto
Actor Property PlayerRef Auto
Spell Property ORD_Smh_AdvancedWorkshop_Spell_Proc Auto
Spell Property ORD_Smh_FuelTheInferno_Spell_Proc Auto
Quest Property ORD_AdvancedWorkshop_Quest auto
Quest Property ORD_HeartOfCreation_Quest Auto
Keyword Property CraftingSmithingForge Auto
Keyword Property CraftingSmithingSkyforge Auto
Spell Property ORD_Smh_HeartOfCreation_Spell_Proc Auto
GlobalVariable Property ORD_Smh_AdvancedWorkshop_Global_Type Auto
GlobalVariable Property ORD_Smh_AdvancedWorkshop_Global_Type_Lockout auto

; -----

Event OnGetUp(ObjectReference akFurniture)

	If akFurniture.HasKeyword(CraftingSmithingSharpeningWheel) || akFurniture.HasKeyword(CraftingSmithingArmorTable)
		PlayerRef.DispelSpell(ORD_Smh_AdvancedWorkshop_Spell_Proc)
		PlayerRef.DispelSpell(ORD_Smh_FuelTheInferno_Spell_Proc)
	ElseIf akFurniture.HasKeyword(CraftingSmithingForge) || akFurniture.HasKeyword(CraftingSmithingSkyforge)
		PlayerRef.DispelSpell(ORD_Smh_HeartOfCreation_Spell_Proc)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_AdvancedWorkshop_Quest.Stop()
	ORD_HeartOfCreation_Quest.Stop()
	ORD_Smh_AdvancedWorkshop_Global_Type.SetValue(-1)
	ORD_Smh_AdvancedWorkshop_Global_Type_Lockout.SetValue(-1)

EndEvent

; -----
