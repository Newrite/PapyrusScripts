Scriptname ORD_RestorationInBattle_Script extends activemagiceffect  

; -----

Spell Property ORD_Res_DescendingLight_Spell_Proc Auto

Perk Property ORD_Res70_WarriorsFlame_Perk_70 Auto
Float Property ORD_WarriorsFlameMin Auto
Float Property ORD_WarriorsFlameMax Auto

Spell Property ORD_Res_WarriorsFlame_Spell_Proc Auto
Spell Property ORD_Res_WarriorsFlame_Spell_ProcNeg Auto
Float Property ORD_FlameRange Auto

Keyword Property MagicWard Auto

Spell Property ORD_Res_Supremacy_Spell_Proc Auto

Actor Property PlayerRef Auto

Keyword Property MagicInvisibility Auto
MagicEffect Property VoiceMakeEthereal auto

Quest Property DGIntimidateQuest Auto
Quest Property C00JorrvaskrFight Auto
Location Property WhiterunJorrvaskrLocation Auto

Sound Property ORD_Res_WarriorsFlame_Marker Auto
MagicEffect Property ORD_Res_WarriorsFlame_Effect_Apotheosis_FX Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If ((PlayerRef.HasMagicEffect(VoiceMakeEthereal) == false) && (PlayerRef.HasEffectKeyword(MagicInvisibility) == false))
	;	If (!DGIntimidateQuest.IsRunning() || DGIntimidateQuest.GetCurrentStageID() >= 100) && (!C00JorrvaskrFight.IsRunning() || PlayerRef.GetCurrentLocation() != WhiterunJorrvaskrLocation || C00JorrvaskrFight.GetCurrentStageID() >= 100)
			PlayerRef.DoCombatSpellApply(ORD_Res_DescendingLight_Spell_Proc, PlayerRef)
			PlayerRef.DoCombatSpellApply(ORD_Res_Supremacy_Spell_Proc, PlayerRef)
	;	EndIf
	EndIf
	If PlayerRef.HasPerk(ORD_Res70_WarriorsFlame_Perk_70)
		; warriors flame
		RegisterForSingleUpdate(Utility.RandomFloat(ORD_WarriorsFlameMin, ORD_WarriorsFlameMax))
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	PlayerRef.DispelSpell(ORD_Res_DescendingLight_Spell_Proc)
	PlayerRef.DispelSpell(ORD_Res_Supremacy_Spell_Proc)

EndEvent

; -----

Event OnUpdate()

	; warriors flame
	If !PlayerRef.HasMagicEffect(VoiceMakeEthereal) && !PlayerRef.HasEffectKeyword(MagicInvisibility) && !PlayerRef.HasMagicEffect(ORD_Res_WarriorsFlame_Effect_Apotheosis_FX)
		Actor FlameActor = Game.FindRandomActorFromRef(PlayerRef, ORD_FlameRange)
		While FlameActor.IsDead()
			FlameActor = Game.FindRandomActorFromRef(PlayerRef, ORD_FlameRange)
		EndWhile
		If FlameActor
			If FlameActor == PlayerRef || FlameActor.IsHostileToActor(PlayerRef) == false
				PlayerRef.DoCombatSpellApply(ORD_Res_WarriorsFlame_Spell_Proc,FlameActor)
			Else
				PlayerRef.DoCombatSpellApply(ORD_Res_WarriorsFlame_Spell_ProcNeg,FlameActor)
			EndIf
			ORD_Res_WarriorsFlame_Marker.Play(FlameActor)
		EndIf
	EndIf
	RegisterForSingleUpdate(Utility.RandomFloat(ORD_WarriorsFlameMin, ORD_WarriorsFlameMax))

EndEvent

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell as Spell) &&  akSpell.HasKeyword(MagicWard)
		; vigilant
		Utility.Wait(0.1)
		PlayerRef.DispelSpell(ORD_Res_Supremacy_Spell_Proc)
	EndIf

EndEvent

; -----
