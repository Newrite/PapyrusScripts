Scriptname ORD_OilSpawner_Script extends activemagiceffect  

; -----

Activator Property ORD_Alc_ElementalOil_Activator Auto
Sound Property ORD_Alt_ElementalOil_Marker Auto

; -----

ObjectReference ThePuddle

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Alt_ElementalOil_Marker.Play(akTarget)
	ThePuddle = akTarget.PlaceAtMe(ORD_Alc_ElementalOil_Activator)
	ThePuddle.SetAngle(0,0,Utility.RandomFloat(-180, 180))

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ThePuddle.Disable()
	ThePuddle.Delete()

EndEvent

; -----