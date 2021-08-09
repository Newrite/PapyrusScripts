Scriptname MRL_DamageHealthSimple extends ActiveMagicEffect
{Скрипт наносит урон здоровью, сделано что бы не влияли проценты входящего.}

float Property DamageAmount Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.DamageActorValue("health", DamageAmount)
EndEvent