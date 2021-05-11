Scriptname ORD_FireRitual_Proc_Script extends activemagiceffect  

; -----

Float Property ORD_SkillBase Auto
Float Property ORD_SkillLevel Auto
Float Property ORD_HealthAdd Auto
Float Property ORD_OneHandedAdd Auto
Float Property ORD_TwoHandedAdd Auto
Float Property ORD_DestructionAdd Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	; increase stats
	akTarget.ModAV("OneHanded", ORD_OneHandedAdd)
	akTarget.ModAV("TwoHanded", ORD_TwoHandedAdd)
	akTarget.ModAV("Destruction", ORD_DestructionAdd)
	akTarget.ModAV("Health", ORD_HealthAdd)

	; grant XP
	Game.AdvanceSkill("Conjuration", ORD_SkillBase + (GetTargetActor().GetBaseAV("Conjuration") * ORD_SkillLevel))

EndEvent

; -----

