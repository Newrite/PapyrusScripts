;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__073F0387 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if Game.GetPlayer().GetItemCount(Gold001) >= 3000
Game.GetPlayer().RemoveItem(Gold001, 3000)
Game.GetPlayer().AddItem(HH_ArmorBanditHelmet,1)
Game.GetPlayer().AddItem(HH_ArmorBanditCuirass,1)
else
Debug.MessageBox("������������ ������")
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

Armor Property HH_ArmorBanditHelmet  Auto  

Armor Property HH_ArmorBanditCuirass  Auto  
