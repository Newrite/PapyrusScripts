Scriptname ORD_Encore_Script extends activemagiceffect  

; -----

Spell Property ORD_Spe_Perform_Spell Auto
Spell Property ORD_Spe_Perform_Spell_LesserPower Auto
Float Property ORD_SafetyWait Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(ORD_SafetyWait)
	If akTarget.HasSpell(ORD_Spe_Perform_Spell)
		; replace with lesser power
		If akTarget.GetEquippedSpell(2) == ORD_Spe_Perform_Spell
			akTarget.AddSpell(ORD_Spe_Perform_Spell_LesserPower, false)
			akTarget.EquipSpell(ORD_Spe_Perform_Spell_LesserPower, 2)
		Else
			akTarget.AddSpell(ORD_Spe_Perform_Spell_LesserPower, false)
		EndIf
		akTarget.RemoveSpell(ORD_Spe_Perform_Spell)
	Else
		Debug.Trace("ORDINATOR WARNING: Encore is trying to remove Basic Perform but can't. Assuming either cheating or a race condition.", 1)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.RemoveSpell(ORD_Spe_Perform_Spell)
	akTarget.RemoveSpell(ORD_Spe_Perform_Spell_LesserPower)

EndEvent

; -----