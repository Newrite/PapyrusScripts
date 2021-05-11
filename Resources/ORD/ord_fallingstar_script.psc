Scriptname ORD_FallingStar_Script extends activemagiceffect  

; -----

Float Property ORD_ActorMult Auto
ImagespaceModifier Property ORD_One_FallingStar_Imod Auto
Float Property ORD_ImodDiv Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_One_FallingStar_Imod.Apply(akTarget.GetAV("Magicka") / ORD_ImodDiv)
	akTarget.DamageAV("Magicka", akTarget.GetAV("Magicka") * ORD_ActorMult)

EndEvent

; -----