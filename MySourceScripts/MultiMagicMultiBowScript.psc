Scriptname MultiMagicMultiBowScript extends activemagiceffect  

Float Damage

Faction Property faction01  Auto  

GlobalVariable Property multiDamageRate  Auto  

Event OnEffectStart(Actor Target, Actor Caster)

	Actor PlayerActor = Game.GetPlayer()

	if !Target.IsInFaction(faction01) && !Target.IsDead()

		if !Target.IsHostileToActor(PlayerActor)
			return
		endif

		Damage =  PlayerActor.getav("marksman") as float

		Damage *= 0.8
		Damage *= multiDamageRate.getValue()

		Target.DamageAv("Health", Damage)

		Target.StartCombat(PlayerActor)

	endif
	
EndEvent