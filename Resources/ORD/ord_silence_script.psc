Scriptname ORD_Silence_Script extends activemagiceffect  

; -----

Float Property ORD_UpdateRate Auto

; -----

Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	TheTarget.InterruptCast()
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----