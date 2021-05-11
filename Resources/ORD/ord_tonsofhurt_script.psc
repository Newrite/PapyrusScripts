Scriptname ORD_TonsOfHurt_Script extends activemagiceffect  

; -----

Explosion Property ORD_Two_TonsOfHurt_Explosion Auto
Float Property ORD_Drain Auto
Actor Property PlayerRef Auto
GlobalVariable Property ORD_One_TidalRhythm_Global_State Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.PlaceAtMe(ORD_Two_TonsOfHurt_Explosion)
	akTarget.RampRumble(PlayerRef.GetActorValue("Stamina") / 500, 0.5, 1250)
	Utility.Wait(0.1)
	PlayerRef.DamageActorValue("Stamina", ORD_Drain)
	ORD_One_TidalRhythm_Global_State.SetValue(0)

EndEvent

; -----
