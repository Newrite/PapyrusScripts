;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 59
Scriptname PRKF_ORD_Enc40_GemDust_Perk__010389FC Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Float IsSneaking = ORD_Alc_SneakDetector_Global_SneakFlag.GetValue()
Game.DisablePlayerControls(true, true, false, false, true, true, true, false, 0)
Int PlayerChoice = 0

; gem dust
If (PlayerRef.GetItemCount(VendorItemGem) != 0 || PlayerRef.GetItemCount(GemAmethystFlawless) != 0) && IsSneaking <= 0	; because flawless amethysts are not considered gems
	; player has gems
	PlayerChoice = ORD_Enc_GemDust_Message_Want.Show()
	If PlayerChoice != 0
		; player wants to use a gem
		PlayerChoice -= 1
		PlayerRef.RemoveItem(ORD_Gem[PlayerChoice])
		ORD_Enc_GemDust_Spell[PlayerChoice].Cast(PlayerRef)
		; duration of visual effect is limited
		ORD_Enc_GemDust_FXS[PlayerChoice].Play(akTargetRef, 10.0)
	EndIf
EndIf

; arcane nexus (also includes miracle)
If PlayerRef.HasPerk(ORD_Enc90_ArcaneNexus_Perk_90)
	If ORD_Enc_ArcaneNexus_Global_Type.GetValue() <= 0
		; no upgraded crafting table yet
		If PlayerRef.GetItemCount(Gold001) >= ORD_Gold && ORD_Enc_ArcaneNexus_Message_Want.Show() == 1
			; we want to upgrade this one
			PlayerRef.RemoveItem(Gold001,ORD_Gold)
			ORD_Enc_ArcaneNexus_Global_Type.SetValue(1)
			ORD_ArcaneNexus_Quest.Start()
			ORD_Enc_ArcaneNexus_Spell_Proc.Cast(PlayerRef)
			ORD_Enc_ArcaneNexus_Message_Upgraded.Show()
		EndIf
		; proceed to crafting table
		akTargetRef.Activate(PlayerRef)
		Game.EnablePlayerControls()
		; preserver (this is not time critical)
		If PlayerRef.HasPerk(ORD_Enc50_Preserver_Perk_50)
			ORD_Enc_Preserver_Spell_Proc.Cast(PlayerRef)
		EndIf
	ElseIf akTargetRef == ORD_ArcaneNexus_Enchanter.GetRef()
		; has an upgraded crafting table
		If PlayerChoice == 0 && (IsSneaking > 0 && ORD_Enc_ArcaneNexus_Message_Demolish.Show() == 1)	; can't disassemble after using a gem
			; we want to break it down
			ORD_ArcaneNexus_Quest.Stop()
			ORD_Enc_ArcaneNexus_Global_Type.SetValue(-1)
			Game.EnablePlayerControls()
			ORD_Enc_ArcaneNexus_Message_Demolished.Show()
		Else
			; we want to use it
			ORD_Enc_ArcaneNexus_Spell_Proc.Cast(PlayerRef)
			; proceed to crafting table
			akTargetRef.Activate(PlayerRef)
			Game.EnablePlayerControls()
			; preserver (this is not time critical)
			If PlayerRef.HasPerk(ORD_Enc50_Preserver_Perk_50)
				ORD_Enc_Preserver_Spell_Proc.Cast(PlayerRef)
			EndIf
		EndIf
	Else
		; proceed to crafting table
		akTargetRef.Activate(PlayerRef)
		Game.EnablePlayerControls()
		; preserver (this is not time critical)
		If PlayerRef.HasPerk(ORD_Enc50_Preserver_Perk_50)
			ORD_Enc_Preserver_Spell_Proc.Cast(PlayerRef)
		EndIf
	EndIf
Else
	; proceed to crafting table
	akTargetRef.Activate(PlayerRef)
	Game.EnablePlayerControls()
	; preserver (this is not time critical)
	If PlayerRef.HasPerk(ORD_Enc50_Preserver_Perk_50)
		ORD_Enc_Preserver_Spell_Proc.Cast(PlayerRef)
	EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property VendorItemGem  Auto  

MiscObject Property GemAmethystFlawless  Auto  

Message Property ORD_Enc_GemDust_Message_Want  Auto  

MiscObject[] Property ORD_Gem  Auto  

SPELL[] Property ORD_Enc_GemDust_Spell  Auto  

EffectShader[] Property ORD_Enc_GemDust_FXS  Auto  

Perk Property ORD_Enc90_ArcaneNexus_Perk_90  Auto  

Actor Property PlayerRef  Auto  

Quest Property ORD_ArcaneNexus_Quest  Auto  

ReferenceAlias Property ORD_ArcaneNexus_Enchanter  Auto  

SPELL Property ORD_Enc_ArcaneNexus_Spell_Proc  Auto  

GlobalVariable Property ORD_Enc_ArcaneNexus_Global_Type  Auto  

SPELL Property ORD_Enc_Preserver_Spell_Proc  Auto  

Perk Property ORD_Enc50_Preserver_Perk_50  Auto  

Message Property ORD_Enc_ArcaneNexus_Message_Want  Auto  

Message Property ORD_Enc_ArcaneNexus_Message_Upgraded  Auto  

Message Property ORD_Enc_ArcaneNexus_Message_Demolish  Auto  

MiscObject Property Gold001  Auto  

Int Property ORD_Gold  Auto  

Message Property ORD_Enc_ArcaneNexus_Message_Demolished  Auto  

GlobalVariable Property ORD_Alc_SneakDetector_Global_SneakFlag  Auto  
