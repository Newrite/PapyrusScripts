Scriptname ORD_SpellTrigger_Ab_Script extends ActiveMagicEffect  

; -----

Int Property ORD_AddIterations Auto
Message Property ORD_Alt_WellocsDormantArcana_Message Auto
Message Property ORD_Alt_WellocsDormantArcana_Message_SpellTriggered Auto
Message Property ORD_Alt_WellocsDormantArcana_Message_SpellTriggered_Combat Auto
Message Property ORD_Alt_WellocsDormantArcana_Message_SpellTriggered_Schools Auto
Message Property ORD_Alt_WellocsDormantArcana_Message_SpellTriggered_Attributes Auto
Message Property ORD_Alt_WellocsDormantArcana_Message_SpellTriggered_Utility Auto
Message[] Property ORD_Alt_WellocsDormantArcana_Message_Saved Auto
Spell[] Property ORD_WellocsDormantArcana_Spell Auto
GlobalVariable Property ORD_Alt_WellocsDormantArcana_Global Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Int i = 1
	Bool ChoiceMadeBreak = false
	Int Choice = -1
	Int SpellTriggered = -1
	Int SpellTrigger = -1

	SpellTrigger = ORD_Alt_WellocsDormantArcana_Message.Show(i)
	; 0 = armor
	; 1 = cloak
	; 2 = con. daedra
	; 3 = con. undead
	; 4 = invisibility
	ORD_Alt_WellocsDormantArcana_Global.SetValue(SpellTrigger)

	While i < (ORD_AddIterations + 1)

		While ChoiceMadeBreak == false

			Choice = ORD_Alt_WellocsDormantArcana_Message_SpellTriggered.Show(i)
			; 0 = combat...
			; 1 = spell schools...
			; 2 = attributes...
			; 3 = utility...

			If Choice == 0
				SpellTriggered = ORD_Alt_WellocsDormantArcana_Message_SpellTriggered_Combat.Show(i)
				; 0 = +10% attack damage
				; 1 = +50 armor
				; 2 = +10% magic resistance
				; 3 = 15% spell absorb
				; 4 = Back...
				If SpellTriggered == 4
					SpellTriggered = -1
					ChoiceMadeBreak = false
				Else
					ChoiceMadeBreak = true
					SpellTriggered += 0
				EndIf

			ElseIf Choice == 1
				SpellTriggered = ORD_Alt_WellocsDormantArcana_Message_SpellTriggered_Schools.Show(i)
				; 0 = +20% alteration duration
				; 1 = +20% conjuration duration
				; 2 = +10% destruction power
				; 3 = +20% illusion duration
				; 4 = +10% restoration power
				; 5 = Back...
				If SpellTriggered == 5
					SpellTriggered = -1
					ChoiceMadeBreak = false
				Else
					ChoiceMadeBreak = true
					SpellTriggered += 4
				EndIf

			ElseIf Choice == 2
				SpellTriggered = ORD_Alt_WellocsDormantArcana_Message_SpellTriggered_Attributes.Show(i)
				; 0 = +50 max Health
				; 1 = +50 max Magicka
				; 2 = +50 max Stamina
				; 3 = +8 Health/sec
				; 4 = +8 Magicka/sec
				; 5 = +8 Stamina/sec
				; 6 = Back...
				If SpellTriggered == 6
					SpellTriggered = -1
					ChoiceMadeBreak = false
				Else
					ChoiceMadeBreak = true
					SpellTriggered += 9
				EndIf

			ElseIf Choice == 3
				SpellTriggered = ORD_Alt_WellocsDormantArcana_Message_SpellTriggered_Utility.Show(i)
				; 0 = -50% fall damage
				; 1 = +50 carry weight
				; 2 = waterbreathing
				; 3 = waterwalking
				; 4 = light
				; 5 = enchantments -10% charge
				; 6 = +5% speed
				; 7 = Back...
				If SpellTriggered == 7
					SpellTriggered = -1
					ChoiceMadeBreak = false
				Else
					ChoiceMadeBreak = true
					SpellTriggered += 15
				EndIf

			EndIf

		EndWhile
		ChoiceMadeBreak = false
		akTarget.AddSpell(ORD_WellocsDormantArcana_Spell[SpellTriggered], false)
		ORD_Alt_WellocsDormantArcana_Message_Saved[SpellTrigger].Show()
		i += 1

	EndWhile

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Int i = 0
	While i < ORD_WellocsDormantArcana_Spell.Length
		akTarget.RemoveSpell(ORD_WellocsDormantArcana_Spell[i])
		i += 1
	EndWhile
	ORD_Alt_WellocsDormantArcana_Global.SetValue(-1)

EndEvent

; -----