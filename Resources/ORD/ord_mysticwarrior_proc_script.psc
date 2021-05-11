Scriptname ORD_MysticWarrior_Proc_Script extends activemagiceffect  

; -----

FormList Property ORD_Enc_MysticWarrior_FormList Auto
GlobalVariable Property ORD_Enc_MysticWarrior_Global_DoubleCost Auto
Message Property ORD_Enc_MysticWarrior_Message_Ready Auto
Float Property ORD_DelayBase Auto
Float Property ORD_DelayMinCap Auto
Float Property ORD_DelayPerEncLevel Auto
Float Property ORD_DelaySwayFraction Auto
Actor Property PlayerRef Auto
Perk Property ORD_Enc70_Spellbinder_Perk_70_WasStormEnchanter_OrdASISExclude Auto
GlobalVariable Property ORD_Enc_MysticWarrior_Global_IsFreeUse Auto
GlobalVariable Property ORD_Enc_StaffExpertiseNewXP_Global Auto
GlobalVariable Property ORD_Enc_StaffExpertiseNewXPLevel_Global Auto
Float Property ORD_XPMult Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Enc_MysticWarrior_Global_DoubleCost.SetValue(0.0)
	(ORD_Enc_MysticWarrior_FormList.GetAt(0) as Spell).Cast(akTarget)

	If PlayerRef.HasPerk(ORD_Enc70_Spellbinder_Perk_70_WasStormEnchanter_OrdASISExclude) && ORD_Enc_MysticWarrior_Global_IsFreeUse.GetValue() == 1.0
		; cash in on your free proc
		ORD_Enc_MysticWarrior_Global_IsFreeUse.SetValue(0.0)
		Dispel()
	Else
		; start the cooldown
		ORD_Enc_MysticWarrior_Global_IsFreeUse.SetValue(1.0)
		Float DelayBetweenAttacks = ORD_DelayBase + (PlayerRef.GetActorValue("Enchanting") * ORD_DelayPerEncLevel)
		If DelayBetweenAttacks < ORD_DelayMinCap
			RegisterForSingleUpdate(Utility.RandomFloat(ORD_DelayMinCap * (1.0 - ORD_DelaySwayFraction), ORD_DelayMinCap * (1.0 + ORD_DelaySwayFraction)))
		Else
			RegisterForSingleUpdate(Utility.RandomFloat(DelayBetweenAttacks * (1.0 - ORD_DelaySwayFraction), DelayBetweenAttacks * (1.0 + ORD_DelaySwayFraction)))
		EndIf
	EndIf

	If PlayerRef.IsInCombat()
		Game.AdvanceSkill("Enchanting", (ORD_Enc_StaffExpertiseNewXP_Global.GetValue() + (akTarget.GetLevel() * ORD_Enc_StaffExpertiseNewXPLevel_Global.GetValue())) * ORD_XPMult)
	EndIf

EndEvent

; -----

Event OnUpdate()

	ORD_Enc_MysticWarrior_Message_Ready.Show()
	Dispel()

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Enc_MysticWarrior_Global_DoubleCost.SetValue(1.0)

EndEvent

; -----