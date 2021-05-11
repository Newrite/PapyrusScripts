Scriptname ORD_VancianMagic_Script extends activemagiceffect  

; -----

ReferenceAlias Property LoveInterest Auto
Keyword Property LocTypeInn Auto
Keyword Property LocTypePlayerHouse Auto
Quest Property RelationshipMarriageFIN Auto
CompanionsHousekeepingScript Property CHScript Auto

Message Property ORD_Alt_VancianMagic_Message_Full Auto
Message Property ORD_Alt_VancianMagic_Message_Half Auto
Message Property ORD_Alt_VancianMagic_Message_HalfFail Auto

GlobalVariable Property ORD_Alt_VancianMagic_Global_Count Auto
GlobalVariable Property ORD_Alt_VancianMagic_Global_Count_Max Auto
GlobalVariable Property ORD_Alt_VancianMagic_Global_Count_7thCircinate Auto

Perk Property ORD_Alt40_VancianMagic_Perk_70 Auto

GlobalVariable Property ORD_Alt_VancianMagic_Global_Count_DefineMaxBase Auto
GlobalVariable Property ORD_Alt_VancianMagic_Global_Count_DefineMaxQuadraticWizard Auto
Float Property ORD_HalfMult Auto
Float Property ORD_CircinateMult Auto

Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Alt_VancianMagic_Global_Count.SetValue(ORD_Alt_VancianMagic_Global_Count_DefineMaxBase.GetValue())
	RegisterForSleep()

EndEvent

; -----

Event OnSleepStop(bool abInterrupted)

;	If CHScript.PlayerHasBeastBlood != 1
		; 7th circinate
		Float NewMax
		If PlayerRef.HasPerk(ORD_Alt40_VancianMagic_Perk_70)
			NewMax = ORD_Alt_VancianMagic_Global_Count_DefineMaxBase.GetValue() + (PlayerRef.GetLevel() * ORD_Alt_VancianMagic_Global_Count_DefineMaxQuadraticWizard.GetValue())
		Else
			NewMax = ORD_Alt_VancianMagic_Global_Count_DefineMaxBase.GetValue()
		EndIf
		ORD_Alt_VancianMagic_Global_Count_Max.SetValue(NewMax)
		ORD_Alt_VancianMagic_Global_Count_7thCircinate.SetValue(NewMax * ORD_CircinateMult)

		; vancian magic
		If (RelationshipMarriageFIN.IsRunning() && RelationshipMarriageFIN.GetStage() >= 10 && PlayerRef.GetCurrentLocation() == LoveInterest.GetActorRef().GetCurrentLocation()) || (PlayerRef.GetCurrentLocation().HasKeyword(LocTypeInn) || PlayerRef.GetCurrentLocation().HasKeyword(LocTypePlayerHouse))
			ORD_Alt_VancianMagic_Global_Count.SetValue(NewMax)
			ORD_Alt_VancianMagic_Message_Full.Show(NewMax)
		Else
			If ORD_Alt_VancianMagic_Global_Count.GetValue() >= (NewMax * ORD_HalfMult)
				ORD_Alt_VancianMagic_Message_HalfFail.Show()
			Else
				ORD_Alt_VancianMagic_Global_Count.SetValue(NewMax * ORD_HalfMult)
				ORD_Alt_VancianMagic_Message_Half.Show(NewMax * ORD_HalfMult)
			EndIf
		EndIf
;	EndIf
	
EndEvent

; -----