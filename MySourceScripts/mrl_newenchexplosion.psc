Scriptname MRL_NewEnchExplosion extends ActiveMagicEffect 

SPELL Property spellToCast  Auto  

Event OnEffectStart(Actor Target, Actor Caster)
	Float targetMR = Target.GetActorValue("MagicResist")
    Float mag = Self.GetMagnitude() / (1 - targetMR / 100) 
	spellToCast.SetNthEffectMagnitude(0, mag)
	spellToCast.Cast(Caster)
EndEvent
