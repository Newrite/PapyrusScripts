Scriptname ORD_DreamThief_Script extends activemagiceffect  

; -----

Spell Property ORD_Ill_DreamThief_Spell_ProcSelf Auto
Message Property ORD_Ill_DreamThief_Message_Success Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Ill_DreamThief_Spell_ProcSelf.Cast(akCaster)
	ORD_Ill_DreamThief_Message_Success.Show()

EndEvent

; -----