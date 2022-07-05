Scriptname HH_ME_Dispell_Invis_Ether extends activemagiceffect  


Spell Property HH_1_Empty_to_disspel Auto

Actor Property PlayerRef  Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	PlayerRef.DoCombatSpellApply(HH_1_Empty_to_disspel, PlayerRef)
EndEvent


