Scriptname ORD_Judgment_Script extends activemagiceffect  

; -----

Float Property ORD_StaminaHealAmount Auto
Perk Property ORD_OneNPC_NPCSwordPerks_Perk_70_WasBladesman_OrdASISExclude Auto
Perk Property ORD_One80_Judgment_Perk_80 Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget.IsDead()
		Actor akKiller = akTarget.GetKiller()
		If (akKiller.HasPerk(ORD_One80_Judgment_Perk_80) || akKiller.HasPerk(ORD_OneNPC_NPCSwordPerks_Perk_70_WasBladesman_OrdASISExclude))
			akKiller.RestoreActorValue("Stamina", ORD_StaminaHealAmount)
		EndIf
		Dispel()
	EndIf

EndEvent

; -----

Event OnDying(Actor akKiller)

	If (akKiller.HasPerk(ORD_One80_Judgment_Perk_80) || akKiller.HasPerk(ORD_OneNPC_NPCSwordPerks_Perk_70_WasBladesman_OrdASISExclude))
		akKiller.RestoreActorValue("Stamina", ORD_StaminaHealAmount)
	EndIf
	Dispel()

EndEvent

; -----