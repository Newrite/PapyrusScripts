;/ Decompiled by Champollion V1.0.1
Source   : TIF__00060679.psc
Modified : 2021-09-19 12:04:49
Compiled : 2021-09-19 15:11:54
User     : nirn2
Computer : WORKSTATION
/;
scriptName TIF__00060679 extends TopicInfo hidden

;-- Properties --------------------------------------
book property SKLxSmithing2 auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function Fragment_2(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	game.GetPlayer().RemoveItem(SKLxSmithing2 as form, 1, false, none)
	akSpeaker.additem(SKLxSmithing2 as form, 1, false)
	game.IncrementSkill("Smithing")
	globalvariable x = game.GetFormFromFile(3427, "zzzSXP.esp") as globalvariable
	debug.Notification("РџРѕР»СѓС‡РµРЅРѕ 10000 РѕРїС‹С‚Р° СЂР°Р·")
	x.Mod(10000 as Float)
	debug.Notification("РўРµРєСѓС‰РёР№ xp: " + x.GetValueInt() as String)
	self.GetOwningQuest().SetStage(20)
endFunction

; Skipped compiler generated GotoState

; Skipped compiler generated GetState
