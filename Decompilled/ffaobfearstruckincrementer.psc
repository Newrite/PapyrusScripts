;/ Decompiled by Champollion V1.0.1
Source   : FFAOBFearstruckIncrementer.psc
Modified : 2018-02-08 01:33:09
Compiled : 2018-02-08 01:33:10
User     : borja
Computer : DESKTOP-BORJA
/;
scriptName FFAOBFearstruckIncrementer extends activemagiceffect

;-- Properties --------------------------------------
ffaobfearstruckcounterscript property myquestscript auto
actor property PlayerRef auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function OnDying(actor akKiller)

	if akKiller == PlayerRef
		myquestscript.IncrementCounter()
	endIf
endFunction

; Skipped compiler generated GetState
