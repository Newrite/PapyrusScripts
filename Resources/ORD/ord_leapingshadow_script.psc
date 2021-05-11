Scriptname ORD_LeapingShadow_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Spell Property ORD_Sne_LeapingShadow_ProcTeleport Auto
Spell Property ORD_Sne_LeapingShadow_ProcSelf Auto
Float Property ORD_Delay Auto
Int Property ORD_XP Auto
String Property ORD_Skill Auto
Message Property ORD_Sne_LeapingShadow_Message Auto
MagicEffect Property ORD_Two_Grindhouse_Effect_Proc Auto

; -----

Bool StudiedEnough = false

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_Delay)

EndEvent

; -----

Event OnUpdate()

	ORD_Sne_LeapingShadow_Message.Show()
	StudiedEnough = true
;	RegisterForAnimationEvent(PlayerRef, "HitFrame")
	RegisterForAnimationEvent(PlayerRef, "WeaponSwing")
	RegisterForAnimationEvent(PlayerRef, "WeaponLeftSwing")

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

;	If (asEventName == "WeaponSwing" || asEventName == "WeaponLeftSwing") && akSource == PlayerRef
;	If (asEventName == "HitFrame") && akSource == PlayerRef && !PlayerRef.HasMagicEffect(ORD_Two_Grindhouse_Effect_Proc)
;	If (asEventName == "WeaponSwing" || asEventName == "WeaponLeftSwing") && akSource == PlayerRef && !PlayerRef.HasMagicEffect(ORD_Two_Grindhouse_Effect_Proc)
		ORD_Sne_LeapingShadow_ProcSelf.Cast(PlayerRef)
		ORD_Sne_LeapingShadow_ProcTeleport.Cast(PlayerRef)
		Game.AdvanceSkill(ORD_Skill, ORD_XP)
;	EndIf

EndEvent

; -----

Event OnRaceSwitchComplete()

	If StudiedEnough
		Utility.Wait(0.1)
;		RegisterForAnimationEvent(PlayerRef, "HitFrame")
		RegisterForAnimationEvent(PlayerRef, "WeaponSwing")
		RegisterForAnimationEvent(PlayerRef, "WeaponLeftSwing")
	EndIf

EndEvent

; -----