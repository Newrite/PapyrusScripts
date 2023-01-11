;/ Decompiled by Champollion V1.0.1
Source   : WB_InvisibleManagerInCombat_Script.psc
Modified : 2019-05-26 19:40:05
Compiled : 2019-05-26 19:40:44
User     : PewPewPew
Computer : DESKTOP-Q3BIL1T
/;
scriptName wb_invisiblemanagerincombat_script extends activemagiceffect

;-- Properties --------------------------------------
formlist property WB_AlterationMetamagic_OcatosRecital_FormList auto
globalvariable property WB_Destruction_Crackle_Global auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function OnEffectStart(Actor akTarget, Actor akCaster)

	Float total_cost = 0.000000
	Float Magicka = akTarget.GetAV("Magicka")
	Int i = 0
	Bool bEnd = false
	while !bEnd && i < WB_AlterationMetamagic_OcatosRecital_FormList.GetSize()
		spell TheSpell = WB_AlterationMetamagic_OcatosRecital_FormList.GetAt(i) as spell
		total_cost += TheSpell.GetEffectiveMagickaCost(akTarget) as Float
		if Magicka >= total_cost
			TheSpell.Cast(akTarget as objectreference, none)
		else
			bEnd = true
		endIf
		i += 1
	endWhile
	akTarget.DamageAV("Magicka", total_cost)
endFunction

; Skipped compiler generated GetState

function OnEffectFinish(Actor akTarget, Actor akCaster)

	WB_Destruction_Crackle_Global.SetValue(0.000000)
endFunction

; Skipped compiler generated GotoState
