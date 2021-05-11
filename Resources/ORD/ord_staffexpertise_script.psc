Scriptname ORD_StaffExpertise_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Float Property ORD_XPDivEnchanting = 2000.0 Auto
Float Property ORD_XPDivSchool = 10.0 Auto
Int Property ORD_SkillBase Auto

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell as Enchantment)
		Weapon LeftWeapon = PlayerRef.GetEquippedWeapon(true)
		Weapon RightWeapon = PlayerRef.GetEquippedWeapon(false)

		If (LeftWeapon && LeftWeapon.GetWeaponType() == 8 && PlayerRef.GetAnimationVariableBool("IsCastingLeft")) || (RightWeapon && RightWeapon.GetWeaponType() == 8 && PlayerRef.GetAnimationVariableBool("IsCastingRight"))
			; it is a staff
			; beyond this point the script is no longer speed critical
			Float XPGainedBase = ORD_SkillBase + PlayerRef.GetBaseAV("Enchanting")
			Game.AdvanceSkill("Enchanting",XPGainedBase / ORD_XPDivEnchanting)
;			Game.AdvanceSkill(FattestEffect.GetAssociatedSkill(),XPGainedBase / ORD_XPDivSchool)
		EndIf
;		Debug.Notification("ENC " + PlayerRef.GetAnimationVariableBool("bIsStaffLeftCasting") + " = left staff casting " + PlayerRef.GetAnimationVariableBool("IsCastingRight") + " = right casting " + PlayerRef.GetAnimationVariableBool("IsCastingLeft") + " = left casting ")
	EndIf

EndEvent

; -----