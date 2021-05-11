Scriptname ORD_OilTrap_Script extends ObjectReference

; -----

Keyword Property ORD_Keyword Auto
String OilAnim = "stopeffect"
String OilDisappearEvent ="end"
;Explosion Property ORD_Explosion Auto
Spell Property ORD_Alc_ElementalOil_Spell_Proc Auto
Float Property ORD_MaxDur Auto
Spell Property ORD_Alc_ElementalOil_Spell_Power Auto
Spell Property ORD_Alc_ElementalOil_Spell_SelfPower Auto
Actor Property PlayerRef Auto

; -----

Auto State DoSomething

	Event OnHit(objectReference akAggressor, form akWeapon, projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	;	If akWeapon.HasKeyword(ORD_Keyword) || akProjectile.HasKeyword(ORD_Keyword)
		If (akAggressor as Actor)
			GoToState("DoNothing")
			Self.SetActorCause(akAggressor as Actor)
			(Self as ObjectReference).DamageObject(5.0)
		EndIf

	EndEvent

	Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

		If akEffect.HasKeyword(ORD_Keyword)
			GoToState("DoNothing")
			Self.SetActorCause(akCaster as Actor)
			(Self as ObjectReference).DamageObject(5.0)
		EndIf

	EndEvent

EndState

; -----	

State DoNothing

	Event OnHit(objectReference akAggressor, form akWeapon, projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	EndEvent

	Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	EndEvent
	
EndState

; -----

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)

	If aiCurrentStage == 2
		ORD_Alc_ElementalOil_Spell_Proc.RemoteCast(Self, PlayerRef)
		PlayAnimationAndWait(OilAnim, OilDisappearEvent)
		PlayerRef.DispelSpell(ORD_Alc_ElementalOil_Spell_Power)
		PlayerRef.DispelSpell(ORD_Alc_ElementalOil_Spell_SelfPower)
		Disable()
		Delete()
	EndIf

EndEvent

; -----