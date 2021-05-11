Scriptname ORD_Avalanche_Script extends activemagiceffect  

; -----

Spell Property ORD_Two_Avalanche_Spell_Stagger Auto
Actor Property PlayerRef Auto

; -----

Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If (akSource as Weapon) && !abHitBlocked
		ORD_Two_Avalanche_Spell_Stagger.Cast(PlayerRef, TheTarget)
	EndIf

EndEvent

; -----