Scriptname WB_HiddenCobra_Script extends ActiveMagicEffect  

; -----

Sound Property WB_IllusionNightmare_Marker_Script_HiddenCobra Auto
Spell Property WB_S_I100_HiddenCobra_Spell Auto
Float Property WB_UpdateRate = 0.5 Auto
Int Property WB_TicksNotInCombat = 10 Auto
ImagespaceModifier Property WB_IllusionNightmare_Imod_HiddenCobra Auto

; -----

Actor TheCaster
Actor TheTarget
Int TicksNotInCombat

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TicksNotInCombat = 0
	TheCaster = akCaster
	TheTarget = akTarget
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	If TheTarget.GetCombatState() != 1
		TicksNotInCombat += 1
		If TicksNotInCombat >= WB_TicksNotInCombat
			WB_S_I100_HiddenCobra_Spell.Cast(TheCaster, TheTarget)
			WB_IllusionNightmare_Marker_Script_HiddenCobra.Play(TheTarget)
			WB_IllusionNightmare_Imod_HiddenCobra.Apply()
			Dispel()
		EndIf
	Else
		TicksNotInCombat = 0
	EndIf

EndEvent

; -----