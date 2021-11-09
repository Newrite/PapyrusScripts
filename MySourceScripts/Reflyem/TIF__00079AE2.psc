;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00079AE2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(MammothTusk, 1)
akspeaker.AddItem(MammothTusk, 1)
Game.IncrementSkill("Speechcraft")
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

MiscObject Property MammothTusk  Auto  
