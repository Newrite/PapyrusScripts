Scriptname ORD_DreamJourney_Script extends activemagiceffect  

; -----

ReferenceAlias Property LoveInterest Auto
Keyword Property LocTypeInn Auto
Keyword Property LocTypePlayerHouse Auto
Quest Property RelationshipMarriageFIN Auto
CompanionsHousekeepingScript Property CHScript Auto
Message Property ORD_Ill_LucidDreaming_Message Auto
Spell[] Property ORD_Ill_LucidDreaming_Spell_Proc Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSleep()

EndEvent

; -----

Event OnSleepStop(bool abInterrupted)

	Int i = 0
	Actor PlayerRef = Game.GetPlayer()
	i = 0
	While i < 5
		PlayerRef.DispelSpell(ORD_Ill_LucidDreaming_Spell_Proc[i])
		i += 1
	EndWhile
	i = 0
	If CHScript.PlayerHasBeastBlood != 1
		If RelationshipMarriageFIN.IsRunning() && RelationshipMarriageFIN.GetStage() >= 10 && PlayerRef.GetCurrentLocation() == LoveInterest.GetActorRef().GetCurrentLocation()
			i = 3
		ElseIf PlayerRef.GetCurrentLocation().HasKeyword(LocTypeInn) || PlayerRef.GetCurrentLocation().HasKeyword(LocTypePlayerHouse)
			i = 2
		Else
			i = 1
		EndIf
	EndIf
	Int j
	While i > 0
		j = ORD_Ill_LucidDreaming_Message.Show()
		ORD_Ill_LucidDreaming_Spell_Proc[j].Cast(PlayerRef)
		i -= 1
	EndWhile
	
EndEvent

; -----