Scriptname ORD_BoneCollector_Script extends activemagiceffect  

; -----

ActorBase Property ORD_Con_BoneCollector_Actor Auto
Float Property ORD_CastLength Auto
Message Property ORD_Con_BoneCollector_Message_TimeOut Auto
FormList Property ORD_Con_BoneCollector_FormList Auto
Keyword Property ORD_Con_BoneCollector_Keyword_SkeletonSpawn Auto
FormList Property ORD_Con_BoneCollector_FormList_Altars Auto
Message Property ORD_Con_BoneCollector_Message_Awaken Auto
Explosion Property ORD_Con_BoneCollector_Explosion Auto
Float Property ORD_UpdateRate Auto
Float Property ORD_SkillBase Auto
Float Property ORD_SkillLevel Auto
GlobalVariable Property ORD_Con_BoneCollector_Global_Count Auto
EffectShader Property ReanimateFXShader Auto
LeveledItem Property ORD_Con_BoneCollector_Litem_Destroy Auto
Message Property ORD_Con_BoneCollector_Message_Refund Auto
Message Property ORD_Con_BoneCollector_Message_Help_CanActivate Auto

; -----

Actor TheSkeleton = NONE
ObjectReference TheAltar = NONE

; -----

Auto State IsSummoning

	Event OnEffectStart(Actor akTarget, Actor akCaster)

		; disable controls
		Game.DisablePlayerControls(true, true, false, false, true, true, true, true, 0)

		; create visual effect
		akTarget.PlaceAtMe(ORD_Con_BoneCollector_Explosion)
		TheAltar = Game.FindClosestReferenceOfAnyTypeInListFromRef(ORD_Con_BoneCollector_FormList_Altars, akTarget, 384)
		If TheAltar != NONE
			ReanimateFXShader.Play(TheAltar,4.0)
		EndIf

		; wait during ritual
		RegisterForSingleUpdate(ORD_CastLength)

	EndEvent

	Event OnUpdate()

		; create a skeleton
		If TheAltar != NONE && TheAltar.GetLinkedRef(ORD_Con_BoneCollector_Keyword_SkeletonSpawn) != NONE
			TheSkeleton = TheAltar.GetLinkedRef(ORD_Con_BoneCollector_Keyword_SkeletonSpawn).PlaceActorAtMe(ORD_Con_BoneCollector_Actor, 1, none)
		Else
			TheSkeleton = GetTargetActor().PlaceActorAtMe(ORD_Con_BoneCollector_Actor, 1, none)
		EndIf
		TheSkeleton.SetPlayerTeammate(true, false)
		TheSkeleton.IgnoreFriendlyHits(true)

		; remove ingredients
		GetTargetActor().RemoveItem(ORD_Con_BoneCollector_FormList, 1, true, none)
		ORD_Con_BoneCollector_Message_Awaken.Show()

		; reenable controls
		GoToState("HasBeenSummoned")
		Game.EnablePlayerControls()

		; help
		ORD_Con_BoneCollector_Message_Help_CanActivate.ShowAsHelpMessage("BoneCollector_CanActivate", 5, 10, 1)
		Utility.Wait(0.1)

		; grant XP
		Game.AdvanceSkill("Conjuration", ORD_SkillBase + (GetTargetActor().GetBaseActorValue("Conjuration") * ORD_SkillLevel))

	EndEvent

EndState

; -----

State HasBeenSummoned

	Event OnBeginState()

		; increment skeleton count
		ORD_Con_BoneCollector_Global_Count.Mod(1)

		; start ping
		RegisterForSingleUpdate(ORD_UpdateRate)

	EndEvent

	Event OnUpdate()

		If TheSkeleton.IsDead()
			Dispel()
		Else
			RegisterForSingleUpdate(ORD_UpdateRate)
		EndIf

	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)

		; kill skeleton
		TheSkeleton.Kill(akTarget)
		ORD_Con_BoneCollector_Message_TimeOut.Show()
		TheSkeleton.BlockActivation()
		akTarget.AddItem(ORD_Con_BoneCollector_Litem_Destroy,1,true)
		ORD_Con_BoneCollector_Message_Refund.Show()

		; disable skeleton
		Utility.Wait(4.0)
		TheSkeleton.Disable()
		TheSkeleton.Delete()
		TheSkeleton = NONE

		; decrement skeleton count
		ORD_Con_BoneCollector_Global_Count.Mod(-1)

	EndEvent

EndState

; -----