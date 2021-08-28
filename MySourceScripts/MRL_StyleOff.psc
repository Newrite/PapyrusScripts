Scriptname MRL_StyleOff extends ActiveMagicEffect

Spell Property StyleToRemove01 Auto
Spell Property StyleToRemove02 Auto
Spell Property StyleToRemove03 Auto

String Property MessageShow Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    akTarget.RemoveSpell(StyleToRemove01)
    akTarget.RemoveSpell(StyleToRemove02)
    akTarget.RemoveSpell(StyleToRemove03)

     Debug.Notification(MessageShow)

endEvent
