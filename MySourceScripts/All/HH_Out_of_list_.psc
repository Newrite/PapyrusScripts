Scriptname HH_Out_of_list_ extends Quest  

bool Property Newgame auto hidden

Spell Property HH_Misc_Ale_CD Auto

Spell Property HH_Misc_Ale Auto

FormList Property HH_Form_quests Auto

GlobalVariable Property HH_Glob_I_count Auto 


Event OnInit()
	Newgame = true
endEvent

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
	Quest Qst
	ReferenceAlias Ali
	ReferenceAlias Bedroll
	Debug.Notification("Превышен лимит спящих целей. Пожалуйста подождите.")
	int count=HH_Glob_I_count.GetValue() as int
	Int len = HH_Form_quests.GetSize()
	Qst = HH_Form_quests.GetAt(count) as Quest
	Ali = Qst.GetAlias(count) as ReferenceAlias
		if Ali.GetActorReference()
			Ali.GetActorReference().DispelSpell(HH_Misc_Ale_CD)
			Ali.GetActorReference().DispelSpell(HH_Misc_Ale)
			Ali.GetActorReference().EvaluatePackage()
		endIf
		Utility.Wait(4.0)
		if Qst.IsRunning()
			Bedroll = Qst.GetAlias(count) as ReferenceAlias
			Bedroll.GetReference().Delete()
			Qst.Stop()
		endIf
	Debug.Notification("Предыдущая цель разбужена, спасибо за ожидание" )
	HH_Glob_I_count.SetValueInt(count+1)
	Stop()
EndEvent