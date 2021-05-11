Scriptname ORD_MysteryKiller_Script extends activemagiceffect  

; -----

Spell Property ORD_Sne_MysteryKiller_Spell_Proc Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(0.1)
	If akTarget.IsDead()
		ORD_Sne_MysteryKiller_Spell_Proc.Cast(akCaster)
	EndIf

EndEvent

; -----