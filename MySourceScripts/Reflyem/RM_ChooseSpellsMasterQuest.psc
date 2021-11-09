Scriptname RM_ChooseSpellsMasterQuest extends ActiveMagicEffect
{Дает выбор из спелов и удаляет абилку}

Message Property ChooseSpell Auto
FormList Property ListOfMasterSpells auto
Spell Property SelfSpell Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int IndexSpell = ChooseSpell.Show()
	Utility.Wait(1.0)
	akTarget.AddSpell(ListOfMasterSpells.GetAt(IndexSpell) as Spell, true)
    akTarget.RemoveSpell(SelfSpell)
EndEvent
