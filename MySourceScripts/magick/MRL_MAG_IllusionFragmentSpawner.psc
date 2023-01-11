Scriptname MRL_MAG_IllusionFragmentSpawner extends activemagiceffect  

; -----

Int Property LevelMod = 0 Auto
Spell Property IllusionAbility Auto
Float Property UpdateRate = 0.5 Auto
Faction Property IllusionsFaction Auto

; -----

Actor TheGhost
Actor TheTarget
Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster

	; save target health
	Float TargetStartHealth = akTarget.GetActorValue("Health")
	Float TargetMaxHealth = TargetStartHealth / akTarget.GetActorValuePercentage("Health")

	; spawn ghost
  TheGhost = akCaster.PlaceActorAtMe(akTarget.GetLeveledActorBase(), LevelMod)
  if !TheGhost
    TheGhost = akCaster.PlaceActorAtMe(akTarget.GetActorBase(), LevelMod)
  endif
	TheGhost.AddToFaction(IllusionsFaction)

	; stop ghost
	TheGhost.EnableAI(false)
	TheGhost.AddSpell(IllusionAbility)
	akCaster.StartCombat(TheGhost)

	; modify ghost
	TheGhost.SetActorValue("Health", TargetMaxHealth)
	TheGhost.DamageActorValue("Health", TargetMaxHealth - TargetStartHealth)

	; start cycle
	RegisterForSingleUpdate(UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	While TheCaster.IsInKillmove()
		Utility.Wait(0.1)
	EndWhile
	TheGhost.Delete()

EndEvent

; -----

Event OnDying(Actor akKiller)

	TheTarget.Kill(TheCaster)
	Dispel()

EndEvent

; -----

Event OnUpdate()

	Float GhostHealth = TheGhost.GetActorValue("Health")
	Float TargetHealth = TheTarget.GetActorValue("Health")
	Float GhostHealthDifference = GhostHealth - TargetHealth

	If GhostHealthDifference > 0
		; ghost has more health than target
		TheGhost.DamageActorValue("Health", GhostHealthDifference)
	Else
		; target has more health than ghost
		TheTarget.DamageActorValue("Health", -GhostHealthDifference)
	EndIf

	If TheGhost.IsDead()
		TheTarget.Kill(TheCaster)
		Dispel()
	elseif TheTarget.IsDead()
		While TheCaster.IsInKillmove()
			Utility.Wait(0.1)
		EndWhile
		TheGhost.Delete()
		self.Dispel()
	else
		RegisterForSingleUpdate(UpdateRate)
	EndIf

EndEvent

; -----