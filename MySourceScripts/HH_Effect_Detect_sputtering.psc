Scriptname HH_Effect_Detect_sputtering extends activemagiceffect  

GlobalVariable Property HH_Glob_sputtering_fire Auto
GlobalVariable Property HH_Glob_sputtering_frost Auto
GlobalVariable Property HH_Glob_sputtering_shock Auto

GlobalVariable Property HH_Glob_sputtering_DMG_fire Auto
GlobalVariable Property HH_Glob_sputtering_DMG_frost Auto
GlobalVariable Property HH_Glob_sputtering_DMG_shock Auto


GlobalVariable Property HH_Glob_set Auto

Perk Property HH_Pickpocket12 Auto
Perk Property HH_Pickpocket13 Auto
Perk Property HH_Pickpocket15 Auto

Perk Property REQ_Enchanting_CorpusLore Auto ; 50
Perk Property REQ_Enchanting_SkillLore Auto ; 75
Perk Property REQ_Perk_Enchanting_EnchantmentMastery01 Auto ; 90

int Stak_num
float Display_DMG
float Mirel_Ench

Event OnEffectStart(Actor akTarget, Actor akCaster)
HH_Glob_sputtering_fire.SetValue(0)
HH_Glob_sputtering_frost.SetValue(0)
HH_Glob_sputtering_shock.SetValue(0)
Mirel_Ench = ((Game.GetPlayer().GetActorValue("DestructionSkillAdvance")))
if Mirel_Ench>200
Mirel_Ench=200
endif
Stak_num = 5
Display_DMG = 15*(1+(Mirel_Ench/200))
if Game.GetPlayer().HasPerk(HH_Pickpocket12)
	Stak_num = 10
EndIf
if Game.GetPlayer().HasPerk(HH_Pickpocket13)
	Stak_num = 15
EndIf
if Game.GetPlayer().HasPerk(HH_Pickpocket15)
	Stak_num = 20
EndIf
HH_Glob_set.SetValue(Stak_num)
if Game.GetPlayer().HasPerk(REQ_Enchanting_CorpusLore)
	Display_DMG = 20*(1+(Mirel_Ench/200))
EndIf
if Game.GetPlayer().HasPerk(REQ_Enchanting_SkillLore)
	Display_DMG = 25*(1+(Mirel_Ench/200))
EndIf
if Game.GetPlayer().HasPerk(REQ_Perk_Enchanting_EnchantmentMastery01)
	Display_DMG = 30*(1+(Mirel_Ench/200))
EndIf
HH_Glob_sputtering_DMG_fire.SetValue(Display_DMG as int)
endEvent