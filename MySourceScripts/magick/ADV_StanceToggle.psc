Scriptname ADV_StanceToggle extends ActiveMagicEffect

Spell Property StyleToApply Auto
Spell Property StyleToRemove01 Auto
Spell Property StyleToRemove02 Auto

String Property MessageShow Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    if !akTarget.HasSpell(StyleToApply)

        akTarget.AddSpell(StyleToApply, false)
        akTarget.RemoveSpell(StyleToRemove01)
        akTarget.RemoveSpell(StyleToRemove02)

        Debug.Notification(MessageShow)

    endif

endEvent
