Scriptname ORD_TenthEye_Script extends ActiveMagicEffect  

; -----

Int Property ORD_LevelMod = 0 Auto
Float Property ORD_DistanceInFront Auto
Faction Property MagicCharmFaction Auto
Float Property ORD_UpdateRate Auto
ActorBase Property ORD_Ghost Auto
Float Property ORD_DistanceLimit Auto
Spell Property MGRitual02Spell Auto

; -----

Actor TheGhost = NONE
Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Game.SetHUDCartMode(true)
	Float CasterAngle = akCaster.GetAngleZ()
	TheGhost = akCaster.PlaceActorAtMe(ORD_Ghost, ORD_LevelMod)

	Float EndLocX = (ORD_DistanceInFront*Math.Sin(CasterAngle))
	Float EndLocY = (ORD_DistanceInFront*Math.Cos(CasterAngle))
	TheGhost.MoveTo(akCaster,EndLocX,EndLocY,0)
	TheGhost.SetAngle(akCaster.GetAngleX(), akCaster.GetAngleY(), CasterAngle)

	TheGhost.SetPlayerControls(true)
	Game.SetPlayerAIDriven(true)
	Game.SetCameraTarget(TheGhost)
	Game.ForceFirstPerson()
	Game.ForceThirdPerson()

	TheGhost.AddToFaction(MagicCharmFaction)
	TheGhost.SetPlayerTeammate(true, false)

	TheGhost.ForceAV("Health", 1)

	TheGhost.EnableAI(true)
	TheGhost.StopCombat()

;	If !TheGhost.IsSneaking()
;		TheGhost.StartSneaking()
;	EndIf

	TheCaster = akCaster
	RegisterForUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If TheGhost
		TheGhost.Delete()
		Game.SetCameraTarget(Game.GetPlayer())
		Game.SetPlayerAIDriven(false)
	EndIf
	Game.SetHUDCartMode(false)

EndEvent

; -----

Event OnUpdate()

	If !TheGhost || TheGhost.IsDead() || TheGhost.GetDistance(TheCaster) > ORD_DistanceLimit
		TheCaster.DispelSpell(MGRitual02Spell)
	EndIf

EndEvent

; -----