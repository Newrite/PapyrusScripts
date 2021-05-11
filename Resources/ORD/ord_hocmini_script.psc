Scriptname ORD_HoCMini_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Quest Property ORD_HeartOfCreation_Quest Auto
Keyword Property CraftingSmithingForge Auto
Keyword Property CraftingSmithingSkyforge Auto
Spell Property ORD_Smh_HeartOfCreation_Spell_Proc Auto
GlobalVariable Property ORD_Smh_HeartOfCreation_Global_Type Auto
Spell Property ORD_Smh_HeartOfCreation_Spell_Enrage_Proc Auto

; -----

Event OnGetUp(ObjectReference akFurniture)

	If akFurniture.HasKeyword(CraftingSmithingForge) || akFurniture.HasKeyword(CraftingSmithingSkyforge)
		PlayerRef.DispelSpell(ORD_Smh_HeartOfCreation_Spell_Proc)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_HeartOfCreation_Quest.Stop()
	ORD_Smh_HeartOfCreation_Global_Type.SetValue(-1)
	PlayerRef.DispelSpell(ORD_Smh_HeartOfCreation_Spell_Enrage_Proc)

EndEvent

; -----
