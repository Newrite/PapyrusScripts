;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname PRKF_HH_Perk_to_100_Smith_06005903 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
if !akTargetRef.IsFurnitureInUse()
HH_Glob_Menu_Swith.SetValue(1)
Game.GetPlayer().RemoveSpell(HH_Smith_Const)
HH_Smith_Const.SetNthEffectMagnitude(0, 100.0-Game.GetPlayer().GetActorValue("Smithing"))
Game.GetPlayer().AddSpell(HH_Smith_Const, false)
while Game.GetPlayer().GetActorValue("Smithing") < 100.0
  Utility.Wait(0.1)
endWhile
akTargetRef.Activate(Game.GetPlayer())
Utility.Wait(1)
while akTargetRef.IsFurnitureInUse()
Utility.Wait(0.1)
endwhile
Game.GetPlayer().RemoveSpell(HH_Smith_Const)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property HH_Global_Old_Smith Auto
GlobalVariable Property HH_Glob_Menu_Swith Auto
Perk Property HH_Perk_to_100_Smith Auto

SPELL Property HH_Smith_Const  Auto  
