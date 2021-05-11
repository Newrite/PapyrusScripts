Scriptname ORD_IcedEarth_Script extends activemagiceffect  

; -----

Keyword Property MagicDamageFrost Auto
Hazard Property ORD_Des_IcedEarth_Hazard Auto

; -----

Event OnSpellCast(Form akSpell)

	Actor TargetActor = GetTargetActor()
	If akSpell.HasKeyword(MagicDamageFrost) && TargetActor.GetAnimationVariableBool("IsCastingDual")
		TargetActor.PlaceAtMe(ORD_Des_IcedEarth_Hazard).SetActorCause(TargetActor)
	EndIf

EndEvent

; -----