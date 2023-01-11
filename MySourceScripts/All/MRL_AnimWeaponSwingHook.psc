Scriptname MRL_AnimWeaponSwingHook extends ActiveMagicEffect

Spell property SpellWeaponSwing auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.DoCombatSpellApply(SpellWeaponSwing, akTarget)
EndEvent
