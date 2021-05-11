Scriptname ORD_DungeonMaster_Script extends activemagiceffect  

; -----

Message Property ORD_Alt_NewVancianMagic_Message_DungeonMaster_Study Auto
Message Property ORD_Alt_NewVancianMagic_Message_DungeonMaster_SideEffects Auto
GlobalVariable Property ORD_Alt_NewVancianMagic_Global_DungeonMaster_Study Auto
GlobalVariable Property ORD_Alt_NewVancianMagic_Global_DungeonMaster_SideEffects Auto

; -----

;Event OnEffectStart(Actor akTarget, Actor akCaster)

;	ORD_Alt_NewVancianMagic_Global_DungeonMaster_Study.SetValue(ORD_Alt_NewVancianMagic_Message_DungeonMaster_Study.Show() - 1)
;	ORD_Alt_NewVancianMagic_Global_DungeonMaster_SideEffects.SetValue(ORD_Alt_NewVancianMagic_Message_DungeonMaster_SideEffects.Show())

;EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	ORD_Alt_NewVancianMagic_Global_DungeonMaster_Study.SetValue(0)
	ORD_Alt_NewVancianMagic_Global_DungeonMaster_SideEffects.SetValue(0)

EndEvent

; -----