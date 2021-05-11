Scriptname ORD_TimingStreak_Script extends activemagiceffect  

; -----

MagicEffect Property ORD_Bck_TimedBlock_Effect_Proc Auto
Actor Property PlayerRef Auto
GlobalVariable Property ORD_Bck_TimingStreak_Global_Count Auto
Float Property ORD_StaminaPerStreak Auto
Float Property ORD_StreakCap Auto
Message Property ORD_Blk_TimingStreak_Message Auto
Perk Property ORD_Bck80_BreakTheirTeeth_Perk_80 Auto
Perk Property ORD_Bck90_Deliverance_Perk_90 Auto
Spell Property ORD_Bck_BreakTheirTeeth_Spell Auto
Spell Property ORD_Bck_Deliverance_Spell_Proc Auto
EffectShader Property ORD_Bck_TimingStreak_FXS Auto
Explosion Property ORD_Bck_TimingStreak_Explosion Auto

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	GoToState("IsNotListening")

	If (akSource as Weapon)
		If abHitBlocked && PlayerRef.HasMagicEffect(ORD_Bck_TimedBlock_Effect_Proc)
			; successful timed block
			; fairly script light because it only does the magic effect check on blocked hits

			ORD_Bck_TimingStreak_Global_Count.Mod(1.0)
			If ORD_Bck_TimingStreak_Global_Count.GetValue() >= ORD_StreakCap

				; reset counter
				ORD_Bck_TimingStreak_Global_Count.SetValue(0.0)
				PlayerRef.PlaceAtMe(ORD_Bck_TimingStreak_Explosion)

				; break their teeth
				If PlayerRef.HasPerk(ORD_Bck80_BreakTheirTeeth_Perk_80) && (akAggressor as Actor)
					PlayerRef.DoCombatSpellApply(ORD_Bck_BreakTheirTeeth_Spell, (akAggressor as Actor))
				EndIf

				; deliverance
				If PlayerRef.HasPerk(ORD_Bck90_Deliverance_Perk_90)
					PlayerRef.DoCombatSpellApply(ORD_Bck_Deliverance_Spell_Proc, PlayerRef)
				EndIf

				; refund stamina
				ORD_Bck_TimingStreak_FXS.Play(PlayerRef, 0.5)
				PlayerRef.RestoreActorValue("Stamina",ORD_StaminaPerStreak)
				ORD_Blk_TimingStreak_Message.Show()
			EndIf

		Else
			; player did an untimed block or did not block

			If !abBashAttack
				; excluding those annoying bashes
				ORD_Bck_TimingStreak_Global_Count.SetValue(0.0)
			EndIf
		EndIf

	EndIf
	GoToState("IsListening")

EndEvent

; -----

State IsNotListening


EndState

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Bck_TimingStreak_Global_Count.SetValue(0.0)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Bck_TimingStreak_Global_Count.SetValue(0.0)

EndEvent

; -----