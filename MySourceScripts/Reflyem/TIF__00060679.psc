;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname TIF__00060679 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(SKLxSmithing2, 1)
akspeaker.additem(SKLxSmithing2, 1)
Game.IncrementSkill("Smithing")
GlobalVariable x = Game.GetFormFromFile(0x00000D63, "zzzSXP.esp") as GlobalVariable
if x 
    Debug.Notification("Получено 10000 опыта")
    x.Mod(10000)
endif
GetOwningQuest().SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property SKLxSmithing2  Auto  
