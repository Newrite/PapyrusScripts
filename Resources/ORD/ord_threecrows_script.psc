Scriptname ORD_ThreeCrows_Script extends activemagiceffect  

; -----

Int Property ORD_NumberOfCrows Auto
Actor Property PlayerRef Auto
Keyword Property WeapTypeBow Auto
Float Property ORD_WornOff Auto
Float Property ORD_HealthDamageFraction Auto
Sound Property ORD_Arc_ThreeCrows_Marker_ThirdCrow Auto
Float Property ORD_Distance = 541.6665 Auto
Float Property ORD_Cap Auto
Message Property ORD_Arc_ThreeCrows_Message Auto

; -----

Int NumberOfCrows = 1

; -----

Auto State WantingToListen


EndState

; -----

State IsListening

	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

		If akSource.HasKeyword(WeapTypeBow) && akAggressor == PlayerRef && GetTargetActor().GetDistance(PlayerRef) > ORD_Distance
			GoToState("IsNotListening")
		EndIf

	EndEvent

EndState

; -----

State IsNotListening

	Event OnBeginState()

		NumberOfCrows += 1
		If NumberOfCrows == ORD_NumberOfCrows
			Actor TargetActor = GetTargetActor()
			PlayerRef.PushActorAway(GetTargetActor(), 8)
			ORD_Arc_ThreeCrows_Marker_ThirdCrow.Play(TargetActor)
			Float DamageDealt = TargetActor.GetActorValue("Health") * ORD_HealthDamageFraction
			If DamageDealt > ORD_Cap
				TargetActor.DamageActorValue("Health", ORD_Cap)
			Else
				TargetActor.DamageActorValue("Health", DamageDealt)
			EndIf
			Dispel()
			ORD_Arc_ThreeCrows_Message.Show()
		Else
			RegisterForSingleUpdate(ORD_WornOff)
			GoToState("IsListening")
		EndIf

	EndEvent

EndState

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_WornOff)
	Utility.Wait(0.8)
	GoToState("IsListening")

EndEvent

; -----

Event OnUpdate()

	; did not fire fast enough
	Dispel()

EndEvent

; -----