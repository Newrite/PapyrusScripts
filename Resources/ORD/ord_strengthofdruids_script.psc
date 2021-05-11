Scriptname ORD_StrengthOfDruids_Script extends activemagiceffect  

; -----

Float Property ORD_UpdateRate Auto
Spell Property ORD_Res_StrengthOfDruids_Spell_Ab Auto
Actor Property PlayerRef Auto
String Property ORD_Tap Auto
String PRoperty ORD_Replenish Auto
Float Property ORD_AfterDamage Auto
Float Property ORD_TurnOnFraction Auto
Float Property ORD_TurnOffFraction Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.25)
	OnUpdate()

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(0.25)
	PlayerRef.RemoveSpell(ORD_Res_StrengthOfDruids_Spell_Ab)

EndEvent

; -----

Event OnUpdate()

	If PlayerRef.GetActorValuePercentage(ORD_Replenish) < 1.0 && PlayerRef.GetActorValuePercentage(ORD_Tap) > ORD_TurnOnFraction
		; add spell
		If !PlayerRef.HasSpell(ORD_Res_StrengthOfDruids_Spell_Ab)
			PlayerRef.AddSpell(ORD_Res_StrengthOfDruids_Spell_Ab, false)
		EndIf
	EndIf

	If PlayerRef.GetActorValuePercentage(ORD_Replenish) >= 1.0 || PlayerRef.GetActorValuePercentage(ORD_Tap) <= ORD_TurnOffFraction
		; remove spell
		If PlayerRef.HasSpell(ORD_Res_StrengthOfDruids_Spell_Ab)
			PlayerRef.RemoveSpell(ORD_Res_StrengthOfDruids_Spell_Ab)
		EndIf
	EndIf

	RegisterForSingleUpdate(ORD_UpdateRate)

EndEvent

; -----