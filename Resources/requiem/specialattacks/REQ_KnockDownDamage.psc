Scriptname REQ_KnockdownDamage extends ActiveMagicEffect
{scale the knockdown damage with the enemies armor rating...}

Int Property BaseDamage Auto
{base damage of the attack, is scaled by a power of the attacker's mass}
Int Property MassPower Auto
{the power attacker's the mass should be scaled with}
Float Property MassOffset = 0.0 Auto
{offset for the attackers mass, e.g. while riding a horse}

Event OnEffectStart(actor Target, actor Caster)
	Float mass = Caster.GetAV("mass") + MassOffset
	Float Damage = BaseDamage * Math.pow(mass, MassPower)
	Damage *= 1 - 0.0012 * Target.GetAV("DamageResist")
	If Damage > 0
		Target.DamageAV("Health", Damage )
	EndIf
EndEvent
