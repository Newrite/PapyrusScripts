Scriptname ORD_ThrallPersistence_Script extends activemagiceffect  

; -----

Float Property ORD_UpdateRate Auto
Actor Property PlayerRef Auto
Perk Property ORD_Con80_Necromaster_Perk_80 Auto
Float Property ORD_Dist Auto
Spell Property ORD_Con_Necromaster_Spell_Proc Auto
MagicEffect Property ReanimateSecondayFFAimed Auto
GlobalVariable Property ORD_Con_Necromaster_Global_PreventUnequip Auto

; -----

Actor TargetActor

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster == PlayerRef && PlayerRef.HasPerk(ORD_Con80_Necromaster_Perk_80)
		TargetActor = akTarget
		RegisterForUpdate(ORD_UpdateRate)
		GoToState("HasPerk")
	Else
		GoToState("NoPerk")
	EndIf

EndEvent

; -----

State HasPerk

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	If akSourceContainer == PlayerRef
		If (akBaseItem as Armor) || (akBaseItem as Weapon)
			TargetActor.EquipItem(akBaseItem, ORD_Con_Necromaster_Global_PreventUnequip.GetValue() as Int, false)
		EndIf
	EndIf

EndEvent

Event OnUpdate()

	If (TargetActor.GetDistance(PlayerRef) > ORD_Dist || TargetActor.GetWorldspace() != PlayerRef.GetWorldspace()) && !Utility.IsInMenuMode()
		TargetActor.MoveTo(PlayerRef)
	EndIf

EndEvent

Event OnDying(Actor akKiller)

	ORD_Con_Necromaster_Spell_Proc.Cast(TargetActor)

EndEvent

EndState

; -----

State NoPerk

Event OnDying(Actor akKiller)

	Dispel()

EndEvent

EndState

; -----