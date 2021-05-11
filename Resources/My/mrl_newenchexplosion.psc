Scriptname MRL_NewEnchExplosion extends ActiveMagicEffect 

SPELL Property spellToCast  Auto  

Event OnEffectStart(Actor Target, Actor Caster)
	Float mag = Self.GetMagnitude() as Float
	spellToCast.SetNthEffectMagnitude(0, mag)
	spellToCast.Cast(Caster, Target)
EndEvent