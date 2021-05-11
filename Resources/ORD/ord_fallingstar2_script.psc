Scriptname ORD_FallingStar2_Script extends activemagiceffect  

; -----

Sound Property ORD_One_FallingStar_Marker Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.PushActorAway(akTarget, 0.5)
	ORD_One_FallingStar_Marker.Play(akTarget)
	akTarget.DispelAllSpells()

EndEvent

; -----