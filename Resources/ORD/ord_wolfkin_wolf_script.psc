Scriptname ORD_Wolfkin_Wolf_Script extends activemagiceffect  

; -----

Int Property ORD_LevelMod = 0 Auto
Float Property ORD_UpdateRate Auto
GlobalVariable Property ORD_Two_Wolfkin_Global_Count Auto
ActorBase Property ORD_Two_Wolfkin_Actor Auto
Float Property ORD_DamagePerStack Auto
Actor Property PlayerRef Auto

; -----

Actor TheWolf

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float WolfDamage = (ORD_Two_Wolfkin_Global_Count.GetValue() * ORD_DamagePerStack)
	ORD_Two_Wolfkin_Global_Count.SetValue(0)

	Float CasterAngle = akCaster.GetAngleZ()
	TheWolf = akTarget.PlaceActorAtMe(ORD_Two_Wolfkin_Actor, ORD_LevelMod)
	TheWolf.SetPlayerTeammate(true, false)
	TheWolf.SetAV("UnarmedDamage", WolfDamage)

	Actor AttackTarget = akTarget.GetCombatTarget()
	If AttackTarget
		TheWolf.StartCombat(akTarget)
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

	If !TheWolf || TheWolf.IsDead()
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
