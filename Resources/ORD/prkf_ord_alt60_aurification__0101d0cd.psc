;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 30
Scriptname PRKF_ORD_Alt60_Aurification__0101D0CD Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
; no longer dependent on shared cooldown
ORD_Alt_Aurification_Global_NextActivate.SetValue(GameDaysPassed.GetValue()+0.5)
Actor TargetActor = akTargetRef as Actor
;TargetActor.AddItem(Gold001, Math.Ceiling(PlayerRef.GetActorValue("Alteration") * ORD_GoldAddAltMult))
;TargetActor.AddItem(Gold001, Math.Ceiling(TargetActor.GetItemCount(Gold001) * ORD_GoldMult))
TargetActor.AddItem(Gold001, (TargetActor.GetLevel() * ORD_GoldAddAltMult2) as Int)
If Utility.RandomFloat(0,1) < ORD_GoldBarChance
	TargetActor.AddItem(OreGold,1)
EndIf
PlayerRef.DoCombatSpellApply(ORD_Alt_Aurification_Spell_Proc, TargetActor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property ORD_Alt_CommandLock_Global_NextActivate  Auto  

GlobalVariable Property GameDaysPassed  Auto  

SPELL Property ORD_Alt_Aurification_Spell_Proc  Auto  

Actor Property PlayerRef  Auto  

MiscObject Property Gold001  Auto  

Float Property ORD_GoldMult  Auto  

MiscObject Property OreGold  Auto  

Float Property ORD_GoldBarChance  Auto  

Float Property ORD_GoldAddAltMult  Auto  

GlobalVariable Property ORD_Alt_Aurification_Global_NextActivate  Auto  

Int Property ORD_GoldAddAltMult2  Auto  
