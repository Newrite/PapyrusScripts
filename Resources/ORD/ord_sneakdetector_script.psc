Scriptname ORD_SneakDetector_Script extends activemagiceffect  

; -----

Float Property ORD_Recover Auto
GlobalVariable Property ORD_Alc_SneakDetector_Global_SneakFlag Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Alc_SneakDetector_Global_SneakFlag.SetValue(1)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(0.4)
	ORD_Alc_SneakDetector_Global_SneakFlag.SetValue(0)

EndEvent

; -----