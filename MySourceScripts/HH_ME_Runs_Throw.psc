Scriptname HH_ME_Runs_Throw extends activemagiceffect  

Idle Property VoiceStart Auto  

Idle Property VoiceRelease Auto  

Spell Property HH_Throw_Exmple  Auto

Spell Property Spell_CD Auto

Actor Property PlayerRef  Auto

MiscObject Property Misc_Throw Auto   

Event OnEffectStart(Actor akTarget, Actor akCaster)
if PlayerRef.GetAV("Stamina") < 10
	Debug.Notification("Недостаточно стамины")
		return 
endIf
if PlayerRef.GetItemCount(Misc_Throw) == 0
	Debug.Notification("Снаряды закончились")
		return 
endIf
RegisterForActorAction(4)
if PlayerRef.IsSneaking ()
PlayerRef.SetDontMove()
endif
PlayerRef.PlayIdle(VoiceStart) 
PlayerRef.PlayIdle(VoiceRelease) 
EndEvent

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)
		if akActor == PlayerRef && actionType==4
		Utility.WaitMenuMode(0.15)
		HH_Throw_Exmple.cast(playerRef, playerRef)
		Spell_CD.cast(playerRef, playerRef)
		PlayerRef.RemoveItem(Misc_Throw, 1,true)
        Endif
		UnregisterforActorAction(4)
		PlayerRef.SetDontMove(false)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
PlayerRef.SetDontMove(false)
EndEvent