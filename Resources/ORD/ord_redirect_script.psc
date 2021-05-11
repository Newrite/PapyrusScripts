Scriptname ORD_Redirect_Script extends activemagiceffect  

; -----

FormList Property ORD_Ill_Possession_FormList_Target Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.25)
	akTarget.StopCombat()
	akTarget.StartCombat(ORD_Ill_Possession_FormList_Target.GetAt(0) as Actor)

EndEvent

; -----