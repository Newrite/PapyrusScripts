;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 28
Scriptname PRKF_HH_Pickperk_Torch_0A353327 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_20
Function Fragment_20(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Game.GetPlayer().AddItem(Item, 1)
akTargetRef.Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Light Property Item  Auto  
