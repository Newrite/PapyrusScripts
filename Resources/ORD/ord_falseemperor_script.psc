Scriptname ORD_FalseEmperor_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
MagicEffect Property ORD_Ill_CommandingPresence_Effect_CloakProc Auto
Float Property ORD_Radius = 320.0 Auto
Int Property ORD_Cycles Auto
Spell Property ORD_Ill_ProtectYourGod_Spell_Proc Auto
Float Property ORD_ResetDelay Auto

; -----

Auto State ListeningToHits

Event OnBeginState()

EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If (akAggressor as Actor) && (akSource as Weapon)
		GotoState("NotListening")
		Actor HelperActor
		Int i = 0
		While i < ORD_Cycles
			HelperActor = Game.FindRandomActorFromRef(PlayerRef, ORD_Radius)
			If HelperActor.HasMagicEffect(ORD_Ill_CommandingPresence_Effect_CloakProc)
				PlayerRef.DoCombatSpellApply(ORD_Ill_ProtectYourGod_Spell_Proc,HelperActor)
				HelperActor.StopCombat()
				HelperActor.StartCombat(akAggressor as Actor)
				Return
			Else
				i += 1
			EndIf
		EndWhile
	EndIf

EndEvent

EndState

; -----

State NotListening

Event OnBeginState()

	RegisterForSingleUpdate(ORD_ResetDelay)

EndEvent

Event OnUpdate()

	GotoState("ListeningToHits")

EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

EndEvent

EndState

; -----