Scriptname ORD_ForgeTheLegend_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Float Property ORD_PushForce Auto
GlobalVariable Property ORD_Smh_ForgeTheLegend_Global_IsCompleted auto
Spell Property ORD_Smh_ForgeTheLegend_Spell_Blast Auto

; -----

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	ORD_Smh_ForgeTheLegend_Spell_Blast.Cast(PlayerRef)
	PlayerRef.PushActorAway(PlayerRef, ORD_PushForce)
	ORD_Smh_ForgeTheLegend_Global_IsCompleted.SetValue(1)

EndEvent

; -----