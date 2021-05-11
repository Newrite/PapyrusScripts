Scriptname ORD_Hurricane_Script extends activemagiceffect  

; -----

Float Property ORD_PushForce Auto
Actor Property PlayerRef Auto
Spell Property ORD_Lia_Hurricane_Spell_SlowTime Auto
Sound Property ORD_Lia_Hurricane_Marker_Hit Auto
ImagespaceModifier Property ORD_One_FallingStar_Imod Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	PlayerRef.PushActorAway(akTarget, ORD_PushForce)
	ORD_Lia_Hurricane_Spell_SlowTime.Cast(PlayerRef)
	ORD_Lia_Hurricane_Marker_Hit.Play(akTarget)
	ORD_One_FallingStar_Imod.Apply()
	akTarget.RampRumble(0.5, 1.5, 5000)

EndEvent

; -----