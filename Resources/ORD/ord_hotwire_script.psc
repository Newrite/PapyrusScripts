Scriptname ORD_Hotwire_Script extends activemagiceffect  

; -----

Quest Property ORD_Hotwire_Quest Auto
Float Property ORD_WaitBeforeRestart Auto
Float Property ORD_WaitBeforeCheck Auto
Message Property ORD_Loc_Hotwire_Message_Fail Auto
Float Property ORD_XPMult Auto
Spell Property ORD_Loc_Lockdown_Spell_Proc Auto

Float Property ORD_LevelToLevelMult Auto

Sound Property ORD_Loc_Hotwire_Marker_Impact Auto
Container Property ORD_Loc_Lockdown_Container Auto
Float Property ORD_DeltaZ Auto
Float Property ORD_WindowOfTime Auto
Message Property ORD_Loc_Lockdown_Message_Fail Auto
Spell Property ORD_Loc_Lockdown_Spell_Proc_Lockout Auto

; -----

ObjectReference LockDummy
Bool IsWithinAllowedTime

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_Hotwire_Quest.IsRunning()
		ORD_Hotwire_Quest.Stop()
	EndIf

	IsWithinAllowedTime = true
	LockDummy = akCaster.PlaceAtMe(ORD_Loc_Lockdown_Container)
	LockDummy.MoveTo(akCaster, 0, 0, ORD_DeltaZ)
	LockDummy.Lock()
	Int LockStrength = Math.Floor(akTarget.GetLevel() * ORD_LevelToLevelMult)
	If LockStrength > 100
		LockDummy.SetLockLevel(100)
	Else
		LockDummy.SetLockLevel(LockStrength)
	EndIf
	LockDummy.Activate(akCaster)
	RegisterForSingleUpdate(0.1)

	Utility.WaitMenuMode(ORD_WindowOfTime)
	IsWithinAllowedTime = false

EndEvent

; -----

Event OnUpdate()

	If LockDummy.IsLocked()
		Dispel()
		Game.GetPlayer().DoCombatSpellApply(ORD_Loc_Lockdown_Spell_Proc_Lockout, GetTargetActor())
	ElseIf !IsWithinAllowedTime
		Dispel()
		ORD_Loc_Lockdown_Message_Fail.Show()
		Game.GetPlayer().DoCombatSpellApply(ORD_Loc_Lockdown_Spell_Proc_Lockout, GetTargetActor())
	Else
		Actor TargetActor = GetTargetActor()
		ORD_Loc_Hotwire_Marker_Impact.Play(TargetActor)
		ORD_Hotwire_Quest.Start()
		TargetActor.DispelSpell(ORD_Loc_Lockdown_Spell_Proc)
		Utility.Wait(ORD_WaitBeforeCheck)
		If !ORD_Hotwire_Quest.IsRunning()
			ORD_Loc_Hotwire_Message_Fail.Show()
		EndIf
		Dispel()
	EndIf
	LockDummy.Delete()

EndEvent

; -----