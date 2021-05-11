Scriptname ORD_Initiative_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Perk Property ORD_Lia90_KeenSenses_Perk_90 Auto

Spell Property ORD_Lia_Initiative_Spell_Proc Auto

GlobalVariable Property ORD_Lia_Wardancer_Global_Blocked Auto
GlobalVariable Property ORD_Lia_Wardancer_Global_Delay Auto

Spell Property ORD_Lia_TemptingFate_Spell_Proc Auto

Keyword Property MagicInvisibility Auto
MagicEffect Property VoiceMakeEthereal auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Lia_Wardancer_Global_Blocked.SetValue(0)

	; initiative proc
	If !PlayerRef.HasMagicEffect(VoiceMakeEthereal) && !PlayerRef.HasEffectKeyword(MagicInvisibility)
		ORD_Lia_Initiative_Spell_Proc.Cast(PlayerRef)
	EndIf

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akAggressor != PlayerRef

		If !abHitBlocked && !(akSource as Spell) || (akSource as Spell).IsHostile()
			; wardancer toggle
			ORD_Lia_Wardancer_Global_Blocked.SetValue(1)
			RegisterForSingleUpdate(ORD_Lia_Wardancer_Global_Delay.GetValue())
		EndIf

		If abPowerAttack
			; tempting fate dispel
			PlayerRef.DispelSpell(ORD_Lia_TemptingFate_Spell_Proc)
		EndIf

	EndIf

EndEvent

; -----

Event OnUpdate()

	ORD_Lia_Wardancer_Global_Blocked.SetValue(0)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Lia_Wardancer_Global_Blocked.SetValue(0)
	Utility.Wait(0.5)
	akTarget.DispelSpell(ORD_Lia_Initiative_Spell_Proc)
	akTarget.DispelSpell(ORD_Lia_TemptingFate_Spell_Proc)

EndEvent

; -----