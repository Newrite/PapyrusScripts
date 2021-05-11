Scriptname ORD_DeathsEmperor_MiscItem_Script extends ObjectReference  

; -----

;Spell Property ORD_Pic_DeathsEmperor_Spell_AbCurse Auto
EffectShader Property ORD_Pic_DeathsEmperor_FXS Auto
Sound Property ORD_Pic_DeathsEmperor_Marker Auto

; -----

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	If (akNewContainer as Actor)
;		(akNewContainer as Actor).AddSpell(ORD_Pic_DeathsEmperor_Spell_AbCurse, false)
		ORD_Pic_DeathsEmperor_Marker.Play(akNewContainer)
		ORD_Pic_DeathsEmperor_FXS.Play(akNewContainer as Actor, 1.5)
	EndIf
;	If (akOldContainer as Actor)
;		(akOldContainer as Actor).RemoveSpell(ORD_Pic_DeathsEmperor_Spell_AbCurse)
;	EndIf

EndEvent

; -----