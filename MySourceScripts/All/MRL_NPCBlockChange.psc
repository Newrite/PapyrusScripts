Scriptname MRL_NPCBlockChange extends ActiveMagicEffect
{Скрипт деактивирует блок у нпс если они долго стоят в блоке}

Spell Property SpellBlockBashAndBlock Auto
Int Property MaxTimeInBlock Auto


function OnEffectStart(actor akTarget, actor akCaster)
    Utility.wait(MaxTimeInBlock)
        if akTarget.GetAnimationVariableBool("IsBlocking")
            Debug.SendAnimationEvent(akTarget, "blockStop")
        endIf
    SpellBlockBashAndBlock.Cast(akTarget, akTarget)
endFunction

