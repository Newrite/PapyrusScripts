Scriptname ORD_IntoTheDust_Script extends activemagiceffect  

; -----

Float Property ORD_PushForce Auto
ImagespaceModifier Property ORD_One_Generic_Imod Auto

; -----

Event OnEffectStart(actor akTarget, actor akCaster)

	akTarget.DamageAV("Health", akTarget.GetAV("Health") - 1.0)
	akTarget.PushActorAway(akTarget, ORD_PushForce)
	ORD_One_Generic_Imod.Apply()

EndEvent

; -----
