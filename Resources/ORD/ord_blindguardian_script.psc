Scriptname ORD_BlindGuardian_Script extends activemagiceffect  

; -----

Int Property ORD_LevelMod = 0 Auto
Float Property ORD_DistanceInFront Auto

Faction Property MagicAllegianceFaction Auto
Float Property ORD_UpdateRate Auto

Spell Property ORD_Ill_BlindGuardian_Spell_Ab Auto
Faction Property ORD_IllusoryEntity_Faction Auto

Float Property ORD_SpeedPenalty Auto

Spell Property ORD_Ill_BlindGuardian_Spell_Proc Auto

; -----

Actor TheGhost
Actor TheTarget
Actor TheCaster
Actor TheCombatTarget

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
	TheGhost.AddSpell(ORD_Ill_BlindGuardian_Spell_Ab)
	TheGhost.SetGhost(true)

	TheGhost.BlockActivation()
	TheGhost.AllowPCDialogue(false)
	TheGhost.ModAV("SpeedMult", ORD_SpeedPenalty)
	TheGhost.ModAV("CarryWeight", -5)

	TheCombatTarget = akTarget.GetCombatTarget()
	If TheCombatTarget
		TheGhost.StopCombat()
		TheGhost.StartCombat(TheCombatTarget)
	EndIf

	TheTarget = akTarget
	TheCaster = akCaster
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheGhost.Delete()

EndEvent

; -----

Event OnUpdate()

	If !TheGhost || TheGhost.IsDead() || !TheTarget.IsInCombat()
		TheTarget.DispelSpell(ORD_Ill_BlindGuardian_Spell_Proc)
	Else
		If TheCombatTarget != TheTarget.GetCombatTarget()
			TheCombatTarget = TheTarget.GetCombatTarget()
			TheGhost.StopCombat()
			TheGhost.StartCombat(TheCombatTarget)
		EndIf
		RegisterForSingleUpdate(ORD_UpdateRate)
	EndIf

EndEvent

; -----