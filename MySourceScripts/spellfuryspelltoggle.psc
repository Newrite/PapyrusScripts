Scriptname SpellFurySpellToggle extends activemagiceffect

Spell Property ToggledAbility auto

Event OnEffectStart (Actor akTarget, Actor akCaster)
        If akTarget.HasSpell(ToggledAbility) == false
                akTarget.AddSpell(ToggledAbility, false)
        Else
                akTarget.RemoveSpell(ToggledAbility)
        EndIf
EndEvent