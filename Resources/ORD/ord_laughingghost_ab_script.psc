Scriptname ORD_LaughingGhost_Ab_Script extends activemagiceffect  

; -----

Spell Property ORD_Sne_LaughingGhost_Spell_Proc Auto
Float Property ORD_UpdateRate Auto
Actor Property PlayerRef Auto

; -----

Int KillCount
Int KillCountNew

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	KillCount = Game.QueryStat("People Killed")
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.DispelSpell(ORD_Sne_LaughingGhost_Spell_Proc)

EndEvent

; -----

Event OnUpdate()

	KillCountNew = Game.QueryStat("People Killed")
	While KillCount < KillCountNew
		ORD_Sne_LaughingGhost_Spell_Proc.Cast(PlayerRef)
		KillCount += 1
	EndWhile
	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----