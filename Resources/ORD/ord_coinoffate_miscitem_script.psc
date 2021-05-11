Scriptname ORD_CoinOfFate_MiscItem_Script extends ObjectReference  

; -----

Message Property ORD_Loc_GameOfFate_Message_Mcguffin Auto
GlobalVariable Property ORD_Loc_GameOfFate_Global_Count Auto
MiscObject Property ORD_Loc_GameOfFate_MiscItem Auto
Int Property ORD_AddGold Auto
MiscObject Property Gold001 Auto
Sound Property UISkillIncrease Auto
Spell Property ORD_Loc_GameOfFate_Spell_Ab Auto
Int Property ORD_Perk Auto

; -----

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	If akNewContainer == Game.GetPlayer()
		Actor PlayerRef = Game.GetPlayer()
		PlayerRef.RemoveItem(ORD_Loc_GameOfFate_MiscItem, 1, true)
		PlayerRef.AddItem(Gold001, ORD_AddGold)
		ORD_Loc_GameOfFate_Global_Count.Mod(1)
		ORD_Loc_GameOfFate_Message_Mcguffin.Show(ORD_Loc_GameOfFate_Global_Count.GetValue())
		UISkillIncrease.Play(PlayerRef)
		Game.AddPerkPoints(ORD_Perk)
		; end quest
		If ORD_Loc_GameOfFate_Global_Count.GetValue() >= 5
			PlayerRef.RemoveSpell(ORD_Loc_GameOfFate_Spell_Ab)
		EndIf
	EndIf

EndEvent

; -----