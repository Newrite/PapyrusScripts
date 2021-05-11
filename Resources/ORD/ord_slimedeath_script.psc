Scriptname ORD_SlimeDeath_Script extends ActiveMagicEffect  

; -----

Sound Property ORD_DeathSound Auto

Formlist Property DisintegrationMainImmunityList Auto
EffectShader Property ORD_Res_Necro_FXS_Goo Auto

Activator Property AshPileObject Auto

; -----

Event OnDeath(Actor akKiller)

	Actor akTarget = GetTargetActor()

	If ORD_DeathSound
		ORD_DeathSound.Play(akTarget)
	EndIf

	; disintegrate
	Race VictimRace = (akTarget.GetBaseObject() as ActorBase).GetRace()
	If !DisintegrationMainImmunityList.HasForm(VictimRace)
		akTarget.SetCriticalStage(akTarget.CritStage_GooStart)
		ORD_Res_Necro_FXS_Goo.Play(akTarget, 4.0)
		Utility.Wait(1.25)     
		akTarget.AttachAshPile(AshPileObject)
		Utility.Wait(1.65)
		ORD_Res_Necro_FXS_Goo.Stop(akTarget)
		akTarget.SetAlpha (0.0,True)
		akTarget.SetCriticalStage(akTarget.CritStage_GooEnd)
	EndIf

EndEvent

; -----