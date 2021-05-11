Scriptname ORD_Fail_Script extends activemagiceffect  

; -----

Message Property ORD_Message_Fail Auto
Sound Property MAGFail Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	MAGFail.Play(akTarget)
	ORD_Message_Fail.Show()

EndEvent

; -----