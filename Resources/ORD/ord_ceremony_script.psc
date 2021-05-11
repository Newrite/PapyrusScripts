Scriptname ORD_Ceremony_Script extends activemagiceffect  

; -----

Keyword Property ORD_Enc_Ceremony_Keyword_Furniture Auto
Quest Property ORD_Ceremony_Quest Auto
Float Property ORD_DelayBeforeStop Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Ceremony_Quest.Start()
	; 4th looking
	; 5th sneaking
	Game.DisablePlayerControls(false, false, true, false, false, true, false, false, 0)
	;DisablePlayerControls(bool abMovement = true, bool abFighting = true, bool abCamSwitch = false, \ bool abLooking = false, bool abSneaking = false, bool abMenu = true, bool abActivate = true, bool abJournalTabs = false, \ int aiDisablePOVType = 0) native global
	RegisterForSingleUpdate(ORD_DelayBeforeStop)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

;	ORD_Ceremony_Quest.Stop()
	Game.SetHudCartMode(false)
	Debug.Notification("MAGICKA = " + akTarget.GetAV("Magicka"))
	Game.EnablePlayerControls()

EndEvent

; -----

Event OnGetUp(ObjectReference akFurniture)

	If akFurniture.HasKeyword(ORD_Enc_Ceremony_Keyword_Furniture)
		Dispel()
	EndIf

EndEvent

; -----

Event OnUpdate()

	Game.SetHudCartMode(true)


EndEvent

; -----