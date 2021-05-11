Scriptname ORD_PerkReset_Script extends activemagiceffect  

; -----

Message Property ORD_PerkReset_Message_Start Auto
Message Property ORD_PerkReset_Message_Finish Auto
Message Property ORD_PerkReset_Message_Spells Auto
FormList Property ORD_PerkReset_FormList_AllPerksToReset Auto
FormList Property ORD_PerkReset_FormList_AllSpellsToRemove Auto
GlobalVariable Property PerkDaedricMind Auto
GlobalVariable Property PerkGoldenTouch Auto
GlobalVariable Property PerkMasterTrader Auto
GlobalVariable Property SpecialLootChance Auto
GlobalVariable Property SpeechEasy Auto
GlobalVariable Property SpeechAverage Auto
GlobalVariable Property SpeechHard Auto
GlobalVariable Property SpeechVeryHard Auto
Actor Property PlayerRef Auto
Quest Property PerksQuest Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_PerkReset_Message_Start.Show()

	Int i
	Int PerkCountRemoved = 0
	Int MaxSize

	PerkDaedricMind.SetValue(0)
	PerkGoldenTouch.SetValue(100)
	PerkMasterTrader.SetValue(100)
	SpecialLootChance.SetValue(90)
	SpeechEasy.SetValue(25)
	SpeechAverage.SetValue(50)
	SpeechHard.SetValue(75)
	SpeechVeryHard.SetValue(100)

	i = 0
	MaxSize = ORD_PerkReset_FormList_AllSpellsToRemove.GetSize()

	; spells
	While i < MaxSize
		If PlayerRef.HasSpell(ORD_PerkReset_FormList_AllSpellsToRemove.GetAt(i) as Spell)
			PlayerRef.RemoveSpell(ORD_PerkReset_FormList_AllSpellsToRemove.GetAt(i) as Spell)
			PlayerRef.DispelSpell(ORD_PerkReset_FormList_AllSpellsToRemove.GetAt(i) as Spell)
		EndIf
		i += 1
	EndWhile

	i = 0
	MaxSize = ORD_PerkReset_FormList_AllPerksToReset.GetSize()

	; perks
	While i < MaxSize
		If PlayerRef.HasPerk(ORD_PerkReset_FormList_AllPerksToReset.GetAt(i) as Perk)
			PlayerRef.RemovePerk(ORD_PerkReset_FormList_AllPerksToReset.GetAt(i) as Perk)
			Game.AddPerkPoints(1)
			PerkCountRemoved += 1
		EndIf
		i += 1
	EndWhile

	PerksQuest.Reset()

	ORD_PerkReset_Message_Finish.Show(PerkCountRemoved)

EndEvent

; -----