Scriptname ODN_IllusorySimulacrum_Script extends activemagiceffect  

; -----

Int Property ODN_LevelMod = 0 Auto
Spell Property ODN_Ill_Simulacrum2_Spell_IllusorySimulacrum_Ab Auto
Faction Property MagicAllegianceFaction Auto

; -----

Actor GhostRef

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float CasterAngle = akCaster.GetAngleZ()
	GhostRef = akTarget.PlaceActorAtMe(akTarget.GetBaseObject() as ActorBase, ODN_LevelMod)
	GhostRef.Disable()

;	EndLocX = ODN_DistanceInFront*Math.Sin(CasterAngle)
;	EndLocY = ODN_DistanceInFront*Math.Cos(CasterAngle)
;	GhostRef.MoveTo(akCaster,EndLocX,EndLocY,0)
;	GhostRef.SetAngle(akCaster.GetAngleX(), akCaster.GetAngleY(), CasterAngle)

	GhostRef.AddToFaction(MagicAllegianceFaction)
	GhostRef.SetPlayerTeammate(true, false)
	GhostRef.SetGhost(true)
	GhostRef.Enable()
	Utility.Wait(0.1)
	GhostRef.AddSpell(ODN_Ill_Simulacrum2_Spell_IllusorySimulacrum_Ab)

	If akTarget.IsHostileToActor(akCaster)
		GhostRef.StartCombat(akTarget)
		akTarget.StartCombat(akCaster)
	EndIf


EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If akCaster
		While akCaster.IsInKillmove() || GhostRef.IsInKillmove()
			Utility.Wait(0.1)
		EndWhile
	EndIf
	GhostRef.Delete()

EndEvent

; -----
