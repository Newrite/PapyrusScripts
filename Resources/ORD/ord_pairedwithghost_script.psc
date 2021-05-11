Scriptname ORD_PairedWithGhost_Script extends activemagiceffect  

; -----

ActorBase Property ORD_Ghost Auto
Idle Property ORD_Idle Auto
Faction Property MagicAllegianceFaction Auto
Spell Property ORD_Ill_Spell_Ab Auto
Spell Property ORD_Ill_Spell_Proc Auto
Float Property ORD_UpdateRate Auto
Int Property ORD_LevelMod Auto
Faction Property ORD_IllusoryEntity_Faction Auto
Keyword Property ActorTypeNPC Auto

; -----

Actor TheGhost
Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheGhost = akTarget.PlaceActorAtMe(ORD_Ghost, ORD_LevelMod)
	TheGhost.Disable()

	If ORD_IllusoryEntity_Faction
		TheGhost.AddToFaction(ORD_IllusoryEntity_Faction)
	EndIf
;	TheGhost.AddToFaction(MagicAllegianceFaction)
;	TheGhost.SetPlayerTeammate(true, false)

	TheGhost.Enable()
	TheGhost.AddSpell(ORD_Ill_Spell_Ab)

;	TheGhost.DrawWeapon()
	Utility.Wait(1.25)
	If akTarget.HasKeyword(ActorTypeNPC)
		TheGhost.PlayIdleWithTarget(ORD_Idle, akTarget)
		akTarget.SendAssaultAlarm()
	EndIf
	TheGhost.SetGhost(true)

	TheGhost.BlockActivation()
	TheGhost.AllowPCDialogue(false)
	TheTarget = akTarget
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheGhost.Delete()

EndEvent

; -----

Event OnUpdate()

	If !TheGhost || TheGhost.IsDead() || TheTarget.IsDead()
		TheTarget.Kill(GetCasterActor())
		TheTarget.DispelSpell(ORD_Ill_Spell_Proc)
	Else
		TheGhost.PlayIdleWithTarget(ORD_Idle, TheTarget)
		RegisterForSingleUpdate(ORD_UpdateRate)
	EndIf

EndEvent

; -----