;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_ORD_PrinceWithAThousandEn_010C6705 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ORD_Rabbit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Rabbit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Enemy1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Enemy1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Enemy2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Enemy2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ORD_Enemy3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ORD_Enemy3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
UnregisterForUpdate()
Alias_ORD_Rabbit.GetRef().Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_ORD_Rabbit.GetReference().BlockActivation(true)
ORD_Pic_TrainedRabbit_FXS.Play(Alias_ORD_Rabbit.GetActorRef())

RegisterForSingleUpdate(2.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Event OnUpdate()

	Actor Player = Alias_ORD_Player.GetActorReference()
	Actor CurrentTarget

	CurrentTarget = Alias_ORD_Enemy1.GetActorReference()
	If CurrentTarget.GetCombatTarget() == Player
		CurrentTarget.StopCombat()
		CurrentTarget.StartCombat(Alias_ORD_Rabbit.GetActorReference())
	EndIf

	CurrentTarget = Alias_ORD_Enemy2.GetActorReference()
	If CurrentTarget.GetCombatTarget() == Player
		CurrentTarget.StopCombat()
		CurrentTarget.StartCombat(Alias_ORD_Rabbit.GetActorReference())
	EndIf

	CurrentTarget = Alias_ORD_Enemy3.GetActorReference()
	If CurrentTarget.GetCombatTarget() == Player
		CurrentTarget.StopCombat()
		CurrentTarget.StartCombat(Alias_ORD_Rabbit.GetActorReference())
	EndIf

	RegisterForSingleUpdate(2.0)

EndEvent

EffectShader Property ORD_Pic_TrainedRabbit_FXS  Auto  
