Scriptname MRL_MAG_EnchFrostSpell extends ActiveMagicEffect 

SPELL Property PhysicSpell  Auto  

Event OnEffectStart(Actor Target, Actor Caster)
	float mag = Self.GetMagnitude() as float / (1 - Target.GetActorValue("MagicResist") as float / 100)
	PhysicSpell.SetNthEffectMagnitude(0, mag)
	PhysicSpell.Cast(Caster, Target)
EndEvent
