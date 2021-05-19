;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0500AA0C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
    Actor akSpeaker = akSpeakerRef as Actor
    ;BEGIN CODE
    Game.GetPlayer().RemoveItem(Ogma)
    BZ_Global. SetValue(1)
    Game.DisablePlayerControls()
    Utility.Wait(7.0)
    Game.AddPerkPoints(2)
    Game.EnablePlayerControls()
    BZ_Global. SetValue(0)
    ;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BZ_Global  Auto  
Book Property Ogma  Auto  