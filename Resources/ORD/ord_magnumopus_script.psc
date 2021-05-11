Scriptname ORD_MagnumOpus_Script extends activemagiceffect  

; -----

Message Property ORD_Alc_MagnumOpus_Message_Go Auto
Keyword Property isAlchemy Auto
GlobalVariable Property ORD_Alc_MagnumOpus_Global_IsCompleted Auto
Actor Property PlayerRef Auto
Float Property ORD_SelfDamage Auto
ImagespaceModifier Property GetHit Auto
Sound Property ORD_Alc_MagnumOpus_Marker_SelfDamage Auto
Message Property ORD_Alc_MagnumOpus_Message_End Auto

; -----

Event OnSit(ObjectReference akFurniture)

	If akFurniture.HasKeyword(isAlchemy)
		ORD_Alc_MagnumOpus_Message_Go.Show()
	Else
		Debug.Notification("ORDINATOR ERROR: Magnum Opus buff is active but we are sitting on something else!")
	EndIf

endEvent

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Alc_MagnumOpus_Global_IsCompleted.SetValue(1)

EndEvent

; -----

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	PlayerRef.DamageAV("Health", ORD_SelfDamage)
	ORD_Alc_MagnumOpus_Marker_SelfDamage.Play(PlayerRef)
	GetHit.Apply()

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Alc_MagnumOpus_Message_End.Show()

EndEvent

; -----