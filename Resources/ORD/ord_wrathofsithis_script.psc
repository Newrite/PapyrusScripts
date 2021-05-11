Scriptname ORD_WrathOfSithis_Script extends activemagiceffect  

; -----

Sound Property ORD_Sne_WrathOfSithis_Marker Auto
MiscObject Property Gold001 Auto
GlobalVariable Property ORD_Sne_WrathOfSithis_Global_Gold Auto
Int Property ORD_XP Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Sne_WrathOfSithis_Marker.Play(akTarget)
;	akTarget.RemoveItem(Gold001, ORD_Sne_WrathOfSithis_Global_Gold.GetValue() as Int)
	If akCaster == PlayerRef
		Game.AdvanceSkill("Sneak", ORD_XP)
	EndIf

EndEvent

; -----