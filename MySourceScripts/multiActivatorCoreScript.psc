Scriptname multiActivatorCoreScript extends ObjectReference  

multiQuestShotScript Property multi Auto

GlobalVariable Property MultiSet  Auto

EVENT onActivate(objectReference akActivator)

	while 1

		if multi.multiShotTrigger == 3 || MultiSet.getValue() == 0

			delete()
			return
		endif

	endWhile

endEvent