Scriptname ORD_BoneAltarFail_Script extends ObjectReference  

; -----

Perk Property ORD_Con20_BoneCollector_Perk_20_OrdASISExclude Auto
Message Property ORD_Con_BoneCollector_Message_NoPerk Auto

; -----

Event OnActivate(ObjectReference akActivator)

	If akActivator == Game.GetPlayer() && Game.GetPlayer().HasPerk(ORD_Con20_BoneCollector_Perk_20_OrdASISExclude) == false
		ORD_Con_BoneCollector_Message_NoPerk.Show()
	EndIf

EndEvent

; -----