Scriptname ORD_WorldSerpent_HitBuff_Script extends activemagiceffect  

; -----

Sound Property ORD_Alc_WorldSerpent_Marker Auto
Float Property ORD_Delay Auto
Actor Property PlayerRef Auto
Spell Property ORD_Alc_WorldSerpent_Spell_Retaliate Auto

; -----

Actor TheAttacker

; -----

Auto State Listening

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akSource as Weapon && akAggressor as Actor && akAggressor != PlayerRef
		GoToState("NotListening")
		TheAttacker == akAggressor as Actor
		RegisterForSingleUpdate(ORD_Delay)
	EndIf

EndEvent

EndState

; -----

State NotListening

EndState

; -----

Event OnUpdate()

	ORD_Alc_WorldSerpent_Marker.Play(TheAttacker)
	PlayerRef.DoCombatSpellApply(ORD_Alc_WorldSerpent_Spell_Retaliate, TheAttacker)
	Dispel()

EndEvent

; -----