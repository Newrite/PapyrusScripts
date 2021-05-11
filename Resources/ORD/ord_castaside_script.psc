Scriptname ORD_CastAside_Script extends activemagiceffect  

; -----

Float Property ORD_PushBase Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	PlayerRef.PushActorAway(akTarget, ORD_PushBase)

EndEvent

; -----