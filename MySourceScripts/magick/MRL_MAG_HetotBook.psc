ScriptName MRL_MAG_HetotBook extends activemagiceffect

Form Property HetotBook Auto

bool Removed = false
Actor Target

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Target = akTarget
	Target.RemoveItem(HetotBook, Target.GetItemCount(HetotBook))
	Utility.WaitMenuMode(0.20)
	Target.AddItem(HetotBook)
	Target.EquipItem(HetotBook, false, true)
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	if akBaseItem == HetotBook && !Removed
		Target.RemoveItem(HetotBook, Target.GetItemCount(HetotBook))
		akItemReference.Delete()
		akItemReference.Disable()
		self.Dispel()
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Removed = true
	Target.RemoveItem(HetotBook, Target.GetItemCount(HetotBook))
EndEvent