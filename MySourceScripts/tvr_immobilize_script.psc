;/ Decompiled by Champollion V1.0.1
Source   : TVR_Immobilize_Script.psc
Modified : 2020-06-20 20:06:44
Compiled : 2020-06-20 20:06:45
User     : maxim
Computer : CANOPUS
/;
scriptName TVR_Immobilize_Script extends ActiveMagicEffect

;-- Properties --------------------------------------
keyword property BookShelfBook07 auto
sound property TVR_Violence_Descriptor_Chained auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnEffectFinish(Actor akTarget, Actor akCaster)

	if !akTarget.HasEffectKeyword(BookShelfBook07)
		akTarget.SetDontMove(false)
	endIf
endFunction

; Skipped compiler generated GetState

function OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.SetDontMove(true)
	if TVR_Violence_Descriptor_Chained
		TVR_Violence_Descriptor_Chained.Play(akTarget as objectreference)
	endIf
endFunction
