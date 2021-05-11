;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname PRKF_ORD_Con80_FeedTheMonste_0101AAB0 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
(akTargetRef as Actor).AddSpell(ORD_Con_FeedTheMonster_Spell_Ab)
Utility.Wait(0.1)
(akTargetRef as Actor).ShowGiftMenu(true, ORD_Con_FeedTheMonster_FormList, true, false)
Utility.Wait(0.3)
(akTargetRef as Actor).RemoveSpell(ORD_Con_FeedTheMonster_Spell_Ab)
; feed
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property ORD_Con_FeedTheMonster_FormList  Auto  

SPELL Property ORD_Con_FeedTheMonster_Spell_Ab  Auto  
