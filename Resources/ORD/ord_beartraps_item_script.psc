Scriptname ORD_BearTraps_Item_Script extends ObjectReference  

; OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

; -----

Float Property ORD_DistanceInFront Auto
Float Property ORD_DistanceZ Auto

Activator[] Property ORD_Loc_BearTraps_Activator Auto
Explosion Property ORD_Loc_BearTraps_Explosion Auto
Sound Property ORD_Loc_BearTraps_Sound_Placement Auto

MiscObject Property ORD_Loc_BearTraps_MiscItem Auto
Message Property ORD_Loc_BearTraps_Message_OnlyOne Auto

Perk Property ORD_LocMAX_DragonsTeeth_Perk_MAX Auto
Message Property ORD_Loc_DragonsTeeth_Message Auto

Perk Property ORD_Loc60_BreakingWheel_Perk_60 Auto
Float Property ORD_BreakingWheelScaling Auto
Message Property ORD_Loc_BreakingWheel_Message Auto
Float Property ORD_BreakingWheelScalingNew Auto

Actor Property PlayerRef Auto

Perk Property ORD_Loc90_TheRevenge_Perk_90 Auto
Message Property ORD_Loc_BearTraps_Message_OnlyThree Auto

; -----

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	If akOldContainer && !akNewContainer
		; bear trap dropped
		Delete()

		; dragon's teeth
		Activator WhichBearTrap
		If PlayerRef.HasPerk(ORD_LocMAX_DragonsTeeth_Perk_MAX)
			Int BearTrapID = ORD_Loc_DragonsTeeth_Message.Show()
			WhichBearTrap = ORD_Loc_BearTraps_Activator[BearTrapID]
		Else
			WhichBearTrap = ORD_Loc_BearTraps_Activator[0]
		EndIf

		; place bear trap
		ObjectReference CreatedBearTrap = akOldContainer.PlaceAtMe(WhichBearTrap, abInitiallyDisabled = true)

		; big game hunter
		If PlayerRef.HasPerk(ORD_Loc60_BreakingWheel_Perk_60)
	;		Int BreakingWheelType = ORD_Loc_BreakingWheel_Message.Show()
	;		If BreakingWheelType == 1
	;			CreatedBearTrap.SetScale(ORD_BreakingWheelScaling)
	;		EndIf
			CreatedBearTrap.SetScale(ORD_BreakingWheelScalingNew)
		EndIf

		; bear trap placement
		Float CharacterAngle = akOldContainer.GetAngleZ()
		CreatedBearTrap.MoveTo(akOldContainer,ORD_DistanceInFront*Math.Sin(CharacterAngle),ORD_DistanceInFront*Math.Cos(CharacterAngle),ORD_DistanceZ)
		CreatedBearTrap.SetAngle(0,0,CharacterAngle)
		CreatedBearTrap.Enable()
		CreatedBearTrap.PlaceAtMe(ORD_Loc_BearTraps_Explosion)
		ORD_Loc_BearTraps_Sound_Placement.Play(CreatedBearTrap)

	ElseIf akNewContainer
		; bear trap is entering someone/something's inventory

		; more traps
		If PlayerRef.HasPerk(ORD_Loc90_TheRevenge_Perk_90)

			; delete excess if needed
			Int NewTotalCount = akNewContainer.GetItemCount(ORD_Loc_BearTraps_MiscItem)
			If NewTotalCount > 3
				akNewContainer.RemoveItem(ORD_Loc_BearTraps_MiscItem, (NewTotalCount - 3), true, akOldContainer)
				If akNewContainer == PlayerRef
					ORD_Loc_BearTraps_Message_OnlyThree.Show()
				EndIf
			EndIf

		Else

			; delete excess if needed
			Int NewTotalCount = akNewContainer.GetItemCount(ORD_Loc_BearTraps_MiscItem)
			If NewTotalCount > 2
				akNewContainer.RemoveItem(ORD_Loc_BearTraps_MiscItem, (NewTotalCount - 1), true, akOldContainer)
				If akNewContainer == PlayerRef
					ORD_Loc_BearTraps_Message_OnlyOne.Show()
				EndIf
			EndIf

		EndIf
	EndIf

EndEvent

; -----