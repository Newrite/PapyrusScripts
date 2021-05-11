Scriptname ORD_PendulumStrike_Script extends activemagiceffect  

; -----

Float Property ORD_PushForce Auto
Actor Property PlayerRef Auto
ImagespaceModifier Property ORD_One_Generic_Imod Auto

; -----

Event OnEffectStart(actor akTarget, actor akCaster)

	PlayerRef.PushActorAway(akTarget, ORD_PushForce)
	ORD_One_Generic_Imod.Apply()
	akTarget.RampRumble(0.25, 0.25, 1600.0)

EndEvent

; -----
