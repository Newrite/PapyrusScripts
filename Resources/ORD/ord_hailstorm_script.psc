Scriptname ORD_Hailstorm_Script extends activemagiceffect  

; -----

Spell Property ORD_Arc_Hailstorm_Spell_Proc Auto
Spell Property ORD_Arc_Hailstorm_Spell_Proc_FirstNoQuickShot Auto
Float Property ORD_PowerThreshold Auto
Actor Property PlayerRef Auto

; -----

Event OnPlayerBowShot(Weapon akWeapon, Ammo akAmmo, float afPower, bool abSunGazing)

	If afPower >= ORD_PowerThreshold
		If PlayerRef.GetAV("WeaponSpeedMult") != 0.00
			; speed is already increased
			PlayerRef.DoCombatSpellApply(ORD_Arc_Hailstorm_Spell_Proc, PlayerRef)
		Else
			; speed is not yet increased
			PlayerRef.DoCombatSpellApply(ORD_Arc_Hailstorm_Spell_Proc_FirstNoQuickShot, PlayerRef)
		EndIf
	EndIf

EndEvent

; -----