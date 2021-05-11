Scriptname ORD_KingOfBones_Script extends activemagiceffect  

; -----

ImagespaceModifier Property ORD_Con_KingOfBones_Imod_Static Auto
ImagespaceModifier Property ORD_Con_KingOfBones_Imod_Outro Auto
Float Property ORD_ImodStrength Auto
Bool Property ORD_DisableCaster = false Auto
Float Property ORD_UpdateRate Auto
GlobalVariable Property ORD_Con_KingOfBones_Global_IsControlling Auto
Faction Property MagicCharmFaction Auto
Float Property ORD_TetherRadius Auto
Spell Property ORD_Con_KingOfBones_Spell_Ethereal Auto
MagicEffect Property ORD_Con_KingOfBones_Effect_Ethereal Auto
Float Property ORD_SkillBase auto
Float Property ORD_SkillLevel Auto
Message Property ORD_Con_KingOfBones_Message_Help_HowToDeactivate Auto
Message Property ORD_Con_KingOfBones_Message_Break_Distance Auto
Message Property ORD_Con_KingOfBones_Message_Break_Sheathed Auto
Message Property ORD_Con_KingOfBones_Message_Break_Bleedout Auto

; -----

Actor TheTarget
Actor TheCaster
Float TetherRadius

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ORD_Con_KingOfBones_Global_IsControlling.SetValue(1.0)
	ORD_Con_KingOfBones_Imod_Static.Apply(ORD_ImodStrength)

	If ORD_DisableCaster
		Game.DisablePlayerControls(abCamSwitch=true)
	EndIf
	ORD_Con_KingOfBones_Spell_Ethereal.Cast(akCaster)

	akTarget.SetPlayerControls(true)
	Game.SetPlayerAIDriven(true)
	Game.SetCameraTarget(akTarget)
	Game.ForceFirstPerson()
	Game.ForceThirdPerson()
	akTarget.AddToFaction(MagicCharmFaction)
	akTarget.EnableAI(true)
;	akTarget.StopCombat()
	TheTarget = akTarget
	TheCaster = akCaster

	akCaster.DrawWeapon()
	TetherRadius = ORD_TetherRadius * 21.3333
	RegisterForSingleUpdate(ORD_UpdateRate)
	Game.AdvanceSkill("Conjuration", ORD_SkillBase + (akTarget.GetBaseAV("Conjuration") * ORD_SkillLevel))
	ORD_Con_KingOfBones_Message_Help_HowToDeactivate.ShowAsHelpMessage("KingOfBones_HowToDeactivate", 5, 10, 1)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If ORD_DisableCaster
		Game.EnablePlayerControls()
	EndIf

	Game.SetCameraTarget(Game.GetPlayer())
	Game.SetPlayerAIDriven(false)
	akTarget.SetPlayerControls(false)
	akTarget.EnableAI(true)
	akTarget.RemoveFromFaction(MagicCharmFaction)

	akCaster.DispelSpell(ORD_Con_KingOfBones_Spell_Ethereal)

	ORD_Con_KingOfBones_Imod_Outro.Apply(ORD_ImodStrength)
	ORD_Con_KingOfBones_Imod_Static.Remove()
	ORD_Con_KingOfBones_Global_IsControlling.SetValue(0.0)

EndEvent

; -----

Event OnDying(Actor akKiller)

	Dispel()

EndEvent

; -----

Event OnUpdate()

	If !TheCaster.IsWeaponDrawn() || !TheCaster.HasMagicEffect(ORD_Con_KingOfBones_Effect_Ethereal)
		ORD_Con_KingOfBones_Message_Break_Sheathed.Show()
		Dispel()
	ElseIf TheTarget.GetDistance(TheCaster) > TetherRadius
		ORD_Con_KingOfBones_Message_Break_Distance.Show()
		Dispel()
	ElseIf TheTarget.IsBleedingOut()
		ORD_Con_KingOfBones_Message_Break_Bleedout.Show()
		Dispel()
	Else
		RegisterForSingleUpdate(ORD_UpdateRate)
	EndIf

EndEvent

; -----