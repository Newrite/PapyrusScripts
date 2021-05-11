Scriptname ORD_APlagueUponThee_Script extends activemagiceffect  

; -----

Perk Property ORD_Con70_APlagueUponThee_Perk_70 Auto
Spell Property ORD_Con_APlagueUponThee_Spell_ProcRevenge Auto
Sound Property ORD_Con_APlagueUponThee_Marker Auto

; -----

Event OnDying(Actor akKiller)

	If akKiller && !akKiller.HasPerk(ORD_Con70_APlagueUponThee_Perk_70)
		GetTargetActor().DoCombatSpellApply(ORD_Con_APlagueUponThee_Spell_ProcRevenge, akKiller)
		ORD_Con_APlagueUponThee_Marker.Play(akKiller)
		Dispel()
	EndIf

EndEvent

; -----