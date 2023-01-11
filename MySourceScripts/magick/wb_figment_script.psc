Scriptname WB_Figment_Script extends activemagiceffect  

; -----

Int Property WB_LevelMod = 0 Auto
Spell Property WB_S_I050_FigmentOfPain_Spell_Ab Auto
Float Property WB_UpdateRate Auto
Faction Property WB_IllusoryEntity_Faction Auto

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
	TheGhost = akTarget.PlaceActorAtMe(akTarget.GetBaseObject() as ActorBase, WB_LevelMod)
	TheGhost.AddToFaction(WB_IllusoryEntity_Faction)

	; stop ghost
	TheGhost.EnableAI(false)
	TheGhost.AddSpell(WB_S_I050_FigmentOfPain_Spell_Ab)
	akCaster.StartCombat(TheGhost)

	; modify ghost
	TheGhost.SetActorValue("Health", TargetMaxHealth)
	TheGhost.DamageActorValue("Health", TargetMaxHealth - TargetStartHealth)

	; start cycle
	RegisterForSingleUpdate(WB_UpdateRate)

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

	RegisterForSingleUpdate(WB_UpdateRate)

	If TheGhost.IsDead()
		TheTarget.Kill(TheCaster)
		Dispel()
	EndIf

EndEvent

; -----