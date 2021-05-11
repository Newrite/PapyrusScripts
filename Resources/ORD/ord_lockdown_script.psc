Scriptname ORD_Lockdown_Script extends activemagiceffect  

; -----

Sound Property ORD_Loc_Lockdown_Marker_Impact Auto
Container Property ORD_Loc_Lockdown_Container Auto
Float Property ORD_DeltaZ Auto
Float Property ORD_XPMult Auto
String PRoperty ORD_Skill Auto
Float Property ORD_HealthToLevelMult Auto
Float Property ORD_WindowOfTime Auto
Message Property ORD_Loc_Lockdown_Message Auto
Message Property ORD_Loc_Lockdown_Message_Fail Auto
Spell Property ORD_Loc_Lockdown_Spell_Proc_Lockout Auto

; -----

ObjectReference LockDummy
Bool IsWithinAllowedTime

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	IsWithinAllowedTime = true
	LockDummy = akCaster.PlaceAtMe(ORD_Loc_Lockdown_Container)
	LockDummy.MoveTo(akCaster, 0, 0, ORD_DeltaZ)
	LockDummy.Lock()
	Int LockStrength = Math.Floor(akTarget.GetAV("Health") * ORD_HealthToLevelMult)
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
		ORD_Loc_Lockdown_Marker_Impact.Play(TargetActor)
		Float TargetCurrentHP = TargetActor.GetAV("Health") - 1
		TargetActor.DamageAV("Health", TargetCurrentHP)
		Game.AdvanceSkill(ORD_Skill, ORD_XPMult * TargetCurrentHP)
		ORD_Loc_Lockdown_Message.Show()
	EndIf
	LockDummy.Delete()

EndEvent

; -----