Scriptname ORD_LionsArrow_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
FormList Property ORD_Arc_LionsArrow_FormList Auto

; -----

Event OnPlayerBowShot(Weapon akWeapon, Ammo akAmmo, float afPower, bool abSunGazing)

	If afPower > 0.9
		(ORD_Arc_LionsArrow_FormList.GetAt(0) as Spell).Cast(PlayerRef)
	EndIf

EndEvent

; -----