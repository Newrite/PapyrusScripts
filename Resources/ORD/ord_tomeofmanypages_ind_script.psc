Scriptname ORD_TomeOfManyPages_Ind_Script extends activemagiceffect  

; -----

Float Property ORD_Value Auto
String Property ORD_AV Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
	akTarget.ModActorValue(ORD_AV, ORD_Value)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.ModActorValue(ORD_AV, -ORD_Value)

EndEvent

; -----