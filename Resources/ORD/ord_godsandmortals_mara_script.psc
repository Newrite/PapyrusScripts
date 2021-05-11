Scriptname ORD_GodsAndMortals_Mara_Script extends activemagiceffect  

; -----

ReferenceAlias Property LoveInterest Auto
FormList Property ORD_Res_GodsAndMortals_FormList_Mara Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Res_GodsAndMortals_FormList_Mara.Revert()
	ORD_Res_GodsAndMortals_FormList_Mara.AddForm(LoveInterest.GetActorRef())

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Res_GodsAndMortals_FormList_Mara.Revert()

EndEvent

; -----

