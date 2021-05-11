Scriptname ORD_CastOnTrackedStatsEvent_Script extends activemagiceffect  

; -----

String Property ORD_Stat Auto
GlobalVariable Property ORD_Count Auto
Float Property ORD_SafeguardDelay Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Count.SetValue(Game.QueryStat(ORD_Stat))
	Debug.Notification("TRIGGER")
	RegisterForSingleUpdate(ORD_SafeguardDelay)

EndEvent

; -----

Event OnUpdate()

	; this fixes a race condition where the miscstat is incremented again after the globalvariable is set but before the Ab condition can fail
	ORD_Count.SetValue(Game.QueryStat(ORD_Stat))
	RegisterForSingleUpdate(ORD_SafeguardDelay)

EndEvent

; -----