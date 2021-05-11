;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname PRKF_ORD_SmhMAX_HeartOfCreat_0103C5F7 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
If ORD_Smh_HeartOfCreation_Global_Type.GetValue() > 0
	; existing
	If (akTargetRef == ORD_Forge.GetRef() || akTargetRef == ORD_Skyforge.GetRef())
		Game.DisablePlayerControls(true, true, false, false, true, true, true, false, 0)
		ORD_Smh_HeartOfCreation_Spell_Proc.Cast(PlayerRef)
	EndIf
Else
	; new
	If akTargetRef.HasKeyword(CraftingSmithingForge) && ORD_Smh_HeartOfCreation_Message_Want.Show(ORD_Smh_HeartOfCreation_Global_Div.GetValue()) == 1
		Game.DisablePlayerControls(true, true, false, false, true, true, true, false, 0)
		ORD_Smh_HeartOfCreation_Spell_Proc.Cast(PlayerRef)
		If akTargetRef.HasKeyword(CraftingSmithingSkyforge)
			ORD_Smh_HeartOfCreation_Global_Type.SetValue(2)
		Else
			ORD_Smh_HeartOfCreation_Global_Type.SetValue(1)
		EndIf
		ORD_HeartOfCreation_Quest.Start()
		ORD_Smh_HeartOfCreation_Marker_Upgrade.Play(akTargetRef)
		ORD_Smh_HeartOfCreation_Message_Upgraded.Show()
		Game.GetPlayer().DamageActorValue("Health", 50)
		Game.TriggerScreenBlood(2)
	EndIf
EndIf
; pass on activation
akTargetRef.Activate(PlayerRef)
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property ORD_Smh_HeartOfCreation_Global_Type  Auto  

ReferenceAlias Property ORD_Forge  Auto  

ReferenceAlias Property ORD_Skyforge  Auto  

SPELL Property ORD_Smh_HeartOfCreation_Spell_Proc  Auto  

Keyword Property CraftingSmithingForge  Auto  

Keyword Property CraftingSmithingSkyforge  Auto  

Message Property ORD_Smh_HeartOfCreation_Message_Want  Auto  

Sound Property ORD_Smh_HeartOfCreation_Marker_Upgrade  Auto  

Message Property ORD_Smh_HeartOfCreation_Message_Upgraded  Auto  

Quest Property ORD_HeartOfCreation_Quest  Auto  

Actor Property PlayerRef  Auto  

GlobalVariable Property ORD_Smh_HeartOfCreation_Global_Amount  Auto  

GlobalVariable Property ORD_Smh_HeartOfCreation_Global_Div  Auto  
