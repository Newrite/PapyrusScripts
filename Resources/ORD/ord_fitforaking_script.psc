Scriptname ORD_FitForAKing_Script extends activemagiceffect  

; -----

Keyword Property ArmorLight Auto
Keyword Property ArmorBoots Auto
Keyword Property ArmorCuirass Auto
Keyword Property ArmorGauntlets Auto
Keyword Property ArmorHelmet Auto
Actor Property PlayerRef Auto

Keyword Property MagicInvisibility Auto
MagicEffect Property VoiceMakeEthereal auto

Quest Property DGIntimidateQuest Auto
Quest Property C00JorrvaskrFight Auto
Location Property WhiterunJorrvaskrLocation Auto

Float Property ORD_Chance Auto
Perk Property ORD_Hea40_FaceOfDeath_Perk_40 Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If (!PlayerRef.WornHasKeyword(ArmorLight) && PlayerRef.WornHasKeyword(ArmorBoots) && PlayerRef.WornHasKeyword(ArmorCuirass) && PlayerRef.WornHasKeyword(ArmorGauntlets) && (PlayerRef.WornHasKeyword(ArmorHelmet) || PlayerRef.HasPerk(ORD_Hea40_FaceOfDeath_Perk_40)))
		If ((PlayerRef.HasMagicEffect(VoiceMakeEthereal) == false) && (PlayerRef.HasEffectKeyword(MagicInvisibility) == false))
			If (!DGIntimidateQuest.IsRunning() || DGIntimidateQuest.GetCurrentStageID() >= 100) && (!C00JorrvaskrFight.IsRunning() || PlayerRef.GetCurrentLocation() != WhiterunJorrvaskrLocation || C00JorrvaskrFight.GetCurrentStageID() >= 100)
				Spell TheSpell = PlayerRef.GetEquippedSpell(2)
				If TheSpell && Utility.RandomFloat(0.0,1.0) < ORD_Chance
					TheSpell.Cast(PlayerRef)
				EndIf
			EndIf
		EndIf
	EndIf

EndEvent

; -----