Scriptname ORD_PercentageDamage_Script extends activemagiceffect  

; ------

String Property ORD_Value Auto
Float Property ORD_Fraction Auto

; ------

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.DamageActorValue(ORD_Value, akTarget.GetActorValue(ORD_Value) * ORD_Fraction)

EndEvent

; ------
