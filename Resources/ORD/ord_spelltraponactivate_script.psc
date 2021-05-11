Scriptname ORD_SpellTrapOnActivate_Script extends ObjectReference  

; -----

Spell Property ORD_Spell Auto

; -----

Event OnActivate(ObjectReference akActivator)

	ORD_Spell.RemoteCast(Self, Game.GetPlayer())

EndEvent

; -----