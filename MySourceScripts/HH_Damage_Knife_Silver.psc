Scriptname HH_Damage_Knife_Silver extends activemagiceffect  

;PickPocketPowerMod - крит легких ножей
;PickPocketMod - урон через перки
;PickPocketSkillAdvance - крит тяж ножей

Keyword Property REQ_KW_SneakAttackImmunity Auto  

Int Property Base_damage  Auto  

Int Property Base_PEN  Auto

Float Property DamageResistK  Auto

Actor Property PlayerRef  Auto

Keyword Property ActorTypeDwarven  Auto  

Spell Property HH_Spell_damage_silver Auto

Perk Property HH_Pickpocket7 Auto

MiscObject Property Misc1 Auto

Int Property LightK_chance  Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
float Crit_bonus = PlayerRef.GetActorValue("OneHandedSkillAdvance")
if Crit_bonus>200.0
Crit_bonus=200.0
endIf
float crit = 1.0
int Lrandom = Utility.RandomInt(0, 99)
	if !PlayerRef.IsDetectedBy(akTarget)
		crit=PlayerRef.GetActorValue("PickPocketSkillAdvance")+((Crit_bonus/400))
		Debug.Notification("Критический урон")
	if (akTarget.HasKeyword(REQ_KW_SneakAttackImmunity))
		crit=PlayerRef.GetActorValue("PickPocketSkillAdvance")+((Crit_bonus/400))
		crit=crit/2
		;Debug.Notification("Критический урон из скрытности"+crit as int)
	endIf
	elseif PlayerRef.IsDetectedBy(akTarget) && Lrandom < LightK_chance
		crit=PlayerRef.GetActorValue("PickPocketPowerMod")+((Crit_bonus/200))
		Debug.Notification("Критический урон")
		if (akTarget.HasKeyword(REQ_KW_SneakAttackImmunity))
			crit=PlayerRef.GetActorValue("PickPocketPowerMod")+((Crit_bonus/200))
			crit=crit/2
			;Debug.Notification("Критический урон НЕ из скрытности"+crit as int)
	endIf
	endif
float staminaBonus = 1 + ((PlayerRef.GetBaseActorValue("Stamina") - 150.0) * 0.005)
	if staminaBonus < 1.0
		staminaBonus = 1.0
	endif
float Newrite_chort = PlayerRef.GetActorValue("TwoHandedSkillAdvance")
if Newrite_chort>100.0
Newrite_chort=100.0
endIf
;Debug.Notification("staminaBonus"+staminaBonus) 
	float Damage = Base_damage * (1+(PlayerRef.GetActorValue("PickPocketMod")/100)) * (1+(Newrite_chort/200)) * (1+(PlayerRef.GetActorValue("OneHandedPowerMod")/100)) * (staminaBonus) * crit
	;Debug.Notification("Критический урон пост нотификация"+crit as int)
float Perk_pent = 0.0
if PlayerRef.HasPerk(HH_Pickpocket7)
	Perk_pent = 0.15
endIf
float penetr = Perk_pent + ((PlayerRef.GetActorValue("Pickpocket")-PlayerRef.GetBaseActorValue("Pickpocket"))*0.005) + (Base_PEN/100)
if penetr > 0.8
	penetr = 0.8
endIf
float TDR = ((akTarget.GetActorValue("DamageResist") - (akTarget.GetActorValue("DamageResist")*penetr)) * DamageResistK)/100
if TDR > 0.8
	TDR = 0.8
endIf
;Debug.Notification("TDR"+TDR)
	Damage = (Damage*(1-TDR) * Game.GetGameSettingFloat("fDiffMultHPByPCVH"))
;Debug.Notification("Damage"+Damage)
	HH_Spell_damage_silver.SetNthEffectMagnitude(0, Damage)
	PlayerRef.DoCombatSpellApply(HH_Spell_damage_silver, akTarget)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
int random = Utility.RandomInt(0, 99)
	if (random < 75) && !akTarget.IsPlayerTeammate() && (!akTarget.HasKeyword(ActorTypeDwarven))
			akTarget.AddItem(Misc1, 1, true)
	endIf
EndEvent