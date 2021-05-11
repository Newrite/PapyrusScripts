Scriptname ORD_FireRitual_Script extends activemagiceffect  

; -----

Float Property ORD_CastLength Auto
FormList Property ORD_Con_BoneCollector_FormList Auto
FormList Property ORD_Con_BoneCollector_FormList_Altars Auto
Explosion Property ORD_Con_BoneCollector_Explosion Auto
GlobalVariable Property ORD_Con_BoneCollector_Global_Count Auto
EffectShader Property ReanimateFXShader Auto
FormList Property ORD_Con_BoneCollector_FormList_FireRitual Auto
Message Property ORD_Con_BoneCollector_Message_Awaken Auto
Spell Property ORD_Con_BoneCollector_Spell_Proc_FireRitual_Proc Auto

; -----

Actor TheSkeleton = NONE
ObjectReference TheAltar = NONE
ObjectReference TheFire = NONE

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
			TheFire = TheAltar.PlaceAtMe(ORD_Con_BoneCollector_FormList_FireRitual.GetAt(0))
			TheFire.SetAngle(0,0,TheAltar.GetAngleZ())
		EndIf

		; wait during ritual
		RegisterForSingleUpdate(ORD_CastLength)

	EndEvent

	Event OnUpdate()

		; cast the spell
		ORD_Con_BoneCollector_Spell_Proc_FireRitual_Proc.Cast(Game.GetPlayer())

		; remove ingredients
		GetTargetActor().RemoveItem(ORD_Con_BoneCollector_FormList, 1, true, none)
		ORD_Con_BoneCollector_Message_Awaken.Show()

		; reenable controls
		Game.EnablePlayerControls()
		Dispel()

		; delete the fire
		TheFire.Disable(true)
		TheFire.DeleteWhenAble()

	EndEvent

EndState

; -----