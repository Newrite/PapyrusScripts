Scriptname HH_Out_of_list_clean extends Quest  

FormList Property HH_Form_quests Auto

HH_Out_of_list_ Property TooManySleepers Auto

bool done

Spell Property HH_Misc_Ale_CD Auto

Spell Property HH_Misc_Ale Auto

Event OnInit()
	if TooManySleepers.Newgame || done
		TooManySleepers.Newgame = false
	else
		RegisterForSingleUpdate(7)
	endIf
	done = true
EndEvent

Event OnUpdate()
	ClearList()
EndEvent

Function ClearList()
	Debug.Notification("Очищается список спящих целей. Пожалуйста подождите.")
	Quest Qst
	ReferenceAlias Ali
	ReferenceAlias Bedroll
	Int len = HH_Form_quests.GetSize()
	Int i = len
	While i > 0
		i -= 1
		Qst = HH_Form_quests.GetAt(i) as Quest
		Ali = Qst.GetAlias(1) as ReferenceAlias
		if Ali.GetActorReference()
			Ali.GetActorReference().DispelSpell(HH_Misc_Ale_CD)
			Ali.GetActorReference().DispelSpell(HH_Misc_Ale)
			Ali.GetActorReference().disable()
			Ali.GetActorReference().enable()
		endIf
	EndWhile
	Utility.Wait(0.1)
	i = len
	While i > 0
		i -= 1
		Qst = HH_Form_quests.GetAt(i) as Quest
		Ali = Qst.GetAlias(1) as ReferenceAlias
		if Ali.GetActorReference()
			Ali.GetActorReference().EvaluatePackage()
		endIf
	EndWhile
	Utility.Wait(5.0)
	i = len
	While i > 0
		i -= 1
		Qst = HH_Form_quests.GetAt(i) as Quest
		if Qst.IsRunning()
			Bedroll = Qst.GetAlias(0) as ReferenceAlias
			Bedroll.GetReference().Delete()
			Qst.Stop()
		endIf
	EndWhile
	Debug.Notification("Список очищен спасибо за ожидание")
EndFunction