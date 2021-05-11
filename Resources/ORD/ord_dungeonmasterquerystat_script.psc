Scriptname ORD_DungeonMasterQueryStat_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Alt_NewVancianMagic_Global_Count Auto
GlobalVariable Property ORD_Alt_NewVancianMagic_Global_Count_Max Auto
Float Property ORD_UpdateRate Auto
GlobalVariable Property ORD_Alt_NewVancianMagic_Global_DungeonMaster_ReplenishedByPoller Auto
Message Property ORD_Alt_NewVancianMagic_Message_DungeonMaster_ReplenishedByPoller Auto
Sound Property UISkillIncrease Auto

; -----

Int StatQueried

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	StatQueried = Game.QueryStat("Quests Completed")
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	Int NewStatQueried = Game.QueryStat("Quests Completed")
	If NewStatQueried > StatQueried
		ORD_Alt_NewVancianMagic_Global_Count.Mod(ORD_Alt_NewVancianMagic_Global_DungeonMaster_ReplenishedByPoller.GetValue())
		If ORD_Alt_NewVancianMagic_Global_Count.GetValue() > ORD_Alt_NewVancianMagic_Global_Count_Max.GetValue()
			ORD_Alt_NewVancianMagic_Global_Count.SetValue(ORD_Alt_NewVancianMagic_Global_Count_Max.GetValue())
		EndIf
		ORD_Alt_NewVancianMagic_Message_DungeonMaster_ReplenishedByPoller.Show(ORD_Alt_NewVancianMagic_Global_Count.GetValue(), ORD_Alt_NewVancianMagic_Global_Count_Max.GetValue())
		UISkillIncrease.Play(Game.GetPlayer())
		StatQueried = NewStatQueried
	EndIf
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----