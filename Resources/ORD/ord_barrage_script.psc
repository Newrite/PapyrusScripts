Scriptname ORD_Barrage_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Ammo Property ORD_Arc_BlanketShot_Ammo Auto
Ammo Property NordHeroArrow Auto
Spell Property ORD_Con_BoneCollector_Spell_Stagger Auto

; -----

;Event OnPlayerBowShot(Weapon akWeapon, Ammo akAmmo, float afPower, bool abSunGazing)

;	If akAmmo != ORD_Arc_BlanketShot_Ammo
;		PlayerRef.GetEquippedWeapon(0).Fire(PlayerRef, ORD_Arc_BlanketShot_Ammo)
;	EndIf

;EndEvent

; -----

; -----


; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForUpdate(0.25)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

EndEvent

; -----

Event OnUpdate()

	PlayerRef.GetEquippedWeapon(0).Fire(PlayerRef, ORD_Arc_BlanketShot_Ammo)
;	Game.ShakeCamera(PlayerRef, 0.25, 1)
;	ORD_Con_BoneCollector_Spell_Stagger.Cast(PlayerRef)
;	PlayerRef.DrawWeapon()

EndEvent

; -----