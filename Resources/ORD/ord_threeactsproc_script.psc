Scriptname ORD_ThreeActsProc_Script extends activemagiceffect  

; -----

Float Property ORD_Wait Auto
Float Property ORD_WaitLong Auto
Spell Property ORD_Sne_DeathInThreeActs_Spell_Ending Auto
Actor Property PlayerRef Auto
Spell Property ORD_Sne_DeathInThreeActs_Spell_Proc Auto
Sound Property ORD_Sne_DeathInThreeActs_Marker Auto

; -----

Int PCStat
Int PCStatNew

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	PCStat = Game.QueryStat("People Killed") + Game.QueryStat("Animals Killed")
	RegisterForSingleUpdate(ORD_Wait)
	ORD_Sne_DeathInThreeActs_Marker.Play(akCaster)

EndEvent

; -----

Event OnUpdate()

	PCStatNew = Game.QueryStat("People Killed") + Game.QueryStat("Animals Killed")
	If PCStatNew <= PCStat
		; no kill
		ORD_Sne_DeathInThreeActs_Spell_Ending.Cast(PlayerRef)
		PlayerRef.DispelSpell(ORD_Sne_DeathInThreeActs_Spell_Proc)
		Debug.Notification("no kill")
	Else
		; kill
		PCStat = PCStatNew
		RegisterForSingleUpdate(ORD_WaitLong)
		Debug.Notification("kill")
	EndIf

EndEvent

; -----