Scriptname ORD_SlayLiving_Script extends activemagiceffect  

; -----

ImagespaceModifier Property ORD_Arc_TrickArrows_Imod_Ebony_Disintegrate Auto
Float Property ORD_PushForce Auto
Int Property ORD_BloodStrength Auto
Actor Property PlayerRef auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	PlayerRef.PushActorAway(akTarget, ORD_PushForce)
	akTarget.DamageAV("Health",akTarget.GetAV("Health") * 2)
	akTarget.Kill(PlayerRef)
	ORD_Arc_TrickArrows_Imod_Ebony_Disintegrate.Apply()
	Game.TriggerScreenBlood(ORD_BloodStrength)

EndEvent

; -----