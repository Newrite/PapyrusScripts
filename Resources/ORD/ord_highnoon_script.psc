Scriptname ORD_HighNoon_Script extends activemagiceffect  

; -----

GlobalVariable Property GameHour Auto
GlobalVariable Property ORD_Arc_Deadeye_Global_Damage Auto
Float Property ORD_HPPerTick Auto
Float Property ORD_TickRate Auto
Spell Property ORD_Arc_DeadeyeNew_Spell Auto
Float Property ORD_EndDelay Auto
Sound Property ORD_Arc_Deadeye_Marker_Cast auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Arc_Deadeye_Marker_Cast.Play(akTarget)
	ORD_Arc_Deadeye_Global_Damage.SetValue(0)
	RegisterForUpdate(ORD_TickRate)
	Float GameHourValue = GameHour.GetValue()
	If GameHourValue >= 11.5 && GameHourValue < 12.0
		GameHour.SetValue(12)
	EndIf

EndEvent

; -----

Event OnUpdate()

	ORD_Arc_Deadeye_Global_Damage.Mod(ORD_HPPerTick)

EndEvent

; -----

;Event OnPlayerBowShot(Weapon akWeapon, Ammo akAmmo, float afPower, bool abSunGazing)

;	Utility.Wait(ORD_EndDelay)
;	Game.GetPlayer().DispelSpell(ORD_Arc_DeadeyeNew_Spell)

;EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(1.5)
	ORD_Arc_Deadeye_Global_Damage.SetValue(0)

EndEvent

; -----