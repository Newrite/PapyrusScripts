Scriptname ORD_Nemesis_Script extends activemagiceffect  

; -----

Int Property ORD_LevelMod = 0 Auto
Float Property ORD_DistanceInFront Auto

Faction Property MagicAllegianceFaction Auto
Float Property ORD_UpdateRate Auto

Spell Property ORD_Ill_Nemesis_Spell_Ab Auto
Faction Property ORD_IllusoryEntity_Faction Auto

Float Property ORD_SpeedPenalty Auto

GlobalVariable Property ORD_Ill_Nemesis_Global_NextActivate Auto
GlobalVariable Property GameDaysPassed Auto

Float Property ORD_WeirdDamage Auto

Spell Property ORD_Ill_Nemesis_Spell_Proc Auto

; -----

Actor TheGhost
Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float EndLocX
	Float EndLocY

	Float TargetAngle = akTarget.GetAngleZ()
	TheGhost = akTarget.PlaceActorAtMe(akTarget.GetBaseObject() as ActorBase, ORD_LevelMod)
	TheGhost.Disable()

	EndLocX = (ORD_DistanceInFront*Math.Sin(TargetAngle))
	EndLocY = (ORD_DistanceInFront*Math.Cos(TargetAngle))

	TheGhost.MoveTo(akTarget,EndLocX,EndLocY,0)
	TheGhost.SetAngle(akTarget.GetAngleX(), akTarget.GetAngleY(), TargetAngle)

	If ORD_IllusoryEntity_Faction
		TheGhost.AddToFaction(ORD_IllusoryEntity_Faction)
	EndIf
	TheGhost.AddToFaction(MagicAllegianceFaction)
	TheGhost.SetPlayerTeammate(true, false)

	TheGhost.Enable()
	TheGhost.AddSpell(ORD_Ill_Nemesis_Spell_Ab)
;	TheGhost.SetGhost(true)

	TheGhost.StartCombat(akTarget)
	akTarget.StartCombat(TheGhost)

	TheGhost.BlockActivation()
	TheGhost.AllowPCDialogue(false)
	TheGhost.ModAV("SpeedMult", ORD_SpeedPenalty)
	TheGhost.ModAV("CarryWeight", -5)
	TheGhost.ModAV("AttackDamageMult", akCaster.GetAV("Illusion") * ORD_WeirdDamage / 100)

	TheTarget = akTarget
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheGhost.Delete()

EndEvent

; -----

Event OnUpdate()

	If !TheGhost || TheGhost.IsDead() || !TheTarget.IsInCombat()
		TheTarget.DispelSpell(ORD_Ill_Nemesis_Spell_Proc)
	Else
		RegisterForSingleUpdate(ORD_UpdateRate)
	EndIf
	If TheGhost.GetCombatTarget() != TheTarget
		TheGhost.StopCombat()
		TheGhost.StartCombat(TheTarget)
	EndIf

EndEvent

; -----
