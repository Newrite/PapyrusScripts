scriptName mrlremovespellfromlist extends activemagiceffect

FormList Property ListOfSpells auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    Int iIndex = ListOfSpells.GetSize() as int
    While iIndex
        iIndex -= 1
        akTarget.RemoveSpell(ListOfSpells.GetAt(iIndex) As Spell)
    EndWhile
	
endEvent