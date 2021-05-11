Scriptname WB_NewVancianMagicPersistent_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Alt_NewVancianMagic_Global_Count Auto
GlobalVariable Property ORD_Alt_NewVancianMagic_Global_Count_Max Auto
GlobalVariable Property ORD_Alt_NewVancianMagic_Global_Count_Max_Base Auto
GlobalVariable Property ORD_Alt_NewVancianMagic_Global_Count_Max_PointsOfMana Auto
Perk Property ORD_ScalingPerk Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Int MaxSlots = ORD_Alt_NewVancianMagic_Global_Count_Max_Base.GetValue() as Int
	If akTarget.HasPerk(ORD_ScalingPerk)
		MaxSlots += Math.Floor((akTarget.GetBaseActorValue("Magicka") / ORD_Alt_NewVancianMagic_Global_Count_Max_PointsOfMana.GetValue() as Int))
	EndIf

	; set slots
	ORD_Alt_NewVancianMagic_Global_Count.SetValue(MaxSlots)
	ORD_Alt_NewVancianMagic_Global_Count_Max.SetValue(MaxSlots)

EndEvent

; -----