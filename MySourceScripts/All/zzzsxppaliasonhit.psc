Scriptname zzzSXPPAliasOnHit extends ReferenceAlias

MiscObject Property MISC_HitToken Auto

Auto State Active
Event OnHit( ObjectReference pAttacker, Form pSource, Projectile pProjectile, bool bPowerAttack, bool bSneakAttack, bool bBashAttack, bool bHitBlocked )
	GoToState("Empty")
EndEvent
EndState

State Empty
EndState