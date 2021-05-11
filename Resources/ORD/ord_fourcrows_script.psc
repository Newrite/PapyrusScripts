Scriptname ORD_FourCrows_Script extends activemagiceffect  

; -----

Float Property ORD_PowerThreshold Auto
Spell Property ORD_Arc_Hailstorm_Spell_Proc Auto
Perk Property ORD_Arc80_Hailstorm_Perk_80 Auto
GlobalVariable Property ORD_Arc_FourCrows_Global_Count Auto
Actor Property PlayerRef Auto
Sound Property ORD_Arc_FourCrows_Marker_Fire Auto

; -----

Event OnPlayerBowShot(Weapon akWeapon, Ammo akAmmo, float afPower, bool abSunGazing)

	If afPower >= ORD_PowerThreshold

		; Four Crows
		ORD_Arc_FourCrows_Global_Count.Mod(1.0)
		If ORD_Arc_FourCrows_Global_Count.GetValue() >= 4.0
			ORD_Arc_FourCrows_Global_Count.SetValue(0.0)
	;	ElseIf ORD_Arc_FourCrows_Global_Count.GetValue() == 4.0
	;		ORD_Arc_FourCrows_Marker_Fire.Play(PlayerRef)
		EndIf

		; Hailstorm
		If PlayerRef.HasPerk(ORD_Arc80_Hailstorm_Perk_80)
			PlayerRef.DoCombatSpellApply(ORD_Arc_Hailstorm_Spell_Proc, PlayerRef)
		EndIf

	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(0.5)
	ORD_Arc_FourCrows_Global_Count.SetValue(0.0)

EndEvent

; -----