Scriptname ORD_Magnetize_Script extends activemagiceffect  

; -----

Activator Property FXEmptyActivator Auto
Float Property ORD_LiftSpeed Auto

; -----

ObjectReference TheBox
Bool Fail = false

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget.IsDead() == false
		Fail = false
		TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
		TheBox.MoveTo(akTarget, 0,0,1000)
		akTarget.TranslateToRef(TheBox, ORD_LiftSpeed)
	Else
		Fail = true
		Dispel()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If !Fail
		Utility.Wait(0.1)
		akTarget.StopTranslation()
		TheBox.Delete()
	EndIf

EndEvent

; -----

Event OnDying(Actor akKiller)

	Dispel()

EndEvent

; -----