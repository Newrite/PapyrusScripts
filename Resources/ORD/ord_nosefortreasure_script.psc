Scriptname ORD_NoseForTreasure_Script extends activemagiceffect  

; -----

LeveledItem Property ORD_Loc_RobbersEye_Litem Auto
Message Property ORD_Loc_NoseForTreasure_Message Auto
LeveledItem[] Property ORD_LitemToAdd Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Int WhichItemType = ORD_Loc_NoseForTreasure_Message.Show()
	; robbers eye
	ORD_Loc_RobbersEye_Litem.AddForm(ORD_LitemToAdd[WhichItemType], 2, 1)
	ORD_Loc_RobbersEye_Litem.AddForm(ORD_LitemToAdd[WhichItemType], 4, 1)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Loc_RobbersEye_Litem.Revert()

EndEvent

; -----