Scriptname ORD_AndTheUniverseListens_Script extends activemagiceffect  

; -----

Keyword Property MagicShout Auto
Actor Property PlayerRef Auto
Float Property ORD_XPMult Auto

Perk Property ORD_Spe50_ForceRedoubled_Perk_50 Auto
Perk Property ORD_Spe50_ForceRedoubled_Perk_80 Auto
Int Property ORD_Redoubled1 Auto
Int Property ORD_Redoubled2 Auto
Float Property ORD_Recovery Auto

Spell Property ORD_Spe_Windborne_Spell_ProcSelf auto
Perk Property ORD_Spe40_Windborne_Perk_40 Auto

Float Property ORD_CDMultRestore Auto

MagicEffect Property ORD_Spe_RollingThunder_Effect_Dovahzulaan Auto
Sound Property ORD_Spe_Dovahzulaan_Marker_Echo Auto

GlobalVariable Property ORD_Spe_BusinessRelation_Global_Status Auto

Race Property WerewolfBeastRace Auto
Spell Property VoiceBecomeEthereal1 Auto
Spell Property VoiceBecomeEthereal2 Auto
Spell Property VoiceBecomeEthereal3 Auto

Spell Property VoiceSlowTime1 Auto
Spell Property VoiceSlowTime2 Auto
Spell Property VoiceSlowTime3 Auto

; -----

Spell LastCastShout

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell.HasKeyword(MagicShout) || akSpell == VoiceBecomeEthereal1 || akSpell == VoiceBecomeEthereal2 || akSpell == VoiceBecomeEthereal3 || akSpell == VoiceSlowTime1 || akSpell == VoiceSlowTime2 || akSpell == VoiceSlowTime3) && PlayerRef.GetRace() != WerewolfBeastRace
		Float ShoutCooldown = PlayerRef.GetVoiceRecoveryTime()

		; windborne
		If PlayerRef.HasPerk(ORD_Spe40_Windborne_Perk_40) && akSpell != VoiceBecomeEthereal1 && akSpell != VoiceBecomeEthereal2 && akSpell != VoiceBecomeEthereal3
			ORD_Spe_Windborne_Spell_ProcSelf.Cast(PlayerRef)
		EndIf

		; force redoubled
		If PlayerRef.HasPerk(ORD_Spe50_ForceRedoubled_Perk_80)
			If Utility.RandomFloat(0.0,100.0) < ORD_Redoubled2
				PlayerRef.SetVoiceRecoveryTime(ORD_Recovery)
			EndIf
		ElseIf PlayerRef.HasPerk(ORD_Spe50_ForceRedoubled_Perk_50)
			If Utility.RandomFloat(0.0,100.0) < ORD_Redoubled1
				PlayerRef.SetVoiceRecoveryTime(ORD_Recovery)
			EndIf
		EndIf

		; dovahzulaan
		If PlayerRef.HasMagicEffect(ORD_Spe_RollingThunder_Effect_Dovahzulaan)
			LastCastShout.Cast(PlayerRef)
			ORD_Spe_Dovahzulaan_Marker_Echo.Play(PlayerRef)
			PlayerRef.RampRumble(0.25, 0.75, 1500)
			Game.AdvanceSkill("Speechcraft", ORD_XPMult * ShoutCooldown)
		EndIf

		; default
		Float StatRestore = ShoutCooldown * ORD_CDMultRestore
		PlayerRef.RestoreActorValue("Health", StatRestore)
		PlayerRef.RestoreActorValue("Magicka", StatRestore)
		PlayerRef.RestoreActorValue("Stamina", StatRestore)

		; set last cast shout
		LastCastShout = akSpell as Spell

		; xp
		Game.AdvanceSkill("Speechcraft", ORD_XPMult * ShoutCooldown)

	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	; this is invoked when making the skill legendary
	ORD_Spe_BusinessRelation_Global_Status.SetValue(0.0)

EndEvent

; -----