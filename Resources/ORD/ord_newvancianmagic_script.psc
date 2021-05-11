Scriptname ORD_NewVancianMagic_Script extends activemagiceffect  

; -----

;ReferenceAlias Property LoveInterest Auto
Keyword Property LocTypeInn Auto
Keyword Property LocTypePlayerHouse Auto
;Quest Property RelationshipMarriageFIN Auto
;CompanionsHousekeepingScript Property CHScript Auto

Message Property ORD_Alt_NewVancianMagic_Message_Recharged Auto

GlobalVariable Property ORD_Alt_NewVancianMagic_Global_Count Auto
GlobalVariable Property ORD_Alt_NewVancianMagic_Global_Count_Max Auto
GlobalVariable Property ORD_Alt_NewVancianMagic_Global_Count_Max_Base Auto
GlobalVariable Property ORD_Alt_NewVancianMagic_Global_Count_Max_PointsOfMana Auto
Perk Property ORD_ScalingPerk Auto

GlobalVariable Property ORD_Alt_NewVancianMagic_Global_DungeonMaster_Half Auto
GlobalVariable Property ORD_Alt_NewVancianMagic_Global_DungeonMaster_Double Auto

Actor Property PlayerRef Auto

Message Property ORD_Alt_NewVancianMagic_Message_DungeonMaster_Study Auto
Message Property ORD_Alt_NewVancianMagic_Message_DungeonMaster_SideEffects Auto
GlobalVariable Property ORD_Alt_NewVancianMagic_Global_DungeonMaster_Study Auto
GlobalVariable Property ORD_Alt_NewVancianMagic_Global_DungeonMaster_SideEffects Auto
Perk Property ORD_StudyPerk Auto

Sound Property UISkillIncrease Auto
FormList Property ORD_Alt_VancianMagic_FormList_LocationWhitelist Auto

ObjectReference Property ORD_Anchor Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSleep()

EndEvent

; -----

Event OnSleepStop(bool abInterrupted)

	;If CHScript.PlayerHasBeastBlood != 1
	;If (RelationshipMarriageFIN.IsRunning() && RelationshipMarriageFIN.GetStage() >= 10 && PlayerRef.GetCurrentLocation() == LoveInterest.GetActorRef().GetCurrentLocation())

	; vancian magic
	Location PlayerLocation = PlayerRef.GetCurrentLocation()
	If !abInterrupted && (PlayerLocation.HasKeyword(LocTypeInn) || PlayerLocation.HasKeyword(LocTypePlayerHouse) || ORD_Alt_VancianMagic_FormList_LocationWhitelist.Find(PlayerLocation) >= 0 || PlayerRef.GetDistance(ORD_Anchor) <= 5333)

		If PlayerRef.HasPerk(ORD_StudyPerk)
			ORD_Alt_NewVancianMagic_Global_DungeonMaster_Study.SetValue(ORD_Alt_NewVancianMagic_Message_DungeonMaster_Study.Show() - 1)
			ORD_Alt_NewVancianMagic_Global_DungeonMaster_SideEffects.SetValue(ORD_Alt_NewVancianMagic_Message_DungeonMaster_SideEffects.Show())
		EndIf

		Int MaxSlots = ORD_Alt_NewVancianMagic_Global_Count_Max_Base.GetValue() as Int
		If PlayerRef.HasPerk(ORD_ScalingPerk)
			MaxSlots += Math.Floor((PlayerRef.GetBaseActorValue("Magicka") / ORD_Alt_NewVancianMagic_Global_Count_Max_PointsOfMana.GetValue() as Int))
		EndIf
		If ORD_Alt_NewVancianMagic_Global_DungeonMaster_Study.GetValue() == 1
			; half slots
			MaxSlots = Math.Floor(MaxSlots * ORD_Alt_NewVancianMagic_Global_DungeonMaster_Half.GetValue())
		ElseIf ORD_Alt_NewVancianMagic_Global_DungeonMaster_Study.GetValue() == -1
			; double slots
			MaxSlots = Math.Floor(MaxSlots * ORD_Alt_NewVancianMagic_Global_DungeonMaster_Double.GetValue())
		EndIf

		ORD_Alt_NewVancianMagic_Global_Count.SetValue(MaxSlots)
		ORD_Alt_NewVancianMagic_Global_Count_Max.SetValue(MaxSlots)
		ORD_Alt_NewVancianMagic_Message_Recharged.Show(MaxSlots, MaxSlots)
		UISkillIncrease.Play(PlayerRef)
	EndIf
	
EndEvent

; -----

Event OnRaceSwitchComplete()

	Utility.Wait(1.0)
	RegisterForSleep()

EndEvent

; -----