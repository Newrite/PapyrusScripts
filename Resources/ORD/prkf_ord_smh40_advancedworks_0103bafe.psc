;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 64
Scriptname PRKF_ORD_Smh40_AdvancedWorks_0103BAFE Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
If ORD_Smh_AdvancedWorkshop_Global_Type.GetValue() > 0
	; has an upgraded armor table
	If (akTargetRef == ORD_ArmorTable.GetRef() || akTargetRef == ORD_Grindstone.GetRef())
		; and it is this one
		If ORD_Alc_SneakDetector_Global_SneakFlag.GetValue() <= 0 || ORD_Smh_AdvancedWorkshop_Message_Demolish.Show() == 0
			; and we are using it
			Game.DisablePlayerControls(true, true, false, false, true, true, true, false, 0)
			If PlayerRef.HasPerk(ORD_Smh80_FuelTheInferno_Perk_80) && PlayerRef.GetAV("DragonSouls") >= 1 && ORD_Smh_FuelTheInferno_Message_Want.Show() == 1
				ORD_Smh_FuelTheInferno_Spell_Proc.Cast(PlayerRef)
			;	PlayerRef.ModAV("DragonSouls", -1)
			Else
				ORD_Smh_AdvancedWorkshop_Spell_Proc.Cast(PlayerRef)
			EndIf
			; pass on activation to object
			akTargetRef.Activate(PlayerRef)
			Game.EnablePlayerControls()
		Else
			; we want to break it
			ORD_AdvancedWorkshop_Quest.Stop()
			ORD_Smh_AdvancedWorkshop_Global_Type.SetValue(-1)
			ORD_Smh_AdvancedWorkshop_Marker_Upgrade.Play(akTargetRef)
			ORD_Smh_AdvancedWorkshop_Message_Demolished.Show()
		EndIf
	Else
		; pass on activation to object
		akTargetRef.Activate(PlayerRef)
		Game.EnablePlayerControls()
	EndIf

Else
	; no upgraded crafting furniture yet
	If PlayerRef.GetItemCount(Gold001) >= ORD_Gold && akTargetRef.HasKeyword(CraftingSmithingArmorTable) && ORD_Smh_AdvancedWorkshop_Message_Want_ArmorTable.Show() == 1 && (ORD_Smh_AdvancedWorkshop_Global_Type_Lockout.GetValue() != -1 || ORD_Smh_AdvancedWorkshop_Message_Stop_ArmorTable.Show() == 1)
		; it is an armor table and we want to upgrade it
		Game.DisablePlayerControls(true, true, false, false, true, true, true, false, 0)
		PlayerRef.RemoveItem(Gold001,ORD_Gold)
		If PlayerRef.HasPerk(ORD_Smh80_FuelTheInferno_Perk_80) && PlayerRef.GetAV("DragonSouls") >= 1 && ORD_Smh_FuelTheInferno_Message_Want.Show() == 1
			ORD_Smh_FuelTheInferno_Spell_Proc.Cast(PlayerRef)
		;	PlayerRef.ModAV("DragonSouls", -1)
		Else
			ORD_Smh_AdvancedWorkshop_Spell_Proc.Cast(PlayerRef)
		EndIf
		ORD_Smh_AdvancedWorkshop_Global_Type.SetValue(1)
		ORD_Smh_AdvancedWorkshop_Global_Type_Lockout.SetValue(1)
		ORD_AdvancedWorkshop_Quest.Start()
		ORD_Smh_AdvancedWorkshop_Marker_Upgrade.Play(akTargetRef)
		ORD_Smh_AdvancedWorkshop_Message_Upgraded.Show()

	ElseIf PlayerRef.GetItemCount(Gold001) >= ORD_Gold && akTargetRef.HasKeyword(CraftingSmithingSharpeningWheel) && ORD_Smh_AdvancedWorkshop_Message_Want_SharpeningWheel.Show() == 1 && (ORD_Smh_AdvancedWorkshop_Global_Type_Lockout.GetValue() != -1 || ORD_Smh_AdvancedWorkshop_Message_Stop_SharpeningWheel.Show() == 1)
		; it is a sharpening wheel and we want to upgrade it
		Game.DisablePlayerControls(true, true, false, false, true, true, true, false, 0)
		PlayerRef.RemoveItem(Gold001,ORD_Gold)
		If PlayerRef.HasPerk(ORD_Smh80_FuelTheInferno_Perk_80) && PlayerRef.GetAV("DragonSouls") >= 1 && ORD_Smh_FuelTheInferno_Message_Want.Show() == 1
			ORD_Smh_FuelTheInferno_Spell_Proc.Cast(PlayerRef)
		;	PlayerRef.ModAV("DragonSouls", -1)
		Else
			ORD_Smh_AdvancedWorkshop_Spell_Proc.Cast(PlayerRef)
		EndIf
		ORD_Smh_AdvancedWorkshop_Global_Type.SetValue(2)
		ORD_Smh_AdvancedWorkshop_Global_Type_Lockout.SetValue(2)
		ORD_AdvancedWorkshop_Quest.Start()
		ORD_Smh_AdvancedWorkshop_Marker_Upgrade.Play(akTargetRef)
		ORD_Smh_AdvancedWorkshop_Message_Upgraded.Show()

	EndIf
	; pass on activation to object
	akTargetRef.Activate(PlayerRef)
	Game.EnablePlayerControls()
EndIf
;
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property ORD_Smh_AdvancedWorkshop_Global_Type  Auto  

Keyword Property CraftingSmithingArmorTable  Auto  

Keyword Property CraftingSmithingSharpeningWheel  Auto  

Quest Property ORD_AdvancedWorkshop_Quest  Auto  

Message Property ORD_Smh_AdvancedWorkshop_Message_Want_ArmorTable  Auto  

Message Property ORD_Smh_AdvancedWorkshop_Message_Want_SharpeningWheel  Auto  

Message Property ORD_Smh_AdvancedWorkshop_Message_Upgraded  Auto  

ReferenceAlias Property ORD_ArmorTable  Auto  

ReferenceAlias Property ORD_Grindstone  Auto  

SPELL Property ORD_Smh_AdvancedWorkshop_Spell_Proc  Auto  

Actor Property PlayerRef  Auto  

Sound Property ORD_Smh_AdvancedWorkshop_Marker_Upgrade  Auto  

SPELL Property ORD_Smh_FuelTheInferno_Spell_Proc  Auto  

Message Property ORD_Smh_FuelTheInferno_Message_Want  Auto  

Perk Property ORD_Smh80_FuelTheInferno_Perk_80  Auto  

Message Property ORD_Smh_AdvancedWorkshop_Message_Demolish  Auto  

Int Property ORD_Gold  Auto  

MiscObject Property Gold001  Auto  

Message Property ORD_Smh_AdvancedWorkshop_Message_Demolished  Auto  

GlobalVariable Property ORD_Smh_AdvancedWorkshop_Global_Type_Lockout  Auto  

Message Property ORD_Smh_AdvancedWorkshop_Message_Stop_ArmorTable  Auto  

Message Property ORD_Smh_AdvancedWorkshop_Message_Stop_SharpeningWheel  Auto  

GlobalVariable Property ORD_Alc_SneakDetector_Global_SneakFlag  Auto  
