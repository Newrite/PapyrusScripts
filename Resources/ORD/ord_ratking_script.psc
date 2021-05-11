Scriptname ORD_RatKing_Script extends activemagiceffect  

; -----

ActorBase Property ORD_Con_RatKing_Actor Auto
EffectShader Property ORD_Con_RatKing_FXS Auto
EffectShader Property ORD_Con_RatKing_FXS_Disintegrate Auto

Quest Property DGIntimidateQuest Auto
Quest Property C00JorrvaskrFight Auto
Location Property WhiterunJorrvaskrLocation Auto

Message Property ORD_Con_RatKing_Message_Brawl Auto
MagicEffect Property ORD_Con_RatKing_Effect_ToggleAb Auto

; -----

Actor Rat1
Actor Rat2
Actor Rat3
Actor Rat4
Actor Rat5
Actor Rat6
Bool DidKing

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If !akTarget.HasMagicEffect(ORD_Con_RatKing_Effect_ToggleAb)

		If (DGIntimidateQuest.IsRunning() && DGIntimidateQuest.GetCurrentStageID() < 100) || (akTarget.GetCurrentLocation() == WhiterunJorrvaskrLocation && C00JorrvaskrFight.IsRunning() && C00JorrvaskrFight.GetCurrentStageID() < 100)
			; brawl
			ORD_Con_RatKing_Message_Brawl.Show()
			DidKing = false
		Else
			; start king
			DidKing = true

			Rat1 = akTarget.PlaceActorAtMe(ORD_Con_RatKing_Actor)
			Rat1.IgnoreFriendlyHits(true)

			Rat2 = akTarget.PlaceActorAtMe(ORD_Con_RatKing_Actor)
			Rat2.IgnoreFriendlyHits(true)

			Rat3 = akTarget.PlaceActorAtMe(ORD_Con_RatKing_Actor)
			Rat3.IgnoreFriendlyHits(true)

			Rat4 = akTarget.PlaceActorAtMe(ORD_Con_RatKing_Actor)
			Rat4.IgnoreFriendlyHits(true)

			Rat5 = akTarget.PlaceActorAtMe(ORD_Con_RatKing_Actor)
			Rat5.IgnoreFriendlyHits(true)

			Rat6 = akTarget.PlaceActorAtMe(ORD_Con_RatKing_Actor)
			Rat6.IgnoreFriendlyHits(true)

			Utility.Wait(0.5)
			ORD_Con_RatKing_FXS.Play(Rat1)
			ORD_Con_RatKing_FXS.Play(Rat2)
			ORD_Con_RatKing_FXS.Play(Rat3)
			ORD_Con_RatKing_FXS.Play(Rat4)
			ORD_Con_RatKing_FXS.Play(Rat5)
			ORD_Con_RatKing_FXS.Play(Rat6)
		EndIf
	Else
		DidKing = false
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If DidKing

		Rat1.Kill(akTarget)
		Rat2.Kill(akTarget)
		Rat3.Kill(akTarget)
		Rat4.Kill(akTarget)
		Rat5.Kill(akTarget)
		Rat6.Kill(akTarget)

		Rat1.SetCriticalStage(Rat1.CritStage_DisintegrateStart)
		Rat2.SetCriticalStage(Rat2.CritStage_DisintegrateStart)
		Rat3.SetCriticalStage(Rat3.CritStage_DisintegrateStart)
		Rat4.SetCriticalStage(Rat4.CritStage_DisintegrateStart)
		Rat5.SetCriticalStage(Rat5.CritStage_DisintegrateStart)
		Rat6.SetCriticalStage(Rat6.CritStage_DisintegrateStart)

		ORD_Con_RatKing_FXS_Disintegrate.Play(Rat1,3.0)
		ORD_Con_RatKing_FXS_Disintegrate.Play(Rat2,3.0)
		ORD_Con_RatKing_FXS_Disintegrate.Play(Rat3,3.0)
		ORD_Con_RatKing_FXS_Disintegrate.Play(Rat4,3.0)
		ORD_Con_RatKing_FXS_Disintegrate.Play(Rat5,3.0)
		ORD_Con_RatKing_FXS_Disintegrate.Play(Rat6,3.0)

		Utility.Wait(2.75)

		Rat1.SetAlpha(0.0, true)
		Rat2.SetAlpha(0.0, true)
		Rat3.SetAlpha(0.0, true)
		Rat4.SetAlpha(0.0, true)
		Rat5.SetAlpha(0.0, true)
		Rat6.SetAlpha(0.0, true)

		Rat1.SetCriticalStage(Rat1.CritStage_DisintegrateEnd)
		Rat2.SetCriticalStage(Rat2.CritStage_DisintegrateEnd)
		Rat3.SetCriticalStage(Rat3.CritStage_DisintegrateEnd)
		Rat4.SetCriticalStage(Rat4.CritStage_DisintegrateEnd)
		Rat5.SetCriticalStage(Rat5.CritStage_DisintegrateEnd)
		Rat6.SetCriticalStage(Rat6.CritStage_DisintegrateEnd)

		Rat1.Delete()
		Rat2.Delete()
		Rat3.Delete()
		Rat4.Delete()
		Rat5.Delete()
		Rat6.Delete()

	EndIf

EndEvent

; -----