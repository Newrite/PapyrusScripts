;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_ORD_SlumRat_Quest_010327AE Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Rabbit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Rabbit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_ObjectToIndicate
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_ObjectToIndicate Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_ORD_Rabbit.GetRef().Delete()
Game.GetPlayer().DispelSpell(ORD_Pic_TrainedRabbit_Spell)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Alias_ORD_Rabbit.GetRef().BlockActivation(true)
ORD_Pic_TrainedRabbit_FXS.Play(Alias_ORD_Rabbit.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property ORD_Pic_TrainedRabbit_Spell  Auto  

EffectShader Property ORD_Pic_TrainedRabbit_FXS  Auto  
