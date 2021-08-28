Scriptname REQ_AlcoholScript extends ActiveMagicEffect  
{Keeps track of the current drunk level and applies the visual drunk effect to the player.}

ImageSpaceModifier property DrunkISM auto
Faction property Storage auto
Int mag

Event OnEffectStart(Actor akTarget, Actor akCaster)
	; REQ_MagnitudeCounter script
	mag = self.GetMagnitude() as Int
	If mag <= 0
		mag = 1
	EndIf
	akTarget.AddToFaction(Storage)
	If akTarget.GetFactionRank(Storage) + mag < 127
		akTarget.ModFactionRank(Storage, mag)
	Else
		akTarget.SetFactionRank(Storage, 127)
	EndIf
	; end
	
	if (akTarget == Game.GetPlayer())
		DrunkISM.Remove()
		DrunkISM.Apply((akTarget.GetFactionRank(Storage) / 50.0 - akTarget.GetBaseActorValue("Health") / 1000) * Utility.RandomFloat(0.8, 1.2))
	endif
EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	; REQ_MagnitudeCounter script
	akTarget.ModFactionRank(Storage, -mag)
	If (akTarget.GetFactionRank(Storage) <= 0)
		akTarget.RemoveFromFaction(Storage)
	EndIf
	; end

	if (akTarget == Game.GetPlayer())
		DrunkISM.Remove()
		if (akTarget.GetFactionRank(Storage) > 0)
			DrunkISM.Apply((akTarget.GetFactionRank(Storage) / 50.0 - akTarget.GetBaseActorValue("Health") / 1000) * Utility.RandomFloat(0.8, 1.2))
		endif
	endif
EndEvent
