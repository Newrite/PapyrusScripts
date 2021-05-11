Scriptname ORD_DeathBlossom_Self_Script extends activemagiceffect  

; -----

FormList Property ORD_Sne_DeathBlossom_FormList Auto
Float Property ORD_Wait Auto
Idle Property ORD_Idle Auto
Float Property ORD_Delay Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(ORD_Delay)
	Int i = 0
	Actor TheTarget
;	Game.ForceThirdPerson()
	Game.SetPlayerAIDriven(true)
	While i < ORD_Sne_DeathBlossom_FormList.GetSize()
		TheTarget = ORD_Sne_DeathBlossom_FormList.GetAt(i) as Actor
		akCaster.MoveTo(TheTarget)
		akCaster.PlayIdleWithTarget(ORD_Idle, TheTarget)
	;	akCaster.PlayIdle(ORD_Idle)
		While ORD_Sne_DeathBlossom_FormList.GetAt(i) as Actor
			Utility.Wait(ORD_Wait)
			akCaster.PlayIdleWithTarget(ORD_Idle, TheTarget)
	;		akCaster.PlayIdle(ORD_Idle)
		EndWhile
		i += 1
	EndWhile
	ORD_Sne_DeathBlossom_FormList.Revert()
	Game.SetPlayerAIDriven(false)
	Dispel()

EndEvent

; -----