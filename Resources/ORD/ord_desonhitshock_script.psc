Scriptname ORD_DesOnHitShock_Script extends activemagiceffect  

; -----

; most on hits
Spell Property ORD_Des_StaticField_Spell_Proc Auto

; stormblast
Spell Property ORD_Des_Stormblast_Spell_Proc Auto
GlobalVariable Property ORD_Des_Stormblast_Global_Trigger Auto
Perk Property ORD_Des90_Stormblast_Perk_90 Auto

; static field
Float Property ORD_StaticFieldFraction = 0.75 Auto Hidden
Sound Property ORD_Des_StaticField_Marker_Thunder Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	; static field
	If !akTarget.IsDead()

		Float TargetHealthPct = akTarget.GetActorValuePercentage("Health")
		If TargetHealthPct > ORD_StaticFieldFraction
			Float TargetHealth = akTarget.GetActorValue("Health")
			Float DamageRemaining = TargetHealth - ((TargetHealth / TargetHealthPct) * ORD_StaticFieldFraction)
			If DamageRemaining > 0
			;	DamageRemaining *= (100 - akTarget.GetActorValue("ElectricResist")) / 100
			;	If DamageRemaining > 0
			;		DamageRemaining *= (100 - akTarget.GetActorValue("MagicResist")) / 100
			;		If DamageRemaining > 0
						akTarget.DamageActorValue("Health", DamageRemaining)
						akTarget.DamageActorValue("Magicka", DamageRemaining)
						ORD_Des_StaticField_Marker_Thunder.Play(akTarget)
			;		EndIf
			;	EndIf
			EndIf
		EndIf
	EndIf

	; stormblast
	If ORD_Des_Stormblast_Global_Trigger.GetValue() == 1 && akCaster.HasPerk(ORD_Des90_Stormblast_Perk_90)
		ORD_Des_Stormblast_Global_Trigger.SetValue(0)
		akCaster.DoCombatSpellApply(ORD_Des_Stormblast_Spell_Proc, akTarget)
	EndIf

	; most on hits
	ORD_Des_StaticField_Spell_Proc.Cast(akCaster, akTarget)

EndEvent

; -----