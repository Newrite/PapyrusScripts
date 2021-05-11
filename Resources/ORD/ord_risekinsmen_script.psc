Scriptname ORD_RiseKinsmen_Script extends activemagiceffect  

; -----

Actor Property PlayerRef Auto
Spell Property ORD_Two_RiseKinsmen_Spell_Proc Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	PlayerRef.DoCombatSpellApply(ORD_Two_RiseKinsmen_Spell_Proc,PlayerRef)

EndEvent

; -----