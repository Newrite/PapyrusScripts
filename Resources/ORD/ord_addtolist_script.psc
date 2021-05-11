Scriptname ORD_AddToList_Script extends activemagiceffect  

; -----

FormList Property ORD_List Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_List.AddForm(akTarget)

EndEvent

; -----