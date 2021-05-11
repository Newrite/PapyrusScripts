Scriptname ORD_ExNihilo_Script extends activemagiceffect  

; -----

Float Property ORD_Fraction Auto
String Property ORD_Stat Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.DamageAV(ORD_Stat, akTarget.GetAV(ORD_Stat) * ORD_Fraction)

EndEvent

; -----