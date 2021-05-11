Scriptname ORD_ImodSpan_Script extends activemagiceffect  

; -----

ImagespaceModifier Property ORD_Imod Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget == PlayerRef
		ORD_Imod.Apply()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If akTarget == PlayerRef
		ORD_Imod.Remove()
	EndIf

EndEvent

; -----