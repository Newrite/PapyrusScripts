Scriptname POT_UndyingPerceptionSoundScript extends ActiveMagicEffect   

Sound Property POT_UndyingPerceptionSoundMarker Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	POT_UndyingPerceptionSoundMarker.Play(akTarget)

EndEvent