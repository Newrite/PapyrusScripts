Scriptname ORD_DaedricBarter_Script extends activemagiceffect  

; -----

Sound Property ORD_Con_DaedricBarter_Marker Auto
Ingredient Property HumanHeart Auto
Message[] Property ORD_Con_DaedricBarter_Message Auto
Message Property ORD_Con_DaedricBarter_MessageDefault Auto
Float Property ORD_HealthPer Auto
Float Property ORD_MSPer Auto
Float Property ORD_ScaleMax Auto
Float Property ORD_Cap Auto
Float Property ORD_Cap2 Auto

Spell Property ORD_Con_DaedricBarter_Spell_AtronachFlame_Fireball Auto
Spell Property ORD_Con_DaedricBarter_Spell_AtronachFrost_BrittleFlesh_Ab Auto
Spell Property ORD_Con_DaedricBarter_Spell_AtronachShock_LightningStorm Auto

Perk Property ORD_Con90_ElementalMight_Perk_90 Auto
Actor Property PlayerRef Auto

Race Property AtronachFlameRace Auto
Race Property AtronachFrostRace Auto
Race Property AtronachStormRace Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.AddInventoryEventFilter(HumanHeart)

EndEvent

; -----

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	If akBaseItem == HumanHeart

		Actor TargetActor = GetTargetActor()

		TargetActor.RemoveItem(HumanHeart, aiItemCount)
		ORD_Con_DaedricBarter_Marker.Play(TargetActor)

		TargetActor.RestoreAV("Health", 9999)
		Float HealthAdded = ORD_HealthPer * aiItemCount
		Float MSAdded = ORD_MSPer * aiItemCount
		TargetActor.ModActorValue("Health",HealthAdded)
		TargetActor.ModActorValue("Magicka",MSAdded)
		TargetActor.ModActorValue("Stamina",MSAdded)

		Float TargetScaleNew = TargetActor.GetScale() + (0.1 * aiItemCount)
		If TargetScaleNew < ORD_ScaleMax
			TargetActor.SetScale(TargetScaleNew)
		Else
			TargetActor.SetScale(ORD_ScaleMax)
		EndIf

		Float StatDelta
		StatDelta = TargetActor.GetActorValue("Health") - TargetActor.GetBaseActorValue("Health")
		If StatDelta > ORD_Cap
			TargetActor.ModAV("Health", ORD_Cap - StatDelta)
		EndIf
		StatDelta = TargetActor.GetActorValue("Magicka") - TargetActor.GetBaseActorValue("Magicka")
		If StatDelta > ORD_Cap2
			TargetActor.ModAV("Magicka", ORD_Cap2 - StatDelta)
		EndIf
		StatDelta = TargetActor.GetActorValue("Stamina") - TargetActor.GetBaseActorValue("Stamina")
		If StatDelta > ORD_Cap2
			TargetActor.ModAV("Stamina", ORD_Cap2 - StatDelta)
		EndIf

		ORD_Con_DaedricBarter_Message[Utility.RandomInt(0,(ORD_Con_DaedricBarter_Message.Length - 1))].Show()

		If PlayerRef.HasPerk(ORD_Con90_ElementalMight_Perk_90)
			Race TargetRace = TargetActor.GetRace()
			If TargetRace == AtronachFlameRace
				TargetActor.AddSpell(ORD_Con_DaedricBarter_Spell_AtronachFlame_Fireball)
			ElseIf TargetRace == AtronachFrostRace
				TargetActor.AddSpell(ORD_Con_DaedricBarter_Spell_AtronachFrost_BrittleFlesh_Ab)
			ElseIf TargetRace == AtronachStormRace
				TargetActor.AddSpell(ORD_Con_DaedricBarter_Spell_AtronachShock_LightningStorm)
			EndIf
		EndIf
		ORD_Con_DaedricBarter_MessageDefault.Show(TargetActor.GetActorValue("Health"),TargetActor.GetActorValue("Magicka"),TargetActor.GetActorValue("Stamina"))

	EndIf

EndEvent

; -----