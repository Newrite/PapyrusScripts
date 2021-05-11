Scriptname ORD_CommandClear_Script extends activemagiceffect  

; -----

Spell Property ORD_Con_BoneCollector_Spell_Command_BarrowLord_FollowPlayerNoCombat_MassTrigger Auto
Spell Property ORD_Con_BoneCollector_Spell_Command_BarrowLord_HoldPositionNoCombat_MassTrigger Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.DispelSpell(ORD_Con_BoneCollector_Spell_Command_BarrowLord_FollowPlayerNoCombat_MassTrigger)
	akTarget.DispelSpell(ORD_Con_BoneCollector_Spell_Command_BarrowLord_HoldPositionNoCombat_MassTrigger)

EndEvent

; -----