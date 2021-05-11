Scriptname ORD_WanderingWarrior_SetAV_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_One_WanderingWarrior_Global_Count Auto

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	; revert modAV
	akTarget.ModActorValue("TwoHandedPowerMod", -ORD_One_WanderingWarrior_Global_Count.GetValue())

	; clear global
	ORD_One_WanderingWarrior_Global_Count.SetValue(0)

EndEvent

; -----