;/ Decompiled by Champollion V1.0.1
Source   : TVR_PercentageDamage_Script.psc
Modified : 2020-06-27 02:11:13
Compiled : 2020-06-27 02:11:14
User     : maxim
Computer : CANOPUS
/;
scriptName TVR_PercentageDamage_Script extends activemagiceffect

;-- Properties --------------------------------------
String property TVR_Value auto
imagespacemodifier property TVR_Imod auto
Float property TVR_ImodDiv auto
Float property TVR_Fraction auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnEffectStart(Actor akTarget, Actor akCaster)

	Float CurrentActorValue = akCaster.GetActorValue(TVR_Value)
	akCaster.DamageActorValue(TVR_Value, CurrentActorValue * TVR_Fraction)
	if TVR_Imod
		Float ImodStrength = CurrentActorValue / TVR_ImodDiv
		if ImodStrength > 1.50000
			TVR_Imod.Apply(1.50000)
		else
			TVR_Imod.Apply(ImodStrength)
		endIf
	endIf
endFunction
