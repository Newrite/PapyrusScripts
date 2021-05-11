Scriptname ORD_SmokeCurtain_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Activator Property ORD_Sne_SmokeCurtain_Activator Auto
Spell Property ORD_Sne_SmokeCurtain_Spell_Ping Auto
Float Property ORD_UpdateRate Auto

; -----

ObjectReference TheCloud

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheCloud = PlayerRef.PlaceAtMe(ORD_Sne_SmokeCurtain_Activator)
	TheCloud.SetAngle(0,0,0)
	RegisterforSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheCloud.Disable(true)
	TheCloud.Delete()

EndEvent

; -----

Event OnUpdate()

	If TheCloud
		ORD_Sne_SmokeCurtain_Spell_Ping.RemoteCast(TheCloud, PlayerRef)
		RegisterforSingleUpdate(ORD_UpdateRate)
	EndIf

EndEvent

; -----