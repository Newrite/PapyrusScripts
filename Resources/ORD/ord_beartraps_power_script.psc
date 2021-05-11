Scriptname ORD_BearTraps_Power_Script extends activemagiceffect  

; -----

MiscObject Property ORD_Loc_BearTraps_MiscItem Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.DropObject(ORD_Loc_BearTraps_MiscItem)

EndEvent

; -----