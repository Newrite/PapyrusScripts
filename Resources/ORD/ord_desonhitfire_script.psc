Scriptname ORD_DesOnHitFire_Script extends activemagiceffect  

; -----

Spell Property ORD_Des_ScarringBurns_Spell_Proc Auto

Perk Property ORD_Des70_ScorchedEarth_Perk_70 Auto

Float Property ORD_Delay = 1.25 Auto Hidden
Float Property ORD_DelayEnd = 1.65 Auto Hidden
Float Property ORD_ShaderDuration = 4.00 Auto Hidden
Activator Property ORD_Des_ScorchedEarth_Activator Auto
EffectShader Property ORD_Des_ScorchedEarth_FXS_Disintegrate Auto
FormList Property DisintegrationMainImmunityList Auto
Spell Property ORD_Des_ScorchedEarth_Spell_Hazard Auto
ImpactDataSet Property MAGFirebolt01ImpactSet Auto
Keyword Property MagicNoDistintegrate Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget.IsDead()
		; scorched earth
		If akCaster.HasPerk(ORD_Des70_ScorchedEarth_Perk_70) && !DisintegrationMainImmunityList.HasForm(akTarget.GetRace()) && !akTarget.HasKeyword(MagicNoDistintegrate)
			akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateStart)
			ORD_Des_ScorchedEarth_FXS_Disintegrate.Play(akTarget,ORD_ShaderDuration)

			Utility.Wait(ORD_Delay)
			ORD_Des_ScorchedEarth_Spell_Hazard.Cast(akCaster,akTarget)
			ObjectReference TheAshPile = akTarget.AttachAshPile(ORD_Des_ScorchedEarth_Activator)
			TheAshPile.SetAngle(0,0,0)
			akTarget.PlaceAtMe(MAGFirebolt01ImpactSet)

			Utility.Wait(ORD_DelayEnd)
			ORD_Des_ScorchedEarth_FXS_Disintegrate.Stop(akTarget)
			akTarget.SetAlpha (0.0,true)
			akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateEnd)
		EndIf
	Else
		; scarring burns
		ORD_Des_ScarringBurns_Spell_Proc.Cast(akCaster, akTarget)
	EndIf

EndEvent

; -----