scriptName MRL_GodChoosePermanentBlessing extends activemagiceffect

FormList Property GodsAbilitysList Auto
; Акатош - 0
; Аркей - 1
; Дибелла - 2
; Джулианос - 3
; Кинарет - 4
; Мара - 5
; Стендарр - 6
; Талос - 7
; Зенитар - 8 
; Аури-Эль - 9

Message Property Choose01 Auto ; 0 - Акатош, 1 - Аркей, 2 - Дибелла, 3 - Джулианос, 4 - Кинарет, 5 - Вперед
Message Property Choose02 Auto ; 0 - Назад, 1 - Мара, 2 - Стендарр, 3 - Талос, 4 - Зенитар, 5 - Аури-Эль

GlobalVariable Property GodAreChoosen Auto

MRL_GodsBlessingsHandler Property GodsHandler Auto 

Spell Property selfSpellToRemove auto ; remove after add spell

Actor Caster

bool choosed = false

Function ChooseGod(Actor akCaster)

	int indexChoose = Choose01.Show()
	bool waitChoose = true
	int stateChoose = 0

	Utility.Wait(1.0)

	while waitChoose

		if stateChoose == 0

			if indexChoose == 5

				stateChoose = 1
				indexChoose = Choose02.Show()

			else

				Spell Blessing = none

				if indexChoose == 0
					Blessing = GodsAbilitysList.GetAt(0) as Spell
				elseif indexChoose == 1
					Blessing = GodsAbilitysList.GetAt(1) as Spell
				elseif indexChoose == 2
					Blessing = GodsAbilitysList.GetAt(2) as Spell
				elseif indexChoose == 3
					Blessing = GodsAbilitysList.GetAt(3) as Spell
				elseif indexChoose == 4
					Blessing = GodsAbilitysList.GetAt(4) as Spell
				endif

				GodsHandler.AddBlessingFromPaladinPerk(Blessing)
				waitChoose = false

			endif

		else

			if indexChoose == 0

				stateChoose = 0
				indexChoose = Choose01.Show()

			else

				Spell Blessing = none

				if indexChoose == 1
					Blessing = GodsAbilitysList.GetAt(5) as Spell
				elseif indexChoose == 2
					Blessing = GodsAbilitysList.GetAt(6) as Spell
				elseif indexChoose == 3
					Blessing = GodsAbilitysList.GetAt(7) as Spell
				elseif indexChoose == 4
					Blessing = GodsAbilitysList.GetAt(8) as Spell
				elseif indexChoose == 5
					Blessing = GodsAbilitysList.GetAt(9) as Spell
				endif

				GodsHandler.AddBlessingFromPaladinPerk(Blessing)
				waitChoose = false

			endif

		endif

	endwhile

	Utility.Wait(1.0)
	GodAreChoosen.SetValueInt(1)
	akCaster.RemoveSpell(selfSpellToRemove)

EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Caster = akCaster
    RegisterForMenu("StatsMenu")
endevent

Event OnMenuClose(String MenuName)
    If MenuName == "StatsMenu"
        Utility.WaitMenuMode(0.15)
        if GodAreChoosen.GetValueInt() != 1
            ChooseGod(Caster)
		else
			Caster.RemoveSpell(selfSpellToRemove)
		endif
    endif
EndEvent
