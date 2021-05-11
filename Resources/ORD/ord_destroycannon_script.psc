Scriptname ORD_DestroyCannon_Script extends ObjectReference  

; -----

Spell Property ORD_Smh_DwarvenAutocannon_Spell Auto

; -----

Event OnActivate(ObjectReference akActivator)

	If akActivator == Game.GetPlayer()
		Game.GetPlayer().DispelSpell(ORD_Smh_DwarvenAutocannon_Spell)	; this doesn't need to run fast)
	EndIf

EndEvent

; -----