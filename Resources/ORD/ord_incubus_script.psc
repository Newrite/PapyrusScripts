Scriptname ORD_Incubus_Script extends activemagiceffect  

; -----

Float Property ORD_WakeUpChance Auto
Message Property ORD_Ill_DreamThief_Message_WakeUp Auto
Message Property ORD_Ill_Incubus_Message_Success Auto
Spell Property ORD_Ill_Incubus_Spell_Proc_ReverseCast Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float WakeUpChance = ORD_WakeUpChance * (100 - akCaster.GetAV("Illusion"))
	If Utility.RandomFloat(0,100) < WakeUpChance
		akTarget.MoveTo(akTarget)
		ORD_Ill_DreamThief_Message_WakeUp.Show()
		Utility.Wait(3.0)
	Else
		akTarget.DoCombatSpellApply(ORD_Ill_Incubus_Spell_Proc_ReverseCast, akCaster)
		Utility.Wait(1.0)
		akTarget.Kill(akCaster)
		ORD_Ill_Incubus_Message_Success.Show()
		Utility.Wait(2.0)
	EndIf

EndEvent

; -----