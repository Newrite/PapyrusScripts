Scriptname ORD_WildSanctuaries_Object_Script extends ObjectReference  

; -----

Actor Property PlayerRef Auto
Spell Property ORD_SpellToAdd Auto
ImagespaceModifier Property ORD_Alt_Cast_Imod Auto
Sound Property ORD_Alt_WildSanctuaries_Marker_Activate Auto

; -----

Auto State IsListening

	Event OnActivate(ObjectReference akActivator)

		If akActivator == PlayerRef && !PlayerRef.IsInCombat()
		;	GoToState("IsNotListening")
			PlayerRef.AddSpell(ORD_SpellToAdd)
		EndIf

	EndEvent

EndState

; -----