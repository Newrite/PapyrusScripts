Scriptname ORD_DwarvenAutocannon_Script extends activemagiceffect  

; -----

Activator Property FXEmptyActivator Auto
Activator Property ORD_Smh_DwarvenAutocannon_Activator Auto
Float Property ORD_ShootZ Auto
Float Property ORD_DistanceInFront Auto
Float Property ORD_UpdateRate Auto
Float Property ORD_DistanceZ Auto
Spell Property ORD_Smh_DwarvenAutocannon_Spell_Proc Auto
Sound Property ORD_Smh_DwarvenAutocannon_Marker_Deploy Auto
Sound Property ORD_Smh_DwarvenAutocannon_Marker_Destroyed Auto

; remote control
Perk Property ORD_Smh30_RemoteControl_Perk_30 Auto
Activator Property ORD_Smh_DwarvenAutocannon_Activator_RemoteControl Auto
Float Property ORD_RemoteControlDist Auto

; electrobolt
Int Property ORD_Electrobolt Auto
Spell Property ORD_Smh_DwarvenAutocannon_Spell_Proc_Electrobolt Auto
Explosion Property ORD_Smh_DwarvenAutocannon_Explosion_Electrobolt Auto
Perk Property ORD_Smh50_Electrobolt_Perk_50 Auto

; spin up
Perk Property ORD_Smh80_SpinUp_Perk_80 Auto
Float Property ORD_SpeedUpDelta Auto

; firing line
Perk Property ORD_Smh70_FiringLine_Perk_70 Auto
Float Property ORD_AngleDelta Auto
Float Property ORD_Min Auto

; ingredient
MiscObject Property ORD_Smh_DwarvenAutocannon_Misc Auto

; -----

Float ShootRate
Bool SpinUp
Int ShotCount
ObjectReference ShootStart
ObjectReference ShootAim
ObjectReference TheCannon
Actor TargetActor
Bool IsRemoteControl

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	Float CharacterAngle
	ShootRate = ORD_UpdateRate

	; electrobolt
	If akTarget.HasPerk(ORD_Smh50_Electrobolt_Perk_50)
		ShotCount = 0
	Else
		ShotCount = -9999
	EndIf

	; spawn object
	ORD_Smh_DwarvenAutocannon_Marker_Deploy.Play(akTarget)

	If akTarget.HasPerk(ORD_Smh30_RemoteControl_Perk_30)
		IsRemoteControl = true
		If akTarget.HasPerk(ORD_Smh70_FiringLine_Perk_70)
			CharacterAngle = akTarget.GetAngleZ() + ORD_AngleDelta
		Else
			CharacterAngle = akTarget.GetAngleZ()
		EndIf
		TheCannon = akTarget.PlaceAtMe(ORD_Smh_DwarvenAutocannon_Activator_RemoteControl)
		TheCannon.MoveTo(akTarget,ORD_DistanceInFront*Math.Sin(CharacterAngle),ORD_DistanceInFront*Math.Cos(CharacterAngle),ORD_DistanceZ)
		TheCannon.SetAngle(0,0,CharacterAngle)
	Else
		IsRemoteControl = false
		If akTarget.HasPerk(ORD_Smh70_FiringLine_Perk_70)
			CharacterAngle = akTarget.GetAngleZ() + ORD_AngleDelta
		Else
			CharacterAngle = akTarget.GetAngleZ()
		EndIf
		TheCannon = akTarget.PlaceAtMe(ORD_Smh_DwarvenAutocannon_Activator)
		TheCannon.MoveTo(akTarget,ORD_DistanceInFront*Math.Sin(CharacterAngle),ORD_DistanceInFront*Math.Cos(CharacterAngle),ORD_DistanceZ)
		TheCannon.SetAngle(0,0,CharacterAngle)
	EndIf

	ShootStart = TheCannon.PlaceAtMe(FXEmptyActivator)
	ShootStart.MoveTo(TheCannon, 0, 0, ORD_ShootZ)

	ShootAim = TheCannon.PlaceAtMe(FXEmptyActivator)
	ShootAim.MoveTo(TheCannon, 0, 0, ORD_ShootZ)

	akTarget.RemoveItem(ORD_Smh_DwarvenAutocannon_Misc, 1, true)

	; spin up
	If akTarget.HasPerk(ORD_Smh80_SpinUp_Perk_80)
		SpinUp = true
	Else
		SpinUp = false
	EndIf

	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Smh_DwarvenAutocannon_Marker_Destroyed.Play(TheCannon)
	UnregisterForUpdate()
	TheCannon.Disable(true)
	TheCannon.Delete()
	ShootStart.Delete()
	akTarget.AddItem(ORD_Smh_DwarvenAutocannon_Misc, 1, true)

EndEvent

; -----

Event OnUpdate()

	RegisterForSingleUpdate(ShootRate)
	If IsRemoteControl || TheCannon.GetDistance(TargetActor) <= ORD_RemoteControlDist
		ShotCount += 1
		ShootAim.MoveTo(ShootStart,ORD_DistanceInFront*Math.Sin(TargetActor.GetAngleZ()),ORD_DistanceInFront*Math.Cos(TargetActor.GetAngleZ()),(ORD_DistanceInFront*Math.Tan(-TargetActor.GetAngleX()) + 0))
		If ShotCount >= ORD_Electrobolt
			ShotCount = 0
			ShootStart.PlaceAtMe(ORD_Smh_DwarvenAutocannon_Explosion_Electrobolt)
			ORD_Smh_DwarvenAutocannon_Spell_Proc_Electrobolt.RemoteCast(ShootStart, TargetActor, ShootAim)
		Else
			ORD_Smh_DwarvenAutocannon_Spell_Proc.RemoteCast(ShootStart, TargetActor, ShootAim)
		EndIf
	EndIf
	If SpinUp == true && ShootRate > ORD_Min
		ShootRate -= ORD_SpeedUpDelta
	EndIf

EndEvent

; -----