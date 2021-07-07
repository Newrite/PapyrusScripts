;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00064789 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int indexArmor = ArmorChoose.Show()
Game.GetPlayer().RemoveItem(DaedraHeart, 1)
if indexArmor == 0
    Game.GetPlayer().AddItem(FavorRewardEnchArmorLight, 1)
else
    Game.GetPlayer().AddItem(FavorRewardEnchArmorHeavy, 1)
endif
GetOwningQuest().SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property FavorRewardEnchArmorLight  Auto
LeveledItem Property FavorRewardEnchArmorHeavy  Auto

Message Property ArmorChoose Auto

Ingredient Property DaedraHeart  Auto  
