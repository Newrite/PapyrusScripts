Scriptname ORD_Beeline_Script extends activemagiceffect  

; -----

LeveledItem Property ORD_Pic_ThiefsEye_Litem Auto
Message Property ORD_Pic_LuckyShadow_Message Auto
LeveledItem[] Property ORD_LitemToAdd Auto
LeveledItem Property ORD_Pic_BloodAndPlunder_Litem Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Int WhichItemType = ORD_Pic_LuckyShadow_Message.Show()
	LeveledItem LitemToAdd = ORD_LitemToAdd[WhichItemType]

	; thiefs eye
	ORD_Pic_ThiefsEye_Litem.AddForm(LitemToAdd, 2, 1)
	ORD_Pic_ThiefsEye_Litem.AddForm(LitemToAdd, 4, 1)

	; bloodandplunder
	ORD_Pic_BloodAndPlunder_Litem.AddForm(LitemToAdd, 1, 1)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Pic_ThiefsEye_Litem.Revert()
	ORD_Pic_BloodAndPlunder_Litem.Revert()

EndEvent

; -----