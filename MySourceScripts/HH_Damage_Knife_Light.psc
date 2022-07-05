Scriptname HH_Damage_Knife_Light extends activemagiceffect  

;PickPocketPowerMod - крит легких ножей
;PickPocketMod - урон через перки
;PickPocketSkillAdvance - крит тяж ножей

Keyword Property REQ_KW_SneakAttackImmunity Auto  

Int Property Base_damage  Auto  

Int Property Base_PEN  Auto

Int Property LightK_chance  Auto

Float Property DamageResistK  Auto

Actor Property PlayerRef  Auto

Keyword Property ActorTypeDwarven  Auto  

Spell Property HH_Spell_damage_no_silver Auto

Perk Property HH_Pickpocket7 Auto

MiscObject Property Misc1 Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
float Crit_bonus = PlayerRef.GetActorValue("OneHandedSkillAdvance")
if Crit_bonus>200.0
Crit_bonus=200.0
endIf
float staminaBonus = 1 + ((PlayerRef.GetBaseActorValue("Stamina") - 150.0) * 0.005)
	if staminaBonus < 1.0
		staminaBonus = 1.0
	endif
;Debug.Notification("staminaBonus"+staminaBonus) 
float crit = 1.0
int Lrandom = Utility.RandomInt(0, 99)
	if Lrandom < LightK_chance && !(akTarget.HasKeyword(REQ_KW_SneakAttackImmunity))
		crit=PlayerRef.GetActorValue("PickPocketPowerMod") + ((Crit_bonus/200))
		Debug.Notification("Критический урон x" + crit as int)
	elseif Lrandom < LightK_chance && (akTarget.HasKeyword(REQ_KW_SneakAttackImmunity))
		crit=PlayerRef.GetActorValue("PickPocketPowerMod") + ((Crit_bonus/200))
		crit=crit/2
		Debug.Notification("Критический урон x" + crit as int)
	endIf
float Newrite_chort = PlayerRef.GetActorValue("TwoHandedSkillAdvance")
if Newrite_chort>100.0
Newrite_chort=100.0
endIf
float Damage = Base_damage * (1+(PlayerRef.GetActorValue("PickPocketMod")/100)) * (1+(PlayerRef.GetActorValue("OneHandedPowerMod")/100))* (1+(Newrite_chort/200)) * (staminaBonus) * crit
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
	HH_Spell_damage_no_silver.SetNthEffectMagnitude(0, Damage)
	PlayerRef.DoCombatSpellApply(HH_Spell_damage_no_silver, akTarget)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
int random = Utility.RandomInt(0, 99)
	if (random < 75) && !akTarget.IsPlayerTeammate() && (!akTarget.HasKeyword(ActorTypeDwarven))
			akTarget.AddItem(Misc1, 1, true)
	endIf
EndEvent