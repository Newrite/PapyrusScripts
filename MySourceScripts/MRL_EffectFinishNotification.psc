Scriptname MRL_EffectFinishNotification extends ActiveMagicEffect
{The documentation string.}

String Property MessagePrint Auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    Debug.Notification(MessagePrint)
EndEvent