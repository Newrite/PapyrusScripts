Scriptname ORD_SpiritTeacher_Ab_Script extends activemagiceffect  


; -----

Quest Property ORD_SpiritTeacher_Quest Auto
Float Property ORD_WaitBeforeStart = 0.0 Auto
Spell Property ORD_Res_SpiritTeacher_Spell_AbBlessing1 Auto
Spell Property ORD_Res_SpiritTeacher_Spell_AbBlessing2 Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget == Game.GetPlayer()
		RegisterForSingleUpdate(ORD_WaitBeforeStart)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If akTarget == Game.GetPlayer()
		ORD_SpiritTeacher_Quest.Stop()
		Game.GetPlayer().RemoveSpell(ORD_Res_SpiritTeacher_Spell_AbBlessing1)
		Game.GetPlayer().RemoveSpell(ORD_Res_SpiritTeacher_Spell_AbBlessing2)
	EndIf

EndEvent

; -----

Event OnUpdate()

	ORD_SpiritTeacher_Quest.Start()

EndEvent

; -----