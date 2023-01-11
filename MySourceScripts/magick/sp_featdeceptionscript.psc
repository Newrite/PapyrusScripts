Scriptname SP_FeatDeceptionScript extends ActiveMagicEffect  
Spell Property Invis auto

Actor target
actor caster

Event OnEffectStart(Actor akTarget, Actor akCaster)
target = aktarget
caster = akcaster

endevent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)
self.dispel()
if absneakattack
Invis.cast(caster)
endif
endevent

