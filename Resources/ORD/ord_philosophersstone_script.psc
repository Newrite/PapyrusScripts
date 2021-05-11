Scriptname ORD_PhilosophersStone_Script extends activemagiceffect  

; -----

Float Property ORD_UpdateRate Auto
Float Property ORD_Mult Auto
Bool Property ORD_Silent Auto
MiscObject Property Gold001 Auto
Actor Property PlayerRef Auto
Float Property ORD_AdvanceSkillMult Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdateGameTime(ORD_UpdateRate)

EndEvent

; -----

Event OnUpdateGameTime()

	RegisterForSingleUpdateGameTime(ORD_UpdateRate)
	Actor TargetActor = GetTargetActor()
	Int GoldAdded = ((TargetActor.GetAV("Alteration") * ORD_Mult) as Int)
	TargetActor.AddItem(Gold001, GoldAdded, ORD_Silent)
	If TargetActor == PlayerRef
		Game.AdvanceSkill("Alteration", GoldAdded * ORD_AdvanceSkillMult)
	EndIf

EndEvent

; -----