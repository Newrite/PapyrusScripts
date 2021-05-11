Scriptname ORD_GrimSpirit_Script extends ActiveMagicEffect  


; ------

Light Property ORD_TheSpirit Auto

Activator Property FXEmptyActivator Auto
Float Property ORD_StartHeight Auto
Float Property ORD_AttackRate Auto

Spell Property ORD_Proc Auto

Float Property ORD_Speed Auto

Float Property ORD_SeekRange Auto

; ------

ObjectReference TheOrb
Actor TheTarget
Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster

	TheOrb = TheCaster.PlaceAtMe(ORD_TheSpirit, abInitiallyDisabled = true)
	TheOrb.SetAngle(0,0,0)
	TheOrb.MoveTo(TheCaster,0,0,ORD_StartHeight)
	TheOrb.Enable()
	Utility.Wait(0.1)

	RegisterForSingleUpdate(ORD_AttackRate)
	TheOrb.TranslateToRef(akTarget,ORD_Speed)

EndEvent

; ------

Event OnUpdate()

	If TheOrb.GetDistance(TheTarget) <= ORD_SeekRange
		ORD_Proc.RemoteCast(TheOrb,TheCaster,TheTarget)
		Dispel()
	Else
		TheOrb.TranslateToRef(TheTarget,ORD_Speed)
		RegisterForSingleUpdate(ORD_AttackRate)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheOrb.StopTranslation()
	TheOrb.Delete()

EndEvent

; -----