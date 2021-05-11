Scriptname ORD_CastOnNearestEnemy_Script extends ObjectReference  

; -----

Float Property ORD_RangeFeet Auto
Spell Property ORD_Proc Auto
Actor Property PlayerRef Auto

; -----

Event OnLoad()

	Actor RandomActor = Game.FindClosestActorFromRef(Self, ORD_RangeFeet * 128 / 6)
	If RandomActor
		PlayerRef.DoCombatSpellApply(ORD_Proc, RandomActor)
	EndIf
	Utility.Wait(5)
	Delete()

EndEvent

; -----