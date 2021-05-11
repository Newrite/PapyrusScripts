Scriptname ORD_Incendiaries_Script extends ObjectReference  

; -----

Keyword Property MagicDamageFire Auto
Spell Property ORD_Smh_Incendiaries_Spell_Proc Auto
Float Property ORD_MaxDur Auto
Projectile Property ORD_Smh_DwarvenAutocannon_Projectile_Proc Auto

; -----

Event OnLoad()

	RegisterForSingleUpdate(ORD_MaxDur)

EndEvent

; -----

Event OnHit(objectReference akAggressor, form akWeapon, projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akWeapon.HasKeyword(MagicDamageFire) || akProjectile.HasKeyword(MagicDamageFire)
		GoToState("DoNothing")
		Self.SetActorCause(akAggressor as Actor)
		Detonate()
	ElseIf akProjectile == ORD_Smh_DwarvenAutocannon_Projectile_Proc
		GoToState("DoNothing")
		OnUpdate()
	EndIf

EndEvent

; -----

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

	If akEffect.HasKeyword(MagicDamageFire)
		GoToState("DoNothing")
		Self.SetActorCause(akCaster as Actor)
		Detonate()
	EndIf

EndEvent

; -----	

State DoNothing

	Event OnHit(objectReference akAggressor, form akWeapon, projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	EndEvent

	Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	EndEvent
	
EndState

; -----

Function Detonate()

	ORD_Smh_Incendiaries_Spell_Proc.Cast(Self)
	Self.Disable()
	Self.Delete()

EndFunction

; -----

Event OnUpdate()

	GoToState("DoNothing")
	Self.Disable(true)
	Self.Delete()

EndEvent

; -----