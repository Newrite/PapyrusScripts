Scriptname MRL_MAG_SeidStoneHazard extends ActiveMagicEffect  

; -----

Int Property LevelMod = 0 Auto
Faction Property IllusionsFaction Auto
Float Property UpdateRate = 1.0 Auto
Spell Property IllusionAbility Auto
Hazard Property IllusionNightmare_Hazard_Seidstone Auto
Float Property Radius = 225.0 Auto


; -----

Actor TheGhost
Actor TheTarget
Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheGhost = akTarget.PlaceActorAtMe(akTarget.GetBaseObject() as ActorBase, LevelMod)
	TheGhost.Disable()

	TheGhost.AddToFaction(IllusionsFaction)
	TheGhost.SetPlayerTeammate(true, false)
	TheGhost.Enable()
	TheGhost.AddSpell(IllusionAbility)

	TheTarget = akTarget
	TheCaster = akCaster
	RegisterForUpdate(UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If TheCaster
		While TheCaster.IsInKillmove()
			Utility.Wait(0.1)
		EndWhile
	EndIf
	TheGhost.Delete()

EndEvent

; -----

Event OnUpdate()

	bool ghost = !TheGhost
	bool dead = TheGhost.IsDead()
	bool find = !Game.FindClosestReferenceOfTypeFromRef(IllusionNightmare_Hazard_Seidstone, TheTarget, Radius)

	;Debug.Notification("GHOST: " + ghost + " DEAD: " + dead + " REFCLOSE: " + find)

	If !TheGhost || TheGhost.IsDead() || !Game.FindClosestReferenceOfTypeFromRef(IllusionNightmare_Hazard_Seidstone, TheTarget, Radius)
		Dispel()
	EndIf

EndEvent

; -----