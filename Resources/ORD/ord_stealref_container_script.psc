Scriptname ORD_StealRef_Container_Script extends ReferenceAlias  

; -----

Spell Property ORD_QuestRunner Auto
LeveledItem Property ORD_Litem Auto
Float Property ORD_LitemCount Auto
Float Property ORD_LitemCountFifteenSeconds Auto
Float Property ORD_LitemCountSkillMult Auto
Float Property ORD_LitemCountLockMult Auto
Float Property ORD_LitemCountLockMultFifteenSeconds Auto
String Property ORD_ScaleMult Auto

Message Property ORD_Loc_GoneInFifteenSeconds_Message Auto
Message Property ORD_Loc_GoneInFifteenSeconds_Message_Fail Auto

GlobalVariable Property ORD_Loc_RobbersEye_Global_CurrentLockStrength Auto
GlobalVariable Property ORD_Loc_RobbersEye_Global_NextActivate Auto
Perk Property ORD_Loc50_GoneInFifteenSeconds_Perk_50 Auto

Actor Property PlayerRef Auto

; -----

Bool ClockIsRunning = false
Bool IgnoreActivation = false

; -----

Event OnActivate(ObjectReference akActivator)

	If akActivator == PlayerRef && !IgnoreActivation
		IgnoreActivation = true

		; robbers eye
		Int LitemCount = Math.Floor(ORD_LitemCount + (ORD_LitemCountSkillMult * PlayerRef.GetAV(ORD_ScaleMult)) + (ORD_LitemCountLockMult * ORD_Loc_RobbersEye_Global_CurrentLockStrength.GetValue()))
		Self.GetRef().AddItem(ORD_Litem, LitemCount, false)
		ClockIsRunning = true
		RegisterForSingleUpdate(0.25)

		; disable clock
		Utility.WaitMenuMode(15.0)
		ClockIsRunning = false
	EndIf

EndEvent

; -----

Event OnUpdate()

	PlayerRef.DispelSpell(ORD_QuestRunner)

	; gone in fifteen seconds
	If PlayerRef.HasPerk(ORD_Loc50_GoneInFifteenSeconds_Perk_50)
		If ClockIsRunning && !Self.GetRef().IsLocked()
			ORD_Loc_GoneInFifteenSeconds_Message.Show()
			Int LitemCountFifteenSeconds = Math.Floor(ORD_LitemCountFifteenSeconds + (ORD_LitemCountLockMultFifteenSeconds * ORD_Loc_RobbersEye_Global_CurrentLockStrength.GetValue()))
			Self.GetRef().AddItem(ORD_Litem, LitemCountFifteenSeconds, false)
			ORD_Loc_RobbersEye_Global_NextActivate.SetValue(-1.0)
		Else
			ORD_Loc_GoneInFifteenSeconds_Message_Fail.Show()
		EndIf
	EndIf

	ClockIsRunning = false
	IgnoreActivation = false

EndEvent

; -----