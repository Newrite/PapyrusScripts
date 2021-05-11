Scriptname ORD_UntoTheMassesGR_Script extends activemagiceffect  


; -----

GlobalVariable Property ORD_Ill_BlindGuardian_Global_NextActivate Auto
GlobalVariable Property ORD_Ill_FearTheReaper_Global_NextActivate Auto
GlobalVariable Property ORD_Ill_HeavyWeighsTheTapestry_Global_NextActivate Auto
GlobalVariable Property ORD_Ill_LambToTheSlaughter_Global_NextActivate Auto
GlobalVariable Property ORD_Ill_Nemesis_Global_NextActivate Auto
Spell Property ORD_Ill_UntoTheMasses_Spell_ProcBlocker Auto
MagicEffect Property ORD_Ill_UntoTheMasses_Effect_ProcBlocker Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If !akTarget.HasMagicEffect(ORD_Ill_UntoTheMasses_Effect_ProcBlocker)
		ORD_Ill_BlindGuardian_Global_NextActivate.SetValue(-1)
		ORD_Ill_FearTheReaper_Global_NextActivate.SetValue(-1)
		ORD_Ill_HeavyWeighsTheTapestry_Global_NextActivate.SetValue(-1)
		ORD_Ill_LambToTheSlaughter_Global_NextActivate.SetValue(-1)
		ORD_Ill_Nemesis_Global_NextActivate.SetValue(-1)
		ORD_Ill_UntoTheMasses_Spell_ProcBlocker.Cast(akTarget)
	EndIf

EndEvent

; -----