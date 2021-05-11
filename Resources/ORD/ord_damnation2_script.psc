Scriptname ORD_Damnation2_Script extends activemagiceffect  

; -----

Keyword Property MagicDamageFire Auto
Spell Property ORD_Con_Damnation_Spell_ProcBlast Auto

; -----

Event OnDying(Actor akKiller)

	If GetTargetActor().HasEffectKeyword(MagicDamageFire)
		ORD_Con_Damnation_Spell_ProcBlast.Cast(GetTargetActor())
	EndIf

EndEvent

; -----