Scriptname ORD_SkystrikeProc_Script extends activemagiceffect  

; -----

FormList Property ORD_Arc_Skystrike_FormList Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget.IsHostileToActor(akCaster)
		ORD_Arc_Skystrike_FormList.AddForm(akTarget)
	EndIf

EndEvent

; -----