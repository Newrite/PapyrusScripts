;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__073F0389 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if Game.GetPlayer().GetItemCount(Gold001) >= 4000
Game.GetPlayer().RemoveItem(Gold001, 4000)
Game.GetPlayer().AddItem(HH_ForswornHelmet,1)
Game.GetPlayer().AddItem(HH_ForswornCuirass,1)
else
Debug.MessageBox("Недостаточно золота")
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

Armor Property HH_ForswornHelmet  Auto  

Armor Property HH_ForswornCuirass  Auto  
