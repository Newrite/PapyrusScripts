Scriptname ORD_WindmillAttack_Script extends activemagiceffect  

; -----

Float Property ORD_UpdateRate Auto

; -----

Actor TargetActor
Int LeftWeapon
Int RightWeapon

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	RegisterForUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	LeftWeapon = TargetActor.GetEquippedItemType(0)
	RightWeapon = TargetActor.GetEquippedItemType(1)
	If (RightWeapon >= 1 && RightWeapon <= 4)
		If (LeftWeapon >= 1 && LeftWeapon <= 4)
			; dual wield
			Debug.SendAnimationEvent(TargetActor, "attackPowerStartDualWield")
		Else
			; right only
			Debug.SendAnimationEvent(TargetActor, "attackPowerStartInPlace")
		EndIf
	ElseIf (LeftWeapon >= 1 && LeftWeapon <= 4)
		; left only
		Debug.SendAnimationEvent(TargetActor, "attackPowerStartInPlaceLeftHand")
	Else
		Dispel()
	EndIf

EndEvent

; -----