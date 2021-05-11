Scriptname ORD_SoundAndExp_Script extends activemagiceffect  

; -----

Sound Property ORD_Sound Auto
Explosion Property ORD_Explosion Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Sound.Play(akTarget)
	akTarget.PlaceAtMe(ORD_Explosion)

EndEvent

; -----