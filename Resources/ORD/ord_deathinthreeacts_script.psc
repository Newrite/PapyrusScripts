Scriptname ORD_DeathInThreeActs_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Spell Property ORD_Sne_DeathInThreeActs_Spell_Proc Auto
Float Property ORD_Delay Auto
Int Property ORD_XP Auto
String Property ORD_Skill Auto

; -----

Bool StudiedEnough = false

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_Delay)

EndEvent

; -----

Event OnUpdate()

	Debug.Notification("start")
	StudiedEnough = true
	RegisterForAnimationEvent(PlayerRef, "weaponSwing")
	RegisterForAnimationEvent(PlayerRef, "weaponLeftSwing")
	; HitFrame

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If (asEventName == "WeaponSwing" || asEventName == "WeaponLeftSwing") && akSource == PlayerRef
		ORD_Sne_DeathInThreeActs_Spell_Proc.Cast(PlayerRef)
		Game.AdvanceSkill(ORD_Skill, ORD_XP)
	EndIf

EndEvent

; -----

Event OnRaceSwitchComplete()

	If StudiedEnough
		Utility.Wait(0.1)
		RegisterForAnimationEvent(PlayerRef, "weaponSwing")
		RegisterForAnimationEvent(PlayerRef, "weaponLeftSwing")
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.DispelSpell(ORD_Sne_DeathInThreeActs_Spell_Proc)

EndEvent

; -----