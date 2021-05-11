Scriptname ORD_Multishot_Script extends activemagiceffect  

; -----

; -----

Event OnPlayerBowShot(Weapon akWeapon, Ammo akAmmo, float afPower, bool abSunGazing)

	If afPower >= 0.9

		Utility.Wait(0.5)
		GetTargetActor().GetEquippedWeapon(0).Fire(GetTargetActor())

	EndIf

EndEvent

; -----
