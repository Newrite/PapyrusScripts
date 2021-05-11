Scriptname ORD_TrapHitBase_Script extends ObjectReference  

; -----

Sound Property ORD_TrapHitSound Auto
Int Property ORD_Damage Auto Hidden

Float Property ORD_StaggerAmount = 0.0 Auto
Spell Property ORD_GhostAbility Auto
Int Property ORD_TrapPushBack Auto
Float Property ORD_SoundResetDelay Auto
Int Property ORD_SoundLevel Auto

Float Property ORD_RumbleAmount Auto
Float Property ORD_RumbleDuration Auto
Float Property ORD_CameraShakeAmount Auto

Spell Property ORD_Loc_Trap_Spell_Proc Auto
Spell Property ORD_Loc_TrapBurst_Spell_Proc Auto

Message Property ORD_Loc_BearTrap_Message Auto

Float Property ORD_SkillMult = 0.04 Auto Hidden

; -----

Bool SoundCanPlay

; -----

State CanHit	

	Event OnTrapHitStart(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)

		If !(akTarget as Actor).HasSpell(ORD_GhostAbility)
			GoToState("CannotHit")
			ORD_Loc_BearTrap_Message.Show()

			Actor PlayerRef = Game.GetPlayer()
			PlayerRef.DoCombatSpellApply(ORD_Loc_Trap_Spell_Proc, (akTarget as Actor))
			If ORD_Loc_TrapBurst_Spell_Proc
				ORD_Loc_TrapBurst_Spell_Proc.RemoteCast(Self, PlayerRef)
			EndIf

;			akTarget.ProcessTrapHit(Self, ORD_Damage, ORD_TrapPushBack, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, ORD_StaggerAmount)
			akTarget.ProcessTrapHit(Self, 1.0, ORD_TrapPushBack, afXVel, afYVel, afZVel, afXPos, afYPos, afZPos, aeMaterial, ORD_StaggerAmount)
			If (akTarget as Actor).IsHostileToActor(PlayerRef)
				Game.AdvanceSkill("Lockpicking", ORD_Damage * ORD_SkillMult)
			EndIf

			If SoundCanPlay
				SoundCanPlay = false
				If ORD_TrapHitSound
					ORD_TrapHitSound.Play(Self as ObjectReference)
				EndIf
				RegisterForSingleUpdate(ORD_SoundResetDelay)
			EndIf

			CreateDetectionEvent(akTarget as Actor, ORD_SoundLevel)
			If akTarget == PlayerRef
				Game.ShakeController(ORD_RumbleAmount, ORD_RumbleAmount, ORD_RumbleDuration)
				If ORD_CameraShakeAmount
					Game.ShakeCamera(PlayerRef,ORD_CameraShakeAmount, ORD_RumbleDuration)
				EndIf
			EndIf
		EndIf

	EndEvent

EndState

; -----

Auto State CannotHit

	Event OnTrapHit(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
	EndEvent

EndState

; -----
	
Event OnUpdate()

	SoundCanPlay = true

EndEvent

; -----