Scriptname ORD_RallyingStandard_Ab_Script extends activemagiceffect  

; -----

Message Property ORD_Hea_RallyingStandard_Message_Want Auto
Message Property ORD_Hea_RallyingStandard_Message_Want_City Auto
Message Property ORD_Hea_RallyingStandard_Message_Want_Faction Auto
FormList Property ORD_Hea_RallyingStandard_FormList_ChosenBanner Auto
FormList Property ORD_Hea_RallyingStandard_FormList_City Auto
FormList Property ORD_Hea_RallyingStandard_FormList_Faction Auto
Spell Property ORD_Hea_RallyingStandard_Spell Auto
Hazard Property ORD_Hea_RallyingStandard_Hazard_FactionImperial Auto
Hazard Property ORD_Hea_RallyingStandard_Hazard_FactionStormcloak Auto
Spell Property ORD_Hea_Warbringer_Spell_RallyingStandard Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Hea_RallyingStandard_FormList_ChosenBanner.Revert()
	Int BannerClass = 999
	Int BannerChosen = 999

	While BannerClass == 999
		BannerClass = ORD_Hea_RallyingStandard_Message_Want.Show()
		If BannerClass == 0
			; city
			BannerChosen = ORD_Hea_RallyingStandard_Message_Want_City.Show()
			If BannerChosen == ORD_Hea_RallyingStandard_FormList_City.GetSize()
				BannerClass = 999
				BannerChosen = 999
			Else
				ORD_Hea_RallyingStandard_FormList_ChosenBanner.AddForm(ORD_Hea_RallyingStandard_FormList_City.GetAt(BannerChosen))
			EndIf
		ElseIf BannerClass == 1
			; faction
			BannerChosen = ORD_Hea_RallyingStandard_Message_Want_Faction.Show()
			If BannerChosen == ORD_Hea_RallyingStandard_FormList_Faction.GetSize()
				BannerClass = 999
				BannerChosen = 999
			Else
				ORD_Hea_RallyingStandard_FormList_ChosenBanner.AddForm(ORD_Hea_RallyingStandard_FormList_Faction.GetAt(BannerChosen))
			EndIf
		ElseIf BannerClass == 2
			ORD_Hea_RallyingStandard_FormList_ChosenBanner.AddForm(ORD_Hea_RallyingStandard_Hazard_FactionImperial)
		Else
			ORD_Hea_RallyingStandard_FormList_ChosenBanner.AddForm(ORD_Hea_RallyingStandard_Hazard_FactionStormcloak)
		EndIf
	EndWhile
	akTarget.AddSpell(ORD_Hea_RallyingStandard_Spell,false)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Hea_RallyingStandard_FormList_ChosenBanner.Revert()
	akTarget.DispelSpell(ORD_Hea_RallyingStandard_Spell)
	akTarget.DispelSpell(ORD_Hea_Warbringer_Spell_RallyingStandard)
	akTarget.RemoveSpell(ORD_Hea_RallyingStandard_Spell)

EndEvent

; -----