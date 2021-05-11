Scriptname ORD_ThiefsKiss_Script extends activemagiceffect  

; -----

LeveledItem Property ORD_Litem Auto
Int Property ORD_ItemCount Auto
Float Property ORD_ItemCountSkillMult Auto
String Property ORD_Skill Auto

; -----

Bool HasAddedItem = false

; -----

Event OnActivate(ObjectReference akActivator)

	If akActivator == GetCasterActor() && !HasAddedItem
		HasAddedItem = true
		GetTargetActor().AddItem(ORD_Litem, Math.Floor(ORD_ItemCount + (ORD_ItemCountSkillMult * GetCasterActor().GetAV(ORD_Skill))))
		Dispel()
	EndIf

EndEvent

; -----

Event OnDying(Actor akKiller)

	If !HasAddedItem
		HasAddedItem = true
		GetTargetActor().AddItem(ORD_Litem, Math.Floor(ORD_ItemCount + (ORD_ItemCountSkillMult * GetCasterActor().GetAV(ORD_Skill))))
		Dispel()
	EndIf

EndEvent

; -----