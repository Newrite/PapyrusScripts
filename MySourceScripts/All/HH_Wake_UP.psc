Scriptname HH_Wake_UP extends ActiveMagicEffect

Actor Target
Spell Property HH_SP_Cube_paralyze Auto
Spell Property HH_Abb_Reason_to_cubes Auto
Spell Property HH_SP_Cube_shock Auto
Spell Property HH_SP_Cube_fire Auto
Event OnEffectStart(Actor akTarget, Actor akCaster)
	Target = akTarget
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (akSource as Spell).IsHostile() && akSource != HH_SP_Cube_paralyze
		Target.DispelSpell(HH_SP_Cube_paralyze)
		;debug.messagebox("ÌX")
	endif
		if (akSource as Spell).IsHostile() && akSource != HH_Abb_Reason_to_cubes
		Target.DispelSpell(HH_SP_Cube_paralyze)
		;debug.messagebox("ÌX1")
	endif
			if (akSource as Spell).IsHostile() && (akSource as Spell) != HH_SP_Cube_shock
		Target.DispelSpell(HH_SP_Cube_paralyze)
		;debug.messagebox("ÌX1")
	endif
			if (akSource as Spell).IsHostile() && (akSource as Spell) != HH_SP_Cube_fire
		Target.DispelSpell(HH_SP_Cube_paralyze)
		;debug.messagebox("ÌX1")
	endif
	If (akSource as Weapon != None || akSource as Explosion != None)
		Target.DispelSpell(HH_SP_Cube_paralyze)
	endif
EndEvent