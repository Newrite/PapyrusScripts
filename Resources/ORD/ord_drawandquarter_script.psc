Scriptname ORD_DrawAndQuarter_Script extends activemagiceffect  

; -----

Float Property ORD_PushForce Auto
Float Property ORD_Delay Auto
Explosion Property ORD_Res_DrawAndQuarter_Explosion Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.PlaceAtMe(ORD_Res_DrawAndQuarter_Explosion)
	akTarget.PushActorAway(akTarget, ORD_PushForce)
	Utility.Wait(ORD_Delay)
	akTarget.PushActorAway(akTarget, -ORD_PushForce*2)

EndEvent

; -----
