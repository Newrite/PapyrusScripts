Scriptname ORD_PerkReset_Quest extends Quest  

; -----

Actor Property PlayerRef Auto
Spell Property ORD_PerkReset_Spell Auto

; -----

Event OnInit()

	Utility.Wait(1.0)
	If PlayerRef.GetLevel() > 1
		ORD_PerkReset_Spell.Cast(PlayerRef)
	EndIf
	Stop()

EndEvent

; -----