Scriptname ORD_DaughterOfTheForge_Power_Script extends activemagiceffect  

; -----

Sound Property ORD_Smh_DaughterOfTheForge_Marker Auto
VisualEffect Property ORD_Smh_DaughterOfTheForge_VFX Auto
GlobalVariable Property ORD_Smh_DaughterOfTheForge_Global_IsCompleted Auto
Float Property ORD_UpgradeRank Auto
EffectShader Property ORD_Smh_DaughterOfTheForge_FXS Auto
Sound Property MAGFail auto
Quest Property ORD_DaughterOfTheForge_Quest Auto
ReferenceAlias Property ORD_DaughterOfTheForge Auto
Spell Property ORD_Smh_DaughterOfTheForge_Spell Auto
Message Property ORD_Smh_DaughterOfTheForge_Message_Fail_NoItem Auto
Message Property ORD_Smh_DaughterOfTheForge_Message_Fail_NotLegendary Auto
ObjectReference Property ORD_Container Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ObjectReference TheItem = Game.GetPlayerGrabbedRef()
	If TheItem
		Float HealthPercent = TheItem.GetItemHealthPercent()
		If HealthPercent >= 1.6
			ORD_Smh_DaughterOfTheForge_Global_IsCompleted.SetValue(1)
			ORD_Smh_DaughterOfTheForge_FXS.Play(TheItem)
	;		TheItem.ApplyHavokImpulse(0,0,1500, 20)
			akTarget.DropObject(TheItem)
			TheItem.SetItemHealthPercent(HealthPercent + ORD_UpgradeRank)
			ORD_Smh_DaughterOfTheForge_VFX.Play(akTarget)
			ORD_Smh_DaughterOfTheForge_Marker.Play(akTarget)
			Utility.Wait(2.0)
			ORD_DaughterOfTheForge.ForceRefTo(TheItem)
			akTarget.RemoveSpell(ORD_Smh_DaughterOfTheForge_Spell)
		Else
			MAGFail.Play(akTarget)
			ORD_Smh_DaughterOfTheForge_Message_Fail_NotLegendary.Show()
		EndIf
	Else
		MAGFail.Play(akTarget)
		ORD_Smh_DaughterOfTheForge_Message_Fail_NoItem.Show()
	EndIf

EndEvent

; -----