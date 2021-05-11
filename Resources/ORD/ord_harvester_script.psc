Scriptname ORD_Harvester_Script extends activemagiceffect  

; -----

LeveledItem Property ORD_Con_BoneCollector_Litem Auto

; -----


Event OnDying(Actor akKiller)

	GetTargetActor().AddItem(ORD_Con_BoneCollector_Litem)
	Dispel()

EndEvent

; -----