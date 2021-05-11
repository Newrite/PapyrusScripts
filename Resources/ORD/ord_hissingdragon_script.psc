Scriptname ORD_HissingDragon_Script extends activemagiceffect  

; -----

FormList Property ORD_Lia_HissingDragon_FormList Auto
Message Property ORD_Lia_HissingDragon_Message Auto
Spell[] Property ORD_Lia_HissingDragon_Spell_Proc Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Lia_HissingDragon_FormList.Revert()
	Int SpellChoice = ORD_Lia_HissingDragon_Message.Show()
	ORD_Lia_HissingDragon_FormList.AddForm(ORD_Lia_HissingDragon_Spell_Proc[SpellChoice])

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Lia_HissingDragon_FormList.Revert()

EndEvent

; -----