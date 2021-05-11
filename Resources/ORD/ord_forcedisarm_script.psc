Scriptname ORD_ForceDisarm_Script extends activemagiceffect  

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Weapon LeftWeapon = akTarget.GetEquippedWeapon(0)
	If LeftWeapon
		akTarget.UnequipItem(LeftWeapon)
		akTarget.DropObject(LeftWeapon)
	EndIf
	Weapon RightWeapon = akTarget.GetEquippedWeapon(1)
	If RightWeapon
		akTarget.UnequipItem(RightWeapon)
		akTarget.DropObject(RightWeapon)
	EndIf

EndEvent

; -----