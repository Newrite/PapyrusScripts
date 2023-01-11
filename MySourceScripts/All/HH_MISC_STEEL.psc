Scriptname HH_MISC_STEEL extends ObjectReference  
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
int Countmisc= Game.GetPlayer().GetItemCount(Misc1)
if akNewContainer == Game.GetPlayer()
Game.GetPlayer().AddItem(Weapon1, 1, true)
Game.GetPlayer().removeItem(Misc1, 1, true)
endIf
if akNewContainer != Game.GetPlayer()
Utility.WaitGameTime(2)
akNewContainer.removeItem(Misc1, 9999, true)
endif
endEvent
MiscObject Property Misc1  Auto 
Armor Property Weapon1  Auto 