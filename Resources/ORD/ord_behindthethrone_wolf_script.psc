Scriptname ORD_BehindTheThrone_Wolf_Script extends activemagiceffect  


; -----

Int Property ORD_LevelMod = 0 Auto
Float Property ORD_UpdateRate Auto
ActorBase Property ORD_Arc_BehindTheThrone_Actor Auto
Float Property ORD_DamagePerStatMult Auto
Actor Property PlayerRef Auto

; -----

Actor TheWolf

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float WolfDamage = (PlayerRef.GetAV("Stamina") * ORD_DamagePerStatMult)

	Float CasterAngle = PlayerRef.GetAngleZ()
	TheWolf = akTarget.PlaceActorAtMe(ORD_Arc_BehindTheThrone_Actor, ORD_LevelMod)
	TheWolf.SetPlayerTeammate(true, false)
	TheWolf.SetAV("UnarmedDamage", WolfDamage)

	Actor AttackTarget = akTarget.GetCombatTarget()
	If AttackTarget
		TheWolf.StartCombat(AttackTarget)
	EndIf
	TheWolf.IgnoreFriendlyHits(true)

	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheWolf.Delete()

EndEvent

; -----

Event OnUpdate()

	If !TheWolf || TheWolf.IsDead() || PlayerRef.IsInCombat() == 0
		Dispel()
	Else
		Actor WolfTarget = TheWolf.GetCombatTarget()
		If WolfTarget != PlayerRef.GetCombatTarget()
			TheWolf.StopCombat()
			TheWolf.StartCombat(PlayerRef.GetCombatTarget())
		EndIf
		RegisterForSingleUpdate(ORD_UpdateRate)
	EndIf

EndEvent

; -----
