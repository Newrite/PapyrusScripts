Scriptname ORD_DaedricPlaything_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Message[] Property ORD_Message Auto
Float Property ORD_MinDelay Auto
Float Property ORD_MaxDelay Auto
Sound Property ORD_Con_DaedricPlaything_Marker_BadLuck Auto
ImagespaceModifier Property ORD_Con_DaedricPlaything_Imod_BadLuck Auto
Spell[] Property ORD_Spell Auto

; -----

Int TempID = 4

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(Utility.RandomFloat(ORD_MinDelay, ORD_MaxDelay))

EndEvent

; -----

Event OnUpdate()

	ORD_Con_DaedricPlaything_Marker_BadLuck.Play(PlayerRef)
	PlayerRef.RampRumble(0.5, 4, 2500)
	ORD_Con_DaedricPlaything_Imod_BadLuck.Apply()

	Int BadLuckID = Utility.RandomInt(0, ORD_Spell.Length - 1)

	BadLuckID = TempID
	TempID += 1

	ORD_Message[BadLuckID].Show()
	ORD_Spell[BadLuckID].Cast(PlayerRef)

	RegisterForSingleUpdate(Utility.RandomFloat(ORD_MinDelay, ORD_MaxDelay))

EndEvent

; -----