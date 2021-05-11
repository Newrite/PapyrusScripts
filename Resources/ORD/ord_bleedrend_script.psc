Scriptname ORD_BleedRend_Script extends activemagiceffect  

; -----

Float Property ORD_DamageMult Auto

; -----

Float HealthInitial

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.1)
	HealthInitial = akTarget.GetAV("Health")

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Float DamageTaken = (HealthInitial - akTarget.GetAV("Health")) * ORD_DamageMult
	If DamageTaken > 0
		If DamageTaken >= akTarget.GetAV("Health") - 5.0
			akTarget.DamageAV("Health", akTarget.GetAV("Health") - 5.0)
		Else
			akTarget.DamageAV("Health", DamageTaken)
		EndIf
	EndIf

EndEvent

; -----