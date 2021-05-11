Scriptname ORD_BloodEagle2_Script extends activemagiceffect  

; -----

Spell Property ORD_Two_BloodEagle_Spell_Proc Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	PlayerRef.DoCombatSpellApply(ORD_Two_BloodEagle_Spell_Proc,PlayerRef)

EndEvent

; -----