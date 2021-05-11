Scriptname ORD_GenericPerkRefund_Script extends activemagiceffect  

; -----

Perk[] Property ORD_PerkRefundSet Auto
Actor Property PlayerRef Auto
String Property ORD_TreeName Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.5)
	Debug.MessageBox("The " + ORD_TreeName + " skill tree has been updated. Some of your " + ORD_TreeName + " perks will be refunded. Please wait...")
	Int i = 0
	While i < ORD_PerkRefundSet.Length
		If PlayerRef.HasPerk(ORD_PerkRefundSet[i])
			PlayerRef.RemovePerk(ORD_PerkRefundSet[i])
			Game.AddPerkPoints(1)
		EndIf
		i += 1
	EndWhile
	Debug.Notification(ORD_TreeName + " perks refunded.")

EndEvent

; -----