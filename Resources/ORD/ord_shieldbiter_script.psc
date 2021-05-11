Scriptname ORD_Shieldbiter_Script extends activemagiceffect  

; -----

Bool Property ORD_AlsoDrop Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Armor EquippedShield = akTarget.GetEquippedShield()
	If EquippedShield
		akTarget.UnequipItem(EquippedShield)
		If ORD_AlsoDrop
			akTarget.DropObject(EquippedShield,1)
		EndIf
	EndIf

EndEvent

; -----