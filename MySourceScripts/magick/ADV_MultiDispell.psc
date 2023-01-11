Scriptname ADV_MultiDispell extends ActiveMagicEffect

Spell Property ToRemove01 Auto
Spell Property ToRemove02 Auto
Spell Property ToRemove03 Auto
Spell Property ToRemove04 Auto
Spell Property ToRemove05 Auto
Spell Property ToRemove06 Auto

String Property MessageShow Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    akTarget.RemoveSpell(ToRemove01)
    akTarget.RemoveSpell(ToRemove02)
    akTarget.RemoveSpell(ToRemove03)
	akTarget.RemoveSpell(ToRemove04)
    akTarget.RemoveSpell(ToRemove05)
    akTarget.RemoveSpell(ToRemove06)

     Debug.Notification(MessageShow)

endEvent
