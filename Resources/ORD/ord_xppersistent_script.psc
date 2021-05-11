Scriptname ORD_XPPersistent_Script extends activemagiceffect  

; -----

String Property ORD_Skill Auto
Actor Property PlayerRef Auto
Float Property ORD_UpdateRate Auto
GlobalVariable Property ORD_Any_ArmorXP_Global Auto
GlobalVariable Property ORD_Any_ArmorXPLevel_Global Auto
Int Property ORD_XPCountMax Auto

; -----

Int XPCount

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	XPCount = 0
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	If XPCount <= ORD_XPCountMax
		XPCount += 1
		Game.AdvanceSkill(ORD_Skill, (ORD_Any_ArmorXP_Global.GetValue() + PlayerRef.GetLevel() * ORD_Any_ArmorXPLevel_Global.GetValue()))
		RegisterForSingleUpdate(ORD_UpdateRate)
	EndIf

EndEvent

; -----