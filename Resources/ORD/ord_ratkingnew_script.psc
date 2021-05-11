Scriptname ORD_RatKingNew_Script extends activemagiceffect  

; -----

ActorBase Property ORD_Con_RatKing_Actor Auto
EffectShader Property ORD_Con_RatKing_FXS Auto
EffectShader Property ORD_Con_RatKing_FXS_Disintegrate Auto

Weapon Property Unarmed Auto
Message Property ORD_Con_RatKing_Message_Brawl Auto

MagicEffect Property ORD_Con_RatKing_Effect_ToggleAb Auto

; -----

Actor Rat1
Actor Rat2
Actor Rat3
Bool DidKing = false

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If !akTarget.HasMagicEffect(ORD_Con_RatKing_Effect_ToggleAb)

		If akTarget.GetEquippedWeapon(0) == Unarmed
			; brawl
			ORD_Con_RatKing_Message_Brawl.Show()
		Else
			; start king
			DidKing = true

			Rat1 = akTarget.PlaceActorAtMe(ORD_Con_RatKing_Actor)
			Rat1.IgnoreFriendlyHits(true)

			Rat2 = akTarget.PlaceActorAtMe(ORD_Con_RatKing_Actor)
			Rat2.IgnoreFriendlyHits(true)

			Rat3 = akTarget.PlaceActorAtMe(ORD_Con_RatKing_Actor)
			Rat3.IgnoreFriendlyHits(true)

			Utility.Wait(0.5)
			ORD_Con_RatKing_FXS.Play(Rat1)
			ORD_Con_RatKing_FXS.Play(Rat2)
			ORD_Con_RatKing_FXS.Play(Rat3)
		EndIf

	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If DidKing

		Rat1.Kill()
		Rat2.Kill()
		Rat3.Kill()

		Rat1.SetCriticalStage(Rat1.CritStage_DisintegrateStart)
		Rat2.SetCriticalStage(Rat2.CritStage_DisintegrateStart)
		Rat3.SetCriticalStage(Rat2.CritStage_DisintegrateStart)

		ORD_Con_RatKing_FXS_Disintegrate.Play(Rat1,3.0)
		ORD_Con_RatKing_FXS_Disintegrate.Play(Rat2,3.0)
		ORD_Con_RatKing_FXS_Disintegrate.Play(Rat3,3.0)

		Utility.Wait(2.75)

		Rat1.SetAlpha(0.0, true)
		Rat2.SetAlpha(0.0, true)
		Rat3.SetAlpha(0.0, true)

		Rat1.SetCriticalStage(Rat1.CritStage_DisintegrateEnd)
		Rat2.SetCriticalStage(Rat2.CritStage_DisintegrateEnd)
		Rat3.SetCriticalStage(Rat3.CritStage_DisintegrateEnd)

		Rat1.Delete()
		Rat2.Delete()
		Rat3.Delete()

	EndIf

EndEvent

; -----