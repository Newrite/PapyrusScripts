Scriptname J3XCrossbowAutoSchematicsScript extends ObjectReference  

GlobalVariable property variableToChange auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == game.getPlayer() && variableToChange.getValueInt() == 0
		debug.messagebox("You have learned how to craft a new item!")
		variableToChange.setValueInt(1)
	endif
endEvent
