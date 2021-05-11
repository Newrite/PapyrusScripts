Scriptname ORD_RecycleMaterials_Script extends activemagiceffect  

; -----

Message Property ORD_Smh_RecycleMaterials_Message_Recycled Auto
Float Property ORD_Pct Auto
Actor Property PlayerRef Auto

; -----

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	Float Random = Utility.RandomFloat(0,1)
	If Random < ORD_Pct
		PlayerRef.AddItem(akBaseItem, aiItemCount, true)
		ORD_Smh_RecycleMaterials_Message_Recycled.Show()
	EndIf

EndEvent

; -----