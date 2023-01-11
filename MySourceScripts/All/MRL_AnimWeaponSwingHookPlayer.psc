Scriptname MRL_AnimWeaponSwingHookPlayer extends ActiveMagicEffect

GlobalVariable property GlobalWeaponSwing auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    GlobalWeaponSwing.Mod(1.0)
EndEvent
