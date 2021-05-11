Scriptname ORD_ArcaneThesis_Static_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Alt_ArcaneThesis_Global_Status Auto
FormList Property ORD_Alt_ArcaneThesis_FormList Auto

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Alt_ArcaneThesis_FormList.Revert()
	ORD_Alt_ArcaneThesis_Global_Status.SetValue(0)

EndEvent

; -----