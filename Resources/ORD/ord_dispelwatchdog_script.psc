Scriptname ORD_DispelWatchdog_Script extends activemagiceffect  

; -----

Float Property ORD_Delay Auto
Spell Property ORD_Spell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_Delay)

EndEvent

; -----

Event OnUpdate()

	If ORD_Spell != NONE
		GetTargetActor().DispelSpell(ORD_Spell)
	Else
		Dispel()
	EndIf

EndEvent

; -----
