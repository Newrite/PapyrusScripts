Scriptname ORD_LawlessWorld_Script extends activemagiceffect  

; -----

Float Property ORD_UpdateRate Auto
Float Property ORD_Mult Auto

Faction Property CrimeFactionEastmarch Auto
Faction Property CrimeFactionFalkreath Auto
Faction Property CrimeFactionHaafingar Auto
Faction Property CrimeFactionHjaalmarch Auto
Faction Property CrimeFactionOrcs Auto
Faction Property CrimeFactionPale Auto
Faction Property CrimeFactionReach Auto
Faction Property CrimeFactionRift Auto
Faction Property CrimeFactionWhiterun Auto
Faction Property CrimeFactionWinterhold Auto

Faction Property CrimeFactionThievesGuild Auto
Faction Property CrimeFactionImperial Auto
Faction Property CrimeFactionSons Auto
Faction Property CrimeFactionKhajiitCaravans Auto

Message[] Property ORD_ReducedToZero Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdateGameTime(ORD_UpdateRate)

EndEvent

; -----

Event OnUpdateGameTime()

	Int RedemptionAmount = Math.Ceiling(Game.GetPlayer().GetAV("Pickpocket") * ORD_Mult * 2.0)

	; store previous crime gold
	Int CrimeGoldEastmarch = CrimeFactionEastmarch.GetCrimeGoldNonViolent()
	Int CrimeGoldFalkreath = CrimeFactionFalkreath.GetCrimeGoldNonViolent()
	Int CrimeGoldHaafingar = CrimeFactionHaafingar.GetCrimeGoldNonViolent()
	Int CrimeGoldHjaalmarch = CrimeFactionHjaalmarch.GetCrimeGoldNonViolent()
	Int CrimeGoldOrcs = CrimeFactionOrcs.GetCrimeGoldNonViolent()
	Int CrimeGoldPale = CrimeFactionPale.GetCrimeGoldNonViolent()
	Int CrimeGoldReach = CrimeFactionReach.GetCrimeGoldNonViolent()
	Int CrimeGoldRift = CrimeFactionRift.GetCrimeGoldNonViolent()
	Int CrimeGoldWhiterun = CrimeFactionWhiterun.GetCrimeGoldNonViolent()
	Int CrimeGoldWinterhold = CrimeFactionWinterhold.GetCrimeGoldNonViolent()

	Int CrimeGoldThievesGuild = CrimeFactionThievesGuild.GetCrimeGoldNonViolent()
	Int CrimeGoldImperial = CrimeFactionImperial.GetCrimeGoldNonViolent()
	Int CrimeGoldSons = CrimeFactionSons.GetCrimeGoldNonViolent()
	Int CrimeGoldKhajiitCaravans = CrimeFactionKhajiitCaravans.GetCrimeGoldNonViolent()

	; reduce crime gold
	If CrimeGoldEastmarch != 0
		If CrimeGoldEastmarch <= RedemptionAmount
			CrimeFactionEastmarch.SetCrimeGold(0)
			CrimeFactionEastmarch.PlayerPayCrimeGold(false, false)
			ORD_ReducedToZero[0].Show()
		Else
			CrimeFactionEastmarch.ModCrimeGold(-RedemptionAmount)
		EndIf
	EndIf
	If CrimeGoldFalkreath != 0
		If CrimeGoldFalkreath <= RedemptionAmount
			CrimeFactionFalkreath.SetCrimeGold(0)
			CrimeFactionFalkreath.PlayerPayCrimeGold(false, false)
			ORD_ReducedToZero[1].Show()
		Else
			CrimeFactionFalkreath.ModCrimeGold(-RedemptionAmount)
		EndIf
	EndIf
	If CrimeGoldHaafingar != 0
		If CrimeGoldHaafingar <= RedemptionAmount
			CrimeFactionHaafingar.SetCrimeGold(0)
			CrimeFactionHaafingar.PlayerPayCrimeGold(false, false)
			ORD_ReducedToZero[2].Show()
		Else
			CrimeFactionHaafingar.ModCrimeGold(-RedemptionAmount)
		EndIf
	EndIf
	If CrimeGoldHjaalmarch != 0
		If CrimeGoldHjaalmarch <= RedemptionAmount
			CrimeFactionHjaalmarch.SetCrimeGold(0)
			CrimeFactionHjaalmarch.PlayerPayCrimeGold(false, false)
			ORD_ReducedToZero[3].Show()
		Else
			CrimeFactionHjaalmarch.ModCrimeGold(-RedemptionAmount)
		EndIf
	EndIf
	If CrimeGoldOrcs != 0
		If CrimeGoldOrcs <= RedemptionAmount
			CrimeFactionOrcs.SetCrimeGold(0)
			CrimeFactionOrcs.PlayerPayCrimeGold(false, false)
			ORD_ReducedToZero[4].Show()
		Else
			CrimeFactionOrcs.ModCrimeGold(-RedemptionAmount)
		EndIf
	EndIf
	If CrimeGoldPale != 0
		If CrimeGoldPale <= RedemptionAmount
			CrimeFactionPale.SetCrimeGold(0)
			CrimeFactionPale.PlayerPayCrimeGold(false, false)
			ORD_ReducedToZero[5].Show()
		Else
			CrimeFactionPale.ModCrimeGold(-RedemptionAmount)
		EndIf
	EndIf
	If CrimeGoldReach != 0
		If CrimeGoldReach <= RedemptionAmount
			CrimeFactionReach.SetCrimeGold(0)
			CrimeFactionReach.PlayerPayCrimeGold(false, false)
			ORD_ReducedToZero[6].Show()
		Else
			CrimeFactionReach.ModCrimeGold(-RedemptionAmount)
		EndIf
	EndIf
	If CrimeGoldRift != 0
		If CrimeGoldRift <= RedemptionAmount
			CrimeFactionRift.SetCrimeGold(0)
			CrimeFactionRift.PlayerPayCrimeGold(false, false)
			ORD_ReducedToZero[7].Show()
		Else
			CrimeFactionRift.ModCrimeGold(-RedemptionAmount)
		EndIf
	EndIf
	If CrimeGoldWhiterun != 0
		If CrimeGoldWhiterun <= RedemptionAmount
			CrimeFactionWhiterun.SetCrimeGold(0)
			CrimeFactionWhiterun.PlayerPayCrimeGold(false, false)
			ORD_ReducedToZero[8].Show()
		Else
			CrimeFactionWhiterun.ModCrimeGold(-RedemptionAmount)
		EndIf
	EndIf
	If CrimeGoldWinterhold != 0
		If CrimeGoldWinterhold <= RedemptionAmount
			CrimeFactionWinterhold.SetCrimeGold(0)
			CrimeFactionWinterhold.PlayerPayCrimeGold(false, false)
			ORD_ReducedToZero[9].Show()
		Else
			CrimeFactionWinterhold.ModCrimeGold(-RedemptionAmount)
		EndIf
	EndIf
	If CrimeGoldThievesGuild != 0
		If CrimeGoldThievesGuild <= RedemptionAmount
			CrimeFactionThievesGuild.SetCrimeGold(0)
			CrimeFactionThievesGuild.PlayerPayCrimeGold(false, false)
			ORD_ReducedToZero[10].Show()
		Else
			CrimeFactionThievesGuild.ModCrimeGold(-RedemptionAmount)
		EndIf
	EndIf
	If CrimeGoldImperial != 0
		If CrimeGoldImperial <= RedemptionAmount
			CrimeFactionImperial.SetCrimeGold(0)
			CrimeFactionImperial.PlayerPayCrimeGold(false, false)
			ORD_ReducedToZero[11].Show()
		Else
			CrimeFactionImperial.ModCrimeGold(-RedemptionAmount)
		EndIf
	EndIf
	If CrimeGoldSons != 0
		If CrimeGoldSons <= RedemptionAmount
			CrimeFactionSons.SetCrimeGold(0)
			CrimeFactionSons.PlayerPayCrimeGold(false, false)
			ORD_ReducedToZero[12].Show()
		Else
			CrimeFactionSons.ModCrimeGold(-RedemptionAmount)
		EndIf
	EndIf
	If CrimeGoldKhajiitCaravans != 0
		If CrimeGoldKhajiitCaravans <= RedemptionAmount
			CrimeFactionKhajiitCaravans.SetCrimeGold(0)
			CrimeFactionKhajiitCaravans.PlayerPayCrimeGold(false, false)
			ORD_ReducedToZero[13].Show()
		Else
			CrimeFactionKhajiitCaravans.ModCrimeGold(-RedemptionAmount)
		EndIf
	EndIf

	; reregister
	RegisterForSingleUpdateGameTime(ORD_UpdateRate)

EndEvent

; -----