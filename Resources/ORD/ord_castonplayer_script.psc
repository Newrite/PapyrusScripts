Scriptname ORD_CastOnPlayer_Script extends activemagiceffect  

; -----

Float Property ORD_Wait Auto
Spell Property ORD_Spell Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ORD_Wait
		Utility.Wait(ORD_Wait)
	EndIf
	PlayerRef.DoCombatSpellApply(ORD_Spell, PlayerRef)

EndEvent

; -----