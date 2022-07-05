Scriptname HH_E_Start_of_poisons extends activemagiceffect  

GlobalVariable Property HH_Glob_Poison_Stacs Auto
GlobalVariable Property HH_Glob_PoisonDMGB_Display Auto
GlobalVariable Property HH_Glob_PoisonDMG_Display Auto
Spell Property doomSerpentAbility Auto ; камень змея, 4 стаков вместо 2
Perk Property REQ_Alchemy_ImprovedPoisons Auto ; перк на 50 +1 стак, урон
Perk Property REQ_Alchemy_ConcentratedPoisons Auto ; +1 стак, урон
int Stak_num
int Display_DMG
int Display_DMG_B
Event OnEffectStart(Actor akTarget, Actor akCaster)
HH_Glob_Poison_Stacs.SetValue(0)
Stak_num = 2
Display_DMG = 2 
Display_DMG_B = 30

if Game.GetPlayer().HasSpell(doomSerpentAbility)
	Stak_num=Stak_num+2
endif

if Game.GetPlayer().HasPerk(REQ_Alchemy_ConcentratedPoisons)
	Stak_num=Stak_num+1
	Display_DMG = 4
	Display_DMG_B = 60
EndIf

if Game.GetPlayer().HasPerk(REQ_Alchemy_ImprovedPoisons)
	Stak_num=Stak_num+1
	Display_DMG = 6
	Display_DMG_B = 90
EndIf
HH_Glob_Poison_Stacs.SetValue(Stak_num)
HH_Glob_PoisonDMGB_Display.SetValue(Display_DMG_B)
HH_Glob_PoisonDMG_Display.SetValue(Display_DMG)
endEvent