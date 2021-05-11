Scriptname ORD_ResonanceCascade_Script extends activemagiceffect  

; -----

Float Property ORD_Delay Auto
Spell Property ORD_Alt_ResonanceCascade_Spell_Proc Auto

; -----

Actor TargetActor
Actor CasterActor

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	CasterActor = akCaster

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If (akSource as Weapon) && akAggressor == CasterActor && !TargetActor.IsDead()
		RegisterForSingleUpdate(ORD_Delay)
	EndIf

EndEvent

; -----

Event OnUpdate()

	CasterActor.DoCombatSpellApply(ORD_Alt_ResonanceCascade_Spell_Proc, TargetActor)

EndEvent

; -----