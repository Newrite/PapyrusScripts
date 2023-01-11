;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 31
Scriptname PRKF_HH_Pickperk_Daedric_0A353328 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_30
Function Fragment_30(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Game.GetPlayer().AddItem(Item, 1)
akTargetRef.Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Item  Auto  
