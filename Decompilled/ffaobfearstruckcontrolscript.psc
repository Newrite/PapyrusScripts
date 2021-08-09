;/ Decompiled by Champollion V1.0.1
Source   : FFAOBFearstruckControlScript.psc
Modified : 2018-02-08 01:30:21
Compiled : 2018-02-08 01:30:22
User     : borja
Computer : DESKTOP-BORJA
/;
scriptName FFAOBFearstruckControlScript extends activemagiceffect

;-- Properties --------------------------------------
actor property PlayerRef auto
spell property FFAOBFearstruckMadSpell auto
globalvariable property FFAOBFearstruckKillCount auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function OnAnimationEvent(objectreference akSource, String asEventName)

	if akSource == PlayerRef as objectreference && asEventName == "bashRelease" && FFAOBFearstruckKillCount.GetValue() > 4.00000
		FFAOBFearstruckMadSpell.Cast(PlayerRef as objectreference, none)
		FFAOBFearstruckKillCount.SetValue(0.000000)
	endIf
endFunction

function OnEffectStart(actor akTarget, actor akCaster)

	self.RegisterForAnimationEvent(PlayerRef as objectreference, "bashRelease")
endFunction
