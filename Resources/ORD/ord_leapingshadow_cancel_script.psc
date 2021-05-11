Scriptname ORD_LeapingShadow_Cancel_Script extends activemagiceffect  

; -----

Spell Property ORD_Sne_LeapingShadow_ProcSelf Auto
Actor Property PlayerRef Auto

; -----

Int PCStat
Int PCStatNew

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	PCStat = Game.QueryStat("People Killed") + Game.QueryStat("Animals Killed")
;	PCStat = Game.QueryStat("Sneak Attacks")

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If (Game.QueryStat("People Killed") + Game.QueryStat("Animals Killed")) > PCStat
;	If Game.QueryStat("Sneak Attacks") > PCStat
		PlayerRef.DispelSpell(ORD_Sne_LeapingShadow_ProcSelf)
	EndIf

EndEvent

; -----