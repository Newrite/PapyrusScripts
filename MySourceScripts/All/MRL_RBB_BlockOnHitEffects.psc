Scriptname MRL_RBB_BlockOnHitEffects extends ActiveMagicEffect  

Spell Property StaminaRestore Auto
Spell Property AttackBuff Auto

Actor Blocker

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Blocker = akCaster
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	

	if abHitBlocked
		StaminaRestore.Cast(Blocker, Blocker)
		AttackBuff.Cast(Blocker, Blocker)
	endif

EndEvent