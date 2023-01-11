Scriptname WB_ThrummingStone_Spawner_Script extends ObjectReference  

; ------

Activator Property WB_AlterationEarth_Activator_ThrummingStone Auto
Actor Property PlayerRef Auto
Int Property WB_Pulses Auto
Float Property WB_Speed Auto
Float Property WB_Z Auto
GlobalVariable Property WB_Alteration_ThrummingStone_Global_Delay Auto
Spell Property WB_S_A100_ThrummingStone_Spell_PC Auto

wb_thrummingstone_quest_script property thrummingstone_quest auto

; ------

ObjectReference TheStone
Int Pulses = 0

int stone_index
; -----

Event OnLoad()
	TheStone = Self.PlaceAtMe(WB_AlterationEarth_Activator_ThrummingStone, 1, false, true)
	TheStone.MoveTo(Self, 0, 0, WB_Z)
	TheStone.Enable()
	TheStone.TranslateToRef(Self, WB_Speed)
	
	stone_index = thrummingstone_quest.AddStone(self)
	RegisterForSingleUpdate(WB_Alteration_ThrummingStone_Global_Delay.GetValue())
EndEvent

Event OnUpdate()
	WB_S_A100_ThrummingStone_Spell_PC.RemoteCast(Self, PlayerRef)
	Pulses += 1
	If Pulses >= WB_Pulses
		StopEffect()
	Else
		RegisterForSingleUpdate(WB_Alteration_ThrummingStone_Global_Delay.GetValue())
	EndIf
EndEvent

Function StopEffect()
	GoToState("StopState")
	TheStone.Disable(true)
	TheStone.Delete()
	Delete()
endFunction

state StopState
	Event OnUpdate()
	EndEvent
endState