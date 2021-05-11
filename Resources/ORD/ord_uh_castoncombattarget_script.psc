Scriptname ORD_UH_CastOnCombatTarget_Script extends activemagiceffect  


; -----

Float Property ORD_Delay Auto
Float Property ORD_DelayMax Auto
Spell Property ORD_Spell Auto
Idle Property ORD_PlayIdle Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(Utility.RandomFloat(ORD_Delay, ORD_DelayMax))

EndEvent

; -----

Event OnUpdate()

	Actor TheAtronach = GetTargetActor()
	Actor TheTarget = TheAtronach.GetCombatTarget()
	If TheTarget
		If ORD_PlayIdle
			TheAtronach.PlayIdle(ORD_PlayIdle)
		EndIf
		TheAtronach.DoCombatSpellApply(ORD_Spell, TheTarget)
	EndIf

EndEvent

; -----