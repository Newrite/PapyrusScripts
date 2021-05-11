Scriptname ORD_TimedBlock_Proc_Script extends activemagiceffect  

; -----

Sound Property ORD_Bck_TimedBlock_Marker Auto
Spell Property ORD_Bck_TimedBlock_Spell_Proc Auto
Actor Property PlayerRef Auto
Message Property ORD_Bck_TimedBlock_Message Auto
GlobalVariable Property ORD_Bck_DisabledTimedBlockMessage_Global Auto

Perk Property ORD_Bck40_ApocalypseProof_Perk_40_OrdASISExclude Auto
Keyword Property MagicDamageFire Auto
Keyword Property MagicDamageFrost Auto
Keyword Property MagicDamageShock Auto
Spell Property ORD_Bck_TimedBlock_Spell_ToTarget Auto
Spell Property ORD_Bck_TimedBlock_Spell_ToTarget_NoStagger Auto
Float Property ORD_DistanceLimit Auto

; -----

Bool HasBlocked = false

; -----

Auto State IsListening

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	GoToState("IsNotListening")
	If abHitBlocked
		; confirm timed block

		HasBlocked = true
		ORD_Bck_TimedBlock_Marker.Play(PlayerRef)
		Actor TheAttacker = akAggressor as Actor

		If ORD_Bck_DisabledTimedBlockMessage_Global.GetValue() == 0
			ORD_Bck_TimedBlock_Message.Show()
		EndIf

		If TheAttacker && TheAttacker.GetDistance(PlayerRef) <= ORD_DistanceLimit
			ORD_Bck_TimedBlock_Spell_ToTarget.Cast(PlayerRef, TheAttacker)
		EndIf

	ElseIf (akSource as Spell) && (akSource as Spell).IsHostile()		; fast fail
		; incoming hostile spell

		If PlayerRef.HasPerk(ORD_Bck40_ApocalypseProof_Perk_40_OrdASISExclude) && (akSource.HasKeyword(MagicDamageFire) || akSource.HasKeyword(MagicDamageFrost) || akSource.HasKeyword(MagicDamageShock))
			; if spell is elemental and player has the perk
			; confirm elemental timed block

			HasBlocked = true
			Actor TheAttacker = akAggressor as Actor

			If TheAttacker && TheAttacker.GetDistance(PlayerRef) <= ORD_DistanceLimit
				ORD_Bck_TimedBlock_Spell_ToTarget_NoStagger.Cast(PlayerRef, TheAttacker)
			EndIf

		EndIf
	EndIf
	GoToState("IsListening")

EndEvent

EndState

; -----

State IsNotListening


EndState

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If HasBlocked
		; timed block confirmed, dispel cooldowns
		PlayerRef.DispelSpell(ORD_Bck_TimedBlock_Spell_Proc)
	EndIf

EndEvent

; -----