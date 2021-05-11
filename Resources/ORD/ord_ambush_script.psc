Scriptname ORD_Ambush_Script extends activemagiceffect  

; -----

Spell Property ORD_Sne_Ambush_Spell_Proc Auto
Float Property ORD_Delay Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(ORD_Delay)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.DispelSpell(ORD_Sne_Ambush_Spell_Proc)

EndEvent

; -----

Event OnUpdate()

	ORD_Sne_Ambush_Spell_Proc.Cast(PlayerRef)

EndEvent

; -----