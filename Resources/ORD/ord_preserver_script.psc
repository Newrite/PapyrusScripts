Scriptname ORD_Preserver_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Message Property ORD_Enc_Preserver_Message Auto

; -----

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	If (akBaseItem as Weapon) || (akBaseItem as Armor)
		ORD_Enc_Preserver_Message.Show()
		PlayerRef.AddItem(akBaseItem, aiItemCount, true)
	EndIf

EndEvent

; -----