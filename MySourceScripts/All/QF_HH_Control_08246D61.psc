;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 38
Scriptname QF_HH_Control_08246D61 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Контроль дыхания ранг 2
HH_GL_Perk_damage.SetValue(HH_GL_Perk_damage.GetValue()+0.1)
HH_GL_Perk_penetr.SetValue(HH_GL_Perk_penetr.GetValue()+0.05)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Сильное запястье ранг 2
HH_GL_Perk_damage.SetValue(HH_GL_Perk_damage.GetValue()+0.2)
HH_GL_Perk_penetr.SetValue(HH_GL_Perk_penetr.GetValue()+0.15)
HH_GL_Perk_Find.SetValue(HH_GL_Perk_Find.GetValue()+10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;Мастер тяжелых ножей 1
HH_Global_Heavy_crit.SetValue(HH_Global_Heavy_crit.GetValue()+0.5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;Мастер легких ножей
HH_Global_Ligt_crit.SetValue(HH_Global_Ligt_crit.GetValue()+0.5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;Мастер легких ножей 2
HH_Global_Ligt_crit.SetValue(HH_Global_Ligt_crit.GetValue()+0.5)
HH_Global_lightcritchance.SetValue(HH_Global_lightcritchance.GetValue()+10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
; Мастер ножей
HH_Global_Heavy_crit.SetValue(HH_Global_Heavy_crit.GetValue()+0.5)
HH_Global_Ligt_crit.SetValue(HH_Global_Ligt_crit.GetValue()+0.5)
HH_GL_Perk_damage.SetValue(HH_GL_Perk_damage.GetValue()+0.2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Метание ножей ранг 2
HH_GL_Perk_damage.SetValue(HH_GL_Perk_damage.GetValue()+0.05)
HH_GL_Perk_penetr.SetValue(HH_GL_Perk_penetr.GetValue()+0.05)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Сильное запястье ранг 1
HH_GL_Perk_damage.SetValue(HH_GL_Perk_damage.GetValue()+0.15)
HH_GL_Perk_penetr.SetValue(HH_GL_Perk_penetr.GetValue()+0.15)
HH_GL_Perk_Find.SetValue(HH_GL_Perk_Find.GetValue()+10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property HH_GL_Perk_damage  Auto  
GlobalVariable Property HH_GL_Perk_penetr  Auto

GlobalVariable Property HH_GL_Perk_Find  Auto  

GlobalVariable Property HH_Global_lightcritchance  Auto  

GlobalVariable Property HH_Global_Heavy_crit  Auto  

GlobalVariable Property HH_Global_Ligt_crit  Auto  
