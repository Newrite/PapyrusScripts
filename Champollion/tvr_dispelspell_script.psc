;/ Decompiled by Champollion V1.0.1
Source   : TVR_DispelSpell_Script.psc
Modified : 2020-08-15 01:54:06
Compiled : 2020-08-15 01:54:07
User     : maxim
Computer : CANOPUS
/;
scriptName TVR_DispelSpell_Script extends activemagiceffect

;-- Properties --------------------------------------
spell property TVR_Spell auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.DispelSpell(TVR_Spell)
endFunction
