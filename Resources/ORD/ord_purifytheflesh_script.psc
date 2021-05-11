Scriptname ORD_PurifyTheFlesh_Script extends activemagiceffect  

; -----

GlobalVariable Property ORD_Alc_ThatWhichDoesNotKillYou_IsCompleted Auto
Message Property ORD_Alc_ThatWhichDoesNotKillYou_Message Auto
Actor Property PlayerRef Auto
Int Property ORD_Points Auto
Float Property ORD_Alc Auto
Float Property ORD_UpdateRate Auto
Spell Property ORD_Alc_ThatWhichDoesNotKillYou_Spell_AbDmg Auto

; -----

Int StackCount

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_Alc_ThatWhichDoesNotKillYou_IsCompleted.GetValue() == 0
		ORD_Alc_ThatWhichDoesNotKillYou_IsCompleted.SetValue(1)
		PlayerRef.AddSpell(ORD_Alc_ThatWhichDoesNotKillYou_Spell_AbDmg, false)
		RegisterForSingleUpdate(ORD_UpdateRate)
	EndIf

EndEvent

; -----

Event OnUpdate()

	PlayerRef.RemoveSpell(ORD_Alc_ThatWhichDoesNotKillYou_Spell_AbDmg)
	ORD_Alc_ThatWhichDoesNotKillYou_Message.Show()
	Game.AddPerkPoints(ORD_Points)
	PlayerRef.ModActorValue("AlchemyPowerMod", ORD_Alc)

Endevent

; -----