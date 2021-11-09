Scriptname DualWieldParrySKSEPlayerRefScript extends ReferenceAlias  

DualWieldParryingSKSEQuestScript Property questScript auto

Event OnPlayerLoadGame()
	questScript.deactivateMod()
	questScript.activateMod()
EndEvent