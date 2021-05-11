Scriptname ORD_HailstormNew_Script extends activemagiceffect  

; -----

Float Property ORD_PowerThreshold Auto
Spell Property ORD_Arc_Hailstorm_Spell_Proc Auto
Actor Property PlayerRef Auto

; -----

Event OnPlayerBowShot(Weapon akWeapon, Ammo akAmmo, float afPower, bool abSunGazing)

	If afPower >= ORD_PowerThreshold
		PlayerRef.DoCombatSpellApply(ORD_Arc_Hailstorm_Spell_Proc, PlayerRef)
	EndIf

EndEvent

; -----
Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.DispelSpell(ORD_Arc_Hailstorm_Spell_Proc)

EndEvent

; -----