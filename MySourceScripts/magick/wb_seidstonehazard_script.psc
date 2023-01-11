Scriptname WB_SeidstoneHazard_Script extends ActiveMagicEffect  

; -----

Int Property WB_LevelMod = 0 Auto
Faction Property MagicAllegianceFaction Auto
Float Property WB_UpdateRate Auto
Spell Property WB_S_I050_EvilTwin_Spell_Ab Auto
GlobalVariable Property WB_Illusion_Global_IsControlling Auto
Bool Property WB_Retaliate Auto
Faction Property WB_IllusoryEntity_Faction Auto
Hazard Property WB_IllusionNightmare_Hazard_Seidstone Auto
Float Property WB_Radius Auto


; -----

Actor TheGhost
Actor TheTarget
Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheGhost = akTarget.PlaceActorAtMe(akTarget.GetBaseObject() as ActorBase, WB_LevelMod)
	TheGhost.Disable()

	TheGhost.AddToFaction(WB_IllusoryEntity_Faction)
	TheGhost.AddToFaction(MagicAllegianceFaction)
	TheGhost.SetPlayerTeammate(true, false)
	TheGhost.Enable()
	TheGhost.AddSpell(WB_S_I050_EvilTwin_Spell_Ab)

;	If akTarget.IsHostileToActor(akCaster)
;		TheGhost.StartCombat(akTarget)
;		If WB_Retaliate
;			akTarget.StartCombat(TheGhost)
;		EndIf
;	EndIf

	TheTarget = akTarget
	TheCaster = akCaster
	RegisterForUpdate(WB_UpdateRate)

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

	If !TheGhost || TheGhost.IsDead() || !Game.FindClosestReferenceOfTypeFromRef(WB_IllusionNightmare_Hazard_Seidstone, TheTarget, WB_Radius)
		Dispel()
	EndIf

EndEvent

; -----