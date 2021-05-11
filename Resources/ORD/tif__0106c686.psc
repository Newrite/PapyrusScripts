;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0106C686 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(akSpeakerRef as Actor).PlayIdle(IdlePray)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeakerRef.BlockActivation()
;Game.ShowTrainingMenu(akSpeakerRef as Actor)

; show visuals
ORD_Res_SpiritTutors_Marker_Cast.Play(Game.GetPlayer())
ORD_Res_SpiritTeacher_VFX.Play(Game.GetPlayer(), 2.0)

; add spell
ORD_Res_SpiritTeacher_Message.Show()
If (akSpeakerRef as Actor).GetActorBase() == ORD_Res_SpiritTeacher_Actor1
	Game.GetPlayer().AddSpell(ORD_Res_SpiritTeacher_Spell_AbBlessing1,false)
ElseIf (akSpeakerRef as Actor).GetActorBase() == ORD_Res_SpiritTeacher_Actor2
	Game.GetPlayer().AddSpell(ORD_Res_SpiritTeacher_Spell_AbBlessing2,false)
EndIf

; remove actor
(akSpeakerRef as Actor).Disable(true)
;(akSpeakerRef as Actor).Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property IdlePray  Auto  

VisualEffect Property ORD_Res_SpiritTeacher_VFX  Auto  

ActorBase Property ORD_Res_SpiritTeacher_Actor1  Auto  

ActorBase Property ORD_Res_SpiritTeacher_Actor2  Auto  

SPELL Property ORD_Res_SpiritTeacher_Spell_AbBlessing1  Auto  

SPELL Property ORD_Res_SpiritTeacher_Spell_AbBlessing2  Auto  

Message Property ORD_Res_SpiritTeacher_Message  Auto  

Sound Property ORD_Res_SpiritTutors_Marker_Cast  Auto  
