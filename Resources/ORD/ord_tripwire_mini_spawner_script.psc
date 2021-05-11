Scriptname ORD_Tripwire_Mini_Spawner_Script extends activemagiceffect  

; -----

Activator Property ORD_Sne_Tripwire_Activator Auto
Float Property ORD_DistanceZ Auto
Float Property ORD_DistanceInFront Auto
Float Property ORD_SpawnDelay Auto
Actor Property PlayerRef Auto

; -----

ObjectReference CreatedTripWire

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_SpawnDelay)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	CreatedTripWire.Disable(true)
	CreatedTripWire.Delete()

EndEvent

; -----

Event OnUpdate()

	CreatedTripWire = PlayerRef.PlaceAtMe(ORD_Sne_Tripwire_Activator, 1, false, true)
	Float CharacterAngle = PlayerRef.GetAngleZ()
	CreatedTripWire.MoveTo(PlayerRef,ORD_DistanceInFront*Math.Sin(CharacterAngle),ORD_DistanceInFront*Math.Cos(CharacterAngle),ORD_DistanceZ)
	CreatedTripWire.SetAngle(0,0,CharacterAngle)
	CreatedTripWire.Enable()

EndEvent

; -----