;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 28
Scriptname PRKF_HH_Pickperk_ebony_04060B8A Extends Perk Hidden

;BEGIN FRAGMENT Fragment_20
Function Fragment_20(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Game.GetPlayer().AddItem(HH_WEAPON, 1)
akTargetRef.Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Weapon Property HH_WEAPON  Auto
