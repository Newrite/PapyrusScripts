Scriptname ORD_SOATS_Script extends activemagiceffect  

; -----

Spell[] Property ORD_Spell Auto
GlobalVariable Property ORD_Two_SlayerOfAThousandSons_Global_Count Auto

Quest Property DGIntimidateQuest Auto
Quest Property C00JorrvaskrFight Auto
Location Property WhiterunJorrvaskrLocation Auto
Actor Property PlayerRef Auto

; -----

Int InitialDeaths
Spell SpellToCast

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If (!DGIntimidateQuest.IsRunning() || DGIntimidateQuest.GetCurrentStageID() >= 100) && (!C00JorrvaskrFight.IsRunning() || PlayerRef.GetCurrentLocation() != WhiterunJorrvaskrLocation || C00JorrvaskrFight.GetCurrentStageID() >= 100)
		Int ID = (ORD_Two_SlayerOfAThousandSons_Global_Count.GetValue() as Int)
		InitialDeaths = Game.QueryStat("People Killed") + Game.QueryStat("Animals Killed")
		If ID >= 0
			SpellToCast = ORD_Spell[ID]
			SpellToCast.Cast(akTarget)
		Else
			SpellToCast = NONE
		EndIf
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Float KillDelta = Game.QueryStat("People Killed") + Game.QueryStat("Animals Killed") - InitialDeaths
	akTarget.DispelSpell(SpellToCast)
	KillDelta -= 1	; because spells start at 0, so spell 7 is 8 kills
	If KillDelta > ORD_Spell.Length - 1
		ORD_Two_SlayerOfAThousandSons_Global_Count.SetValue(ORD_Spell.Length - 1)
	Else
		ORD_Two_SlayerOfAThousandSons_Global_Count.SetValue(KillDelta)
	EndIf

EndEvent

; -----