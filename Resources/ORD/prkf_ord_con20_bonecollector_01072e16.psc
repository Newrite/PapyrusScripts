;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 75
Scriptname PRKF_ORD_Con20_BoneCollector_01072E16 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_45
Function Fragment_45(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
(akTargetRef as Actor).DispelSpell(ORD_HoldPositionNoCombat)
(akTargetRef as Actor).DispelSpell(ORD_FollowPlayerNoCombat)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
; refunds items
(akTargetRef as Actor).Kill(akActor)
;
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
; player lacks necessary bones
If akActor == Game.GetPlayer()
	ORD_Con_BoneCollector_Message_NoItems.Show()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ORD_Con_BoneCollector_Message_Help_OrderDuration.ShowAsHelpMessage("BoneCollector_OrderDuration", 7, 10, 1)
(akTargetRef as Actor).DispelSpell(ORD_FollowPlayerNoCombat)
akActor.DoCombatSpellApply(ORD_HoldPositionNoCombat, akTargetRef as Actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ORD_Con_BoneCollector_Message_Help_OrderDuration.ShowAsHelpMessage("BoneCollector_OrderDuration", 7, 10, 1)
(akTargetRef as Actor).DispelSpell(ORD_HoldPositionNoCombat)
akActor.DoCombatSpellApply(ORD_FollowPlayerNoCombat, akTargetRef as Actor)
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
; to clear a path
akActor.PushActorAway(akTargetRef as Actor, 10.5)
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
; player has the right bones
If GameHour.GetValue() < 5.0 || GameHour.GetValue() >= 19.0
	; it is night
	If akActor.HasPerk(ORD_BuffAoEPerk) && ORD_Con_BoneCollector_Global_Count.GetValue() > 0 && ORD_Con_BoneCollector_Message_BuffAoE.Show() == 1
		; trigger the buff aoe
		ORD_BuffAoE.Cast(akActor)
		akTargetRef.Activate(akActor)
	Else
		; trigger the summoning
		If ORD_Con_BoneCollector_Global_Count.GetValue() == 0 || (akActor.HasPerk(ORD_MultiPerk) && ORD_Con_BoneCollector_Global_Count.GetValue() <= (akActor.GetBaseAV("Magicka") / ORD_CapPerkDivisor)) || (akActor.HasPerk(ORD_MultiPerkLevel2) && ORD_Con_BoneCollector_Global_Count.GetValue() <= (akActor.GetBaseAV("Magicka") / ORD_CapPerkDivisorLevel2))
			; meets the summon limit requirements
			If akActor.HasPerk(ORD_MagePerk) && ORD_Con_BoneCollector_Message_SkeletonMage.Show() == 1
				; summon skeleton mage
				If akActor.HasPerk(ORD_MagePerkLevel2)
					; allow summoning specific skeleton mage
					Int WhichSkeleton = ORD_Con_BoneCollector_Message_SkeletonMage_Type.Show()
					ORD_Con_BoneCollector_Spell_Proc_Mage[WhichSkeleton].Cast(akActor)
				Else
					; summon a random skeleton mage
					ORD_Con_BoneCollector_Spell_Proc_Mage[ORD_Con_BoneCollector_Global_NextInLine.GetValue() as Int].Cast(akActor)
					ORD_Con_BoneCollector_Global_NextInLine.SetValue(Utility.RandomInt(0,2))
				EndIf
			Else
				; summon skeleton warrior
				ORD_Con_BoneCollector_Spell_Proc.Cast(akActor)
			EndIf
			akTargetRef.Activate(akActor)
		ElseIf akActor == Game.GetPlayer()
			ORD_Con_BoneCollector_Message_AtMax.Show()
		EndIf
	EndIf
ElseIf akActor == Game.GetPlayer()
	; it is not night
	ORD_Con_BoneCollector_Message_NoNight.Show()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property ORD_Con_BoneCollector_Message_NoNight  Auto  

GlobalVariable Property GameHour  Auto  

SPELL Property ORD_Con_BoneCollector_Spell_Proc  Auto  

Message Property ORD_Con_BoneCollector_Message_NoItems  Auto  

Message Property ORD_Con_BoneCollector_Message_AtMax  Auto  

Float Property ORD_CapPerkDivisor  Auto  

GlobalVariable Property ORD_Con_BoneCollector_Global_Count  Auto  

Perk Property ORD_MultiPerk  Auto  

Perk Property ORD_MagePerk  Auto  

Message Property ORD_Con_BoneCollector_Message_SkeletonMage  Auto  

SPELL[] Property ORD_Con_BoneCollector_Spell_Proc_Mage  Auto  

GlobalVariable Property ORD_Con_BoneCollector_Global_NextInLine  Auto  

SPELL Property ORD_HoldPositionNoCombat  Auto  

Message Property ORD_Con_BoneCollector_Message_Help_CanActivate  Auto  

Message Property ORD_Con_BoneCollector_Message_Help_OrderDuration  Auto  

SPELL Property ORD_FollowPlayerNoCombat  Auto  

Perk Property ORD_MagePerkLevel2  Auto  

Message Property ORD_Con_BoneCollector_Message_SkeletonMage_Type  Auto  

Perk Property ORD_MultiPerkLevel2  Auto  

Float Property ORD_CapPerkDivisorLevel2  Auto  

SPELL Property ORD_BuffAoE  Auto  

Perk Property ORD_BuffAoEPerk  Auto  

Message Property ORD_Con_BoneCollector_Message_BuffAoE  Auto  
