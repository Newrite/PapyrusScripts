Scriptname ORD_Tripwire_Script extends ObjectReference  

; -----

Spell Property ORD_Sne_Tripwire_Spell_Proc Auto
Actor Property PlayerRef Auto
Spell Property ORD_Sne_Tripwire_Spell Auto

; -----

Event OnActivate(ObjectReference akActivator)

	ORD_Sne_Tripwire_Spell_Proc.RemoteCast(Self, PlayerRef)
	PlayerRef.DispelSpell(ORD_Sne_Tripwire_Spell)

EndEvent

; -----