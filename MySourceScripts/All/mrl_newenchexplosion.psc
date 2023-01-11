Scriptname MRL_NewEnchExplosion extends ActiveMagicEffect 

SPELL Property spellToCast  Auto  

Event OnEffectStart(Actor Target, Actor Caster)
	spellToCast.SetNthEffectMagnitude(0, Self.GetMagnitude() as float / (1 - Target.GetActorValue("MagicResist") as float / 100))
	spellToCast.Cast(Caster, Target)
EndEvent
