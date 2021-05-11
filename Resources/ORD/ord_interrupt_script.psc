Scriptname ORD_Interrupt_Script extends activemagiceffect  

; -----

Sound Property ORD_Des_HarshLesson_Marker Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.InterruptCast()
	ORD_Des_HarshLesson_Marker.Play(akTarget)

EndEvent

; -----