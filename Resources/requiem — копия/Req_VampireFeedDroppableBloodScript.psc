Scriptname Req_VampireFeedDroppableBloodScript extends REQ_PlayerAlias  
{automatically bottle blood from fallen creatures, or consume it, if no bottle is at hand}

Potion Property DroppedBlood  Auto  
SPELL Property DroppedBloodSpell  Auto  
MiscObject Property BloodConserver  Auto  
Potion Property bloodPotion  Auto  

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	Int bottles = 0
	If ( akBaseItem == DroppedBlood )
		bottles = Player.GetItemCount(BloodConserver)
		Player.RemoveItem(DroppedBlood, aiItemCount)
		If ( bottles >= aiItemCount )
			Player.RemoveItem(BloodConserver, aiItemCount)
			Player.AddItem(BloodPotion, aiItemCount)
		Else
			If ( bottles > 0 )
				Player.RemoveItem(BloodConserver, aiItemCount - bottles)
				Player.AddItem(BloodPotion, aiItemCount - bottles)
			EndIf
			DroppedBloodSpell.Cast(Player, Player)
		EndIf
	EndIf
EndEvent
