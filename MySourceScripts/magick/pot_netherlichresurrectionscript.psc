Scriptname POT_NetherLichResurrectionScript extends ActiveMagicEffect  

Spell Property POT_NetherLichdom Auto
Message Property POT_NetherLichdomMessage Auto
Float Property POT_WaitUntilResurrection Auto
Perk Property POT_NetherLichPerk Auto
ReferenceAlias Property POT_Player Auto
Actor Property PlayerRef Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	POT_Player.ForceRefTo(PlayerRef)
EndEvent


Event OnEnterBleedout()
	If POT_Player.GetActorRef() == PlayerRef
		Utility.Wait(POT_WaitUntilResurrection)
		If PlayerRef.IsBleedingOut()
			PlayerRef.RestoreActorValue("Health",9999)
                    PlayerRef.AddPerk(POT_NetherLichPerk)
			POT_NetherLichdomMessage.Show()
			POT_Player.Clear()
		EndIf
	EndIf
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
       PlayerRef.RemovePerk(POT_NetherLichPerk)
	POT_Player.Clear()
EndEvent


