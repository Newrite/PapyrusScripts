Scriptname ORD_Perform_Script extends activemagiceffect  

; -----

Quest Property ORD_Performer_Quest Auto
Quest Property ORD_Performer_Quest_IrresistibleDance Auto

Perk Property ORD_Spe70_IrresistibleDance_Perk_70 Auto
Message Property ORD_Spe_Perform_Message_Fail Auto

Spell Property ORD_Spe_Perform_Spell_Stop Auto
Spell Property ORD_Spe_Perform_Spell Auto
Spell Property ORD_Spe_Perform_Spell_LesserPower Auto

Quest Property ORD_Performer_Quest_EarthquakeDrum Auto
Perk Property ORD_Spe80_EarthquakeDrum_Perk_80 Auto
Message Property ORD_Spe_Perform_Message_EarthquakeDrum Auto
Spell Property ORD_Spe_EarthquakeDrum_Spell_Proc Auto
Spell Property ORD_Spe_EarthquakeDrum_Spell_Proc_Witchdrum Auto
Perk Property ORD_Spe80_Witchdrum_Perk_80 Auto

Perk Property ORD_Spe90_PulseOfNature_Perk_90 Auto
Spell Property ORD_Spe_PulseOfNature_Spell_Proc Auto

Float Property ORD_UpdateRate Auto

; -----

Actor TargetActor
Spell DrumSpell
Bool HasPulse = false

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	Float CombatState
	CombatState = akTarget.GetCombatState()
	CombatState = akTarget.GetCombatState() ;bugfix
	If CombatState == 0
		ORD_Performer_Quest.Start()
;		akTarget.EquipSpell(ORD_Spe_Perform_Spell_Stop, 2)	; cannot interrupt regular performing
	ElseIf akTarget.HasPerk(ORD_Spe70_IrresistibleDance_Perk_70)
		If akTarget.HasPerk(ORD_Spe80_EarthquakeDrum_Perk_80)
			Int WhichInstrument = ORD_Spe_Perform_Message_EarthquakeDrum.Show()
			If WhichInstrument == 0
				ORD_Performer_Quest_IrresistibleDance.Start()
			Else
				ORD_Performer_Quest_EarthquakeDrum.Start()
				If akTarget.HasPerk(ORD_Spe80_Witchdrum_Perk_80)
					DrumSpell = ORD_Spe_EarthquakeDrum_Spell_Proc_Witchdrum
				Else
					DrumSpell = ORD_Spe_EarthquakeDrum_Spell_Proc
				EndIf
				If akTarget.HasPerk(ORD_Spe90_PulseOfNature_Perk_90)
					HasPulse = true
				EndIf
				RegisterForSingleUpdate(ORD_UpdateRate)
			EndIf
		Else
			ORD_Performer_Quest_IrresistibleDance.Start()
		EndIf
		Utility.Wait(2.5)
		akTarget.EquipSpell(ORD_Spe_Perform_Spell_Stop, 2)
	Else
		ORD_Spe_Perform_Message_Fail.Show()
		Dispel()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If akTarget.GetEquippedSpell(2) == ORD_Spe_Perform_Spell_Stop
		If akTarget.HasSpell(ORD_Spe_Perform_Spell_LesserPower)
			akTarget.EquipSpell(ORD_Spe_Perform_Spell_LesserPower, 2)
		Else
			akTarget.EquipSpell(ORD_Spe_Perform_Spell, 2)
		EndIf
	EndIf

EndEvent

; -----

Event OnUpdate()

	RegisterForSingleUpdate(ORD_UpdateRate)
	DrumSpell.Cast(TargetActor)
	If HasPulse
		ORD_Spe_PulseOfNature_Spell_Proc.Cast(TargetActor)
	EndIf

EndEvent

; -----