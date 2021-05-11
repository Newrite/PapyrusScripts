Scriptname ORD_GirdForWar_Small_Script extends activemagiceffect  

; -----

ImagespaceModifier Property ORD_Smh_GirdForWar_Imod auto
Sound Property ORD_Smh_GirdForWar_Marker_Start Auto
Message Property ORD_Smh_GirdForWar_Message Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Smh_GirdForWar_Imod.Apply()
	ORD_Smh_GirdForWar_Marker_Start.Play(akTarget)

EndEvent

; -----