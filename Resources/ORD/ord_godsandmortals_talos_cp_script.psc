Scriptname ORD_GodsAndMortals_Talos_CP_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Float Property ORD_Chance Auto
Message Property ORD_Res_GodsAndMortals_Message_Talos Auto

; -----

Event OnDying(Actor akKiller)

	If Utility.RandomFloat(0.0,1.0) < ORD_Chance
		PlayerRef.SetVoiceRecoveryTime(0.0)
		ORD_Res_GodsAndMortals_Message_Talos.Show()
	EndIf

EndEvent

; -----