Scriptname ORD_AddItem_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
MiscObject Property ORD_Loc_BearTraps_MiscItem Auto
Perk Property ORD_Loc80_TheRevenge_Perk_80_OrdASISExclude auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget.GetItemCount(ORD_Loc_BearTraps_MiscItem) == 0
		akTarget.AddItem(ORD_Loc_BearTraps_MiscItem)
	EndIf
;	akTarget.AddInventoryEventFilter(ORD_Loc_BearTraps_MiscItem)

EndEvent

; -----

;Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

;	Int TargetBearTrapCount = PlayerRef.GetItemCount(ORD_Loc_BearTraps_MiscItem)
;	If PlayerRef.HasPerk(ORD_Loc80_TheRevenge_Perk_80_OrdASISExclude)
;		If TargetBearTrapCount > 3
;			PlayerRef.RemoveItem(ORD_Loc_BearTraps_MiscItem, TargetBearTrapCount - 3)
;		EndIf
;	Else
;		If TargetBearTrapCount > 2
;			PlayerRef.RemoveItem(ORD_Loc_BearTraps_MiscItem, TargetBearTrapCount - 2)
;		EndIf
;	EndIf

;EndEvent

; -----

;Event OnRaceSwitchComplete()

;	PlayerRef.AddInventoryEventFilter(ORD_Loc_BearTraps_MiscItem)

;EndEvent

; -----