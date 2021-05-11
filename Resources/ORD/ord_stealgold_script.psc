Scriptname ORD_StealGold_Script extends activemagiceffect  

; -----

MiscObject Property Gold001 Auto
Int Property ORD_Min Auto
Int Property ORD_Max Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.RemoveItem(Gold001, Utility.RandomInt(ORD_Min, ORD_Max), true, none)

EndEvent

; -----