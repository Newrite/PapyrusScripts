Scriptname ORD_BasicFX_Script extends ActiveMagicEffect  

; -----

ImagespaceModifier Property ORD_Imod Auto
Sound Property ORD_Sound Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Imod.Apply()
	ORD_Sound.Play(akTarget)

EndEvent

; -----