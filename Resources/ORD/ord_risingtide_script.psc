Scriptname ORD_RisingTide_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Spell Property ORD_Lia_RushingTide_Spell_Proc Auto
Int Property ORD_XP Auto
Float Property ORD_XPMult Auto
FormList Property ORD_Lia_HissingDragon_FormList Auto
Perk Property ORD_Lia70_HissingDragon_70 Auto
Perk Property ORD_Lia50_RushingTide_Perk_50 Auto

Quest Property DGIntimidateQuest Auto
Quest Property C00JorrvaskrFight Auto
Location Property WhiterunJorrvaskrLocation Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForAnimationEvent(PlayerRef, "weaponSwing")
	RegisterForAnimationEvent(PlayerRef, "weaponLeftSwing")
	; HitFrame

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If (asEventName == "WeaponSwing" || asEventName == "WeaponLeftSwing") && akSource == PlayerRef

		If (!DGIntimidateQuest.IsRunning() || DGIntimidateQuest.GetCurrentStageID() >= 100) && (!C00JorrvaskrFight.IsRunning() || PlayerRef.GetCurrentLocation() != WhiterunJorrvaskrLocation || C00JorrvaskrFight.GetCurrentStageID() >= 100)

			; hissing dragon
			If PlayerRef.HasPerk(ORD_Lia70_HissingDragon_70) && !PlayerRef.IsSneaking()
				(ORD_Lia_HissingDragon_FormList.GetAt(0) as Spell).Cast(PlayerRef)
			EndIf

			; rushing tide
			If PlayerRef.HasPerk(ORD_Lia50_RushingTide_Perk_50)
				ORD_Lia_RushingTide_Spell_Proc.Cast(PlayerRef)
			EndIf

		EndIf

		; xp
		If PlayerRef.IsInCombat() || PlayerRef.GetCombatState() > 0 ;bugfix
			Game.AdvanceSkill("LightArmor", ORD_XP * (1 + (ORD_XPMult * PlayerRef.GetBaseAV("LightArmor"))))
		EndIf

	EndIf

EndEvent

; -----

Event OnRaceSwitchComplete()

	Utility.Wait(0.1)
	RegisterForAnimationEvent(PlayerRef, "weaponSwing")
	RegisterForAnimationEvent(PlayerRef, "weaponLeftSwing")

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.DispelSpell(ORD_Lia_RushingTide_Spell_Proc)

EndEvent

; -----