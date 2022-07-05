Scriptname HH_effect_trigger_cubes extends activemagiceffect  

Spell Property HH_SP_Cube_fire  Auto
Spell Property HH_SP_Cube_shock  Auto
Spell Property HH_SP_Cube_paralyze  Auto
MiscObject Property HH_CUBE_ACTIVE_Fire Auto
MiscObject Property HH_CUBE_ACTIVE_Shock Auto
MiscObject Property HH_CUBE_ACTIVE_Paralyse Auto
explosion property HH_EXPL_CUBE_FIRE auto
explosion property HH_EXPL_CUBE_Shock auto
Actor Property PlayerRef  Auto



Event OnEffectStart(Actor akTarget, Actor akCaster) 
if akTarget.GetItemCount(HH_CUBE_ACTIVE_Fire) >0
	int FireCount = akTarget.GetItemCount(HH_CUBE_ACTIVE_Fire)
	akTarget.PlaceAtMe(HH_EXPL_CUBE_FIRE as form, 1, false, false)
	akTarget.RemoveItem(HH_CUBE_ACTIVE_Fire,FireCount)
	HH_SP_Cube_fire.cast(PlayerRef, akTarget)
endif
if akTarget.GetItemCount(HH_CUBE_ACTIVE_Shock) >0
	int ShockCount = akTarget.GetItemCount(HH_CUBE_ACTIVE_Shock)
	akTarget.PlaceAtMe(HH_EXPL_CUBE_Shock as form, 1, false, false)
	akTarget.RemoveItem(HH_CUBE_ACTIVE_Shock, ShockCount)
	HH_SP_Cube_shock.cast(PlayerRef, akTarget)
endif
if akTarget.GetItemCount(HH_CUBE_ACTIVE_Paralyse) >0
	int ParalyseCount = akTarget.GetItemCount(HH_CUBE_ACTIVE_Paralyse)
	akTarget.RemoveItem(HH_CUBE_ACTIVE_Paralyse, ParalyseCount)
	HH_SP_Cube_paralyze.cast(PlayerRef, akTarget)
endif
endEvent