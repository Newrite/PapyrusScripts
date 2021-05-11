Scriptname ORD_DragonHoard_Script extends activemagiceffect  

; -----

Int Property ORD_Threshold Auto
Message Property ORD_Pic_DragonHoard_Message Auto
MiscObject Property Gold001 Auto
Int Property ORD_Perks Auto
CompanionsHousekeepingScript Property CHScript Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSleep()

EndEvent

; -----

Event OnSleepStop(bool abInterrupted)

;	If CHScript.PlayerHasBeastBlood != 1
	If PlayerRef.GetItemCount(Gold001) >= ORD_Threshold
		If ORD_Pic_DragonHoard_Message.Show()
			PlayerRef.RemoveItem(Gold001, ORD_Threshold)
			Game.AddPerkPoints(ORD_Perks)
		EndIf
	EndIf
	
EndEvent

; -----