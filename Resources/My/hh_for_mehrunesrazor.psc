Scriptname HH_For_MehrunesRazor extends activemagiceffect  

Spell property Pure_damage auto
Int Property Percent_chance  Auto  


Event OnEffectStart(Actor akTarget, Actor akCaster)

	If Utility.RandomInt(0,100) <= Percent_chance
		Pure_damage.Cast(akCaster, akTarget)
	endif
	
EndEvent