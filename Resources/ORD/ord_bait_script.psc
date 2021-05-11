Scriptname ORD_Bait_Script extends activemagiceffect  

; -----

Quest Property ORD_Bait_Quest Auto
Message Property ORD_Loc_Bait_Message_Fail Auto
Float Property ORD_DelayUntilCheck Auto
EffectShader Property ORD_Loc_Bait_FXS Auto
Float Property ORD_UpdateRate Auto
ReferenceAlias Property ORD_TargetRef Auto
ReferenceAlias Property ORD_TrapRef Auto
Message Property ORD_Loc_Bait_Message Auto
Sound Property ORD_Loc_Bait_Sound Auto

; -----

Actor BaitTarget
ObjectReference BaitTrap

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Bait_Quest.Start()
	ORD_Loc_Bait_Sound.Play(akTarget)
	Utility.Wait(ORD_DelayUntilCheck)
	If !ORD_Bait_Quest.IsRunning()
		; no valid target found
		ORD_Loc_Bait_Message_Fail.Show()
		Dispel()
	Else
		; valid target found
		ORD_Loc_Bait_Message.Show()
		BaitTarget = ORD_TargetRef.GetActorRef()
		BaitTrap = ORD_TrapRef.GetRef()
		ORD_Loc_Bait_FXS.Play(BaitTarget)
		ORD_Loc_Bait_FXS.Play(BaitTrap)
		RegisterForUpdate(ORD_UpdateRate)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Bait_Quest.Stop()
	ORD_Loc_Bait_FXS.Stop(BaitTarget)
	ORD_Loc_Bait_FXS.Stop(BaitTrap)

EndEvent

; -----

Event OnUpdate()

	If !BaitTrap || BaitTrap.IsDisabled() || !BaitTarget || BaitTarget.IsDead()
		Dispel()
	EndIf

EndEvent

; -----