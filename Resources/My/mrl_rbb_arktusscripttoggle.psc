ScriptName MRL_RBB_ArktusScriptToggle Extends ActiveMagicEffect

Spell Property ArktusAbility auto

Event OnEffectStart (Actor akTarget, Actor akCaster)
        If akTarget.HasSpell(ArktusAbility) == false
                akTarget.AddSpell(ArktusAbility, false)
        Else
                akTarget.RemoveSpell(ArktusAbility)
        EndIf
EndEvent
