;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__073F038D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if Game.GetPlayer().GetItemCount(Gold001) >= 5000
Game.GetPlayer().RemoveItem(Gold001, 5000)
Game.GetPlayer().AddItem(HH_ClothesNecromancerRobes_hood,1)
;Game.GetPlayer().AddItem(HH_ArmorElvenLightCuirass,1)
else
Debug.MessageBox("Недостаточно золота")
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
MiscObject Property Gold001  Auto  

Armor Property HH_ClothesNecromancerRobes_hood  Auto  
