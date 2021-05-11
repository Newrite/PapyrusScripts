Scriptname ORD_FeedTheMonster_Script extends activemagiceffect  

; -----

Ingredient Property HumanFlesh Auto
Sound Property ORD_Con_FeedTheMonster_Marker Auto
Spell Property ORD_Con_FeedTheMonster_Spell_Proc Auto

Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.AddInventoryEventFilter(HumanFlesh)

EndEvent

; -----

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	If akBaseItem == HumanFlesh
		Actor TargetActor = GetTargetActor()

		TargetActor.RemoveItem(HumanFlesh, aiItemCount)
		ORD_Con_FeedTheMonster_Marker.Play(TargetActor)

		TargetActor.RestoreAV("Health",9999)
		Int i = 0
		While i < aiItemCount
			TargetActor.DoCombatSpellApply(ORD_Con_FeedTheMonster_Spell_Proc, TargetActor)
			i += 1
		EndWhile
	EndIf

EndEvent

; -----