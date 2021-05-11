Scriptname ORD_AlphaStrike_Script extends activemagiceffect  

; -----

Float Property ORD_AlphaFraction Auto
ImagespaceModifier Property ORD_ISMD Auto
Float Property ORD_ISMDStrengthMult Auto
Sound Property ORD_Sound Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float TargetHealthPct = akTarget.GetActorValuePercentage("Health")
	Float TargetHealth = akTarget.GetActorValue("Health")
	If TargetHealthPct > ORD_AlphaFraction
		Float DamageRemaining = TargetHealth - ((TargetHealth / TargetHealthPct) * ORD_AlphaFraction)
		If DamageRemaining > 0 && !akTarget.IsDead()
			akTarget.DamageActorValue("Health", DamageRemaining)
			ORD_ISMD.Apply((TargetHealthPct - ORD_AlphaFraction)*ORD_ISMDStrengthMult)
			ORD_Sound.Play(akTarget)
		EndIf
	EndIf

EndEvent

; -----