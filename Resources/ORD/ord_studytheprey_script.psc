Scriptname ORD_StudyThePrey_Script extends activemagiceffect  

; -----

Spell Property ORD_Pic_StudyThePrey_Spell_Proc Auto
Float Property ORD_Delay Auto
String Property ORD_Skill Auto
Int Property ORD_XP Auto
Message Property ORD_Pic_StudyThePrey_Message Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_Delay)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.DispelSpell(ORD_Pic_StudyThePrey_Spell_Proc)

EndEvent

; -----

Event OnUpdate()

	ORD_Pic_StudyThePrey_Spell_Proc.Cast(GetTargetActor())
	Game.AdvanceSkill(ORD_Skill, ORD_XP)
	ORD_Pic_StudyThePrey_Message.Show()

Endevent

; -----