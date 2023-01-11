Scriptname TestMCMmenu extends SKI_ConfigBase

Actor Property Player Auto
FormList[] Property aVILists Auto

String Pages
String[] stats
String[] statsnames
String[] avstats
String[] avheadstring
String[] resists
String[] resistsname
String[] variousvalues
String[] variousvaluesname
String[] multiplicators
String[] multiplicatorsname
String[] manacost
String[] manacostname

Int[] PerkOptionIDBlock
Int[] PerkOptionIDHeavyArmor
Int[] PerkOptionIDOneHanded
Int[] PerkOptionIDSmithing
Int[] PerkOptionIDTwoHanded
Int[] PerkOptionIDAlteration
Int[] PerkOptionIDConjuration
Int[] PerkOptionIDDestruction
Int[] PerkOptionIDEnchanting
Int[] PerkOptionIDIllusion
Int[] PerkOptionIDRestoration
Int[] PerkOptionIDMarksman
Int[] PerkOptionIDAlchemy
Int[] PerkOptionIDLightArmor
Int[] PerkOptionIDLockpicking
Int[] PerkOptionIDPickpocket
Int[] PerkOptionIDSneak
Int[] PerkOptionIDSpeechcraft
Int[] SkillsToggleID
Int[] AvToggleID
Int[] ResistsToggleID
Int[] VariousValuesToggleID
Int[] MultiplicatorsToggleID
Int[] ManacostToggleID
Int LevelToggleID
Int PerkpointToggleID
Int DragonsoulsToggleID
Int[] AvAdded
Int TakeAllPerkID

Event OnPageReset(string page)

    If page == "$SkillsPage" || page == ""
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        LevelToggleID = self.AddTextOption("$LevelSlid", Player.GetLevel() as Int, 0)
        PerkpointToggleID = self.AddTextOption("$PerkPointSlid", game.GetPerkPoints() as Int, 0)
        DragonsoulsToggleID = self.AddTextOption("$DragonsoulslSlid", Player.GetAV("DragonSouls") as Int, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < 18
            ;SkillsToggleID[i] = self.AddSliderOption(statsnames[i], Player.GetBaseAV(stats[i]), "{0}", 0)
            SkillsToggleID[i] = self.AddTextOption(statsnames[i], Player.GetBaseAV(stats[i]) as Int, 0)
            i += 1
        EndWhile
    ElseIf page == "$ActorValuePage"
        self.SetCursorFillMode(self.TOP_TO_BOTTOM)
        Int i = 0
        While i < avheadstring.Length
            self.AddHeaderOption(avheadstring[i], 0)
            AvToggleID[i] = self.AddTextOption("$Add", AvAdded[i] as Int, 0)
            AvToggleID[i+3] = self.AddTextOption("$Base", Player.GetBaseAV(avstats[i]) as Int, 0)
            AvToggleID[i+6] = self.AddTextOption("$BaseRegen", Player.GetBaseAV(avstats[i+3]) as Float, 0)
            AvToggleID[i+9] = self.AddTextOption("$PercentRegenBonus", Player.GetAV(avstats[i+6]) as Int, 0)
            self.AddEmptyOption()
            If i == 1
                self.SetCursorPosition(1)
            EndIf
            i += 1
        EndWhile
        AddHeaderOption("$ResistHeader", 0)
        i = 0
        While i < resists.Length
            ResistsToggleID[i] = self.AddTextOption(resistsname[i], Player.GetAV(resists[i]) as Int, 0)
            i += 1
        EndWhile
		self.AddEmptyOption()
		AddHeaderOption("$MultiplicatorsHeader", 0)
        i = 0
        While i < multiplicators.Length
            MultiplicatorsToggleID[i] = self.AddTextOption(multiplicatorsname[i], Player.GetAV(multiplicators[i]) as Float, 0)
            i += 1
        EndWhile
		self.SetCursorPosition(22)
		self.AddEmptyOption()
		AddHeaderOption("$VariousValuesHeader", 0)
        i = 0
        While i < variousvalues.Length
            VariousValuesToggleID[i] = self.AddTextOption(variousvaluesname[i], Player.GetAV(variousvalues[i]) as Int, 0)
            i += 1
        EndWhile
		self.AddEmptyOption()
		AddHeaderOption("$ManacostHeader", 0)
        i = 0
        While i < manacost.Length
            ManacostToggleID[i] = self.AddTextOption(manacostname[i], Player.GetAV(manacost[i]) as Int, 0)
            i += 1
        EndWhile
    ElseIf page == "$BlockPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[0].GetSize()
            PerkOptionIDBlock[i] = self.AddToggleOption(aVILists[0].GetAt(i).GetName(), Player.HasPerk(aVILists[0].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile
    ElseIf page == "$HeavyArmorPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[1].GetSize()
            PerkOptionIDHeavyArmor[i] = self.AddToggleOption(aVILists[1].GetAt(i).GetName(), Player.HasPerk(aVILists[1].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile
    ElseIf page == "$OneHandedPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[2].GetSize()
            PerkOptionIDOneHanded[i] = self.AddToggleOption(aVILists[2].GetAt(i).GetName(), Player.HasPerk(aVILists[2].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile
    ElseIf page == "$SmithingPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[3].GetSize()
            PerkOptionIDSmithing[i] = self.AddToggleOption(aVILists[3].GetAt(i).GetName(), Player.HasPerk(aVILists[3].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile
    ElseIf page == "$TwoHandedPage"
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[4].GetSize()
            PerkOptionIDTwoHanded[i] = self.AddToggleOption(aVILists[4].GetAt(i).GetName(), Player.HasPerk(aVILists[4].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile
    ElseIf page == "$AlterationPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[5].GetSize()
            PerkOptionIDAlteration[i] = self.AddToggleOption(aVILists[5].GetAt(i).GetName(), Player.HasPerk(aVILists[5].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile
    ElseIf page == "$ConjurationPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[6].GetSize()
            PerkOptionIDConjuration[i] = self.AddToggleOption(aVILists[6].GetAt(i).GetName(), Player.HasPerk(aVILists[6].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile
    ElseIf page == "$DestructionPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[7].GetSize()
            PerkOptionIDDestruction[i] = self.AddToggleOption(aVILists[7].GetAt(i).GetName(), Player.HasPerk(aVILists[7].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile
    ElseIf page == "$EnchantingPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[8].GetSize()
            PerkOptionIDEnchanting[i] = self.AddToggleOption(aVILists[8].GetAt(i).GetName(), Player.HasPerk(aVILists[8].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile 
    ElseIf page == "$IllusionPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[9].GetSize()
            PerkOptionIDIllusion[i] = self.AddToggleOption(aVILists[9].GetAt(i).GetName(), Player.HasPerk(aVILists[9].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile  
    ElseIf page == "$RestorationPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[10].GetSize()
            PerkOptionIDRestoration[i] = self.AddToggleOption(aVILists[10].GetAt(i).GetName(), Player.HasPerk(aVILists[10].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile
    ElseIf page == "$MarksmanPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[11].GetSize()
            PerkOptionIDMarksman[i] = self.AddToggleOption(aVILists[11].GetAt(i).GetName(), Player.HasPerk(aVILists[11].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile   
    ElseIf page == "$AlchemyPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[12].GetSize()
            PerkOptionIDAlchemy[i] = self.AddToggleOption(aVILists[12].GetAt(i).GetName(), Player.HasPerk(aVILists[12].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile     
    ElseIf page == "$LightArmorPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[13].GetSize()
            PerkOptionIDLightArmor[i] = self.AddToggleOption(aVILists[13].GetAt(i).GetName(), Player.HasPerk(aVILists[13].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile      
    ElseIf page == "$LockpickingPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[14].GetSize()
            PerkOptionIDLockpicking[i] = self.AddToggleOption(aVILists[14].GetAt(i).GetName(), Player.HasPerk(aVILists[14].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile   
    ElseIf page == "$PickpocketPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[15].GetSize()
            PerkOptionIDPickpocket[i] = self.AddToggleOption(aVILists[15].GetAt(i).GetName(), Player.HasPerk(aVILists[15].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile 
    ElseIf page == "$SneakPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[16].GetSize()
            PerkOptionIDSneak[i] = self.AddToggleOption(aVILists[16].GetAt(i).GetName(), Player.HasPerk(aVILists[16].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile 
    ElseIf page == "$SpeechcraftPage"
        self.SetCursorFillMode(self.LEFT_TO_RIGHT)
        TakeAllPerkID = self.AddToggleOption("$TakeAllPerk", false, 0)
        self.AddEmptyOption()
        self.AddEmptyOption()
        self.AddEmptyOption()
        Int i = 0
        While i < aVILists[17].GetSize()
            PerkOptionIDSpeechcraft[i] = self.AddToggleOption(aVILists[17].GetAt(i).GetName(), Player.HasPerk(aVILists[17].GetAt(i) as Perk) as bool, 0)
            i += 1
        EndWhile
    EndIf
EndEvent

Event OnConfigInit()

	stats = new String[18]
	stats[0] = "Block"
	stats[1] = "HeavyArmor"
	stats[2] = "OneHanded"
	stats[3] = "Smithing"
	stats[4] = "TwoHanded"
	stats[5] = "Alteration"
	stats[6] = "Conjuration"
	stats[7] = "Destruction"
	stats[8] = "Enchanting"
	stats[9] = "Illusion"
	stats[10] = "Restoration"
	stats[11] = "Marksman"
	stats[12] = "Alchemy"
	stats[13] = "LightArmor"
	stats[14] = "Lockpicking"
	stats[15] = "Pickpocket"
	stats[16] = "Sneak"
	stats[17] = "Speechcraft"
    pages = new String[20]
    pages[0] = "$SkillsPage"
    pages[1] = "$ActorValuePage"
    pages[2] = "$BlockPage"
    pages[3] = "$HeavyArmorPage"
    pages[4] = "$OneHandedPage"
    pages[5] = "$SmithingPage"
    pages[6] = "$TwoHandedPage"
    pages[7] = "$AlterationPage"
    pages[8] = "$ConjurationPage"
    pages[9] = "$DestructionPage"
    pages[10] = "$EnchantingPage"
    pages[11] = "$IllusionPage"
    pages[12] = "$RestorationPage"
    pages[13] = "$MarksmanPage"
    pages[14] = "$AlchemyPage"
    pages[15] = "$LightArmorPage"
    pages[16] = "$LockpickingPage"
    pages[17] = "$PickpocketPage"
    pages[18] = "$SneakPage"
    pages[19] = "$SpeechcraftPage"
    UpdatePerkList()
    avstats = new String[9]
    avstats[0] = "Health"
    avstats[1] = "Magicka"
    avstats[2] = "Stamina"
    avstats[3] = "HealRate"
    avstats[4] = "MagickaRate"
    avstats[5] = "StaminaRate"
    avstats[6] = "HealRateMult"
    avstats[7] = "MagickaRateMult"
    avstats[8] = "StaminaRateMult"
    avheadstring = new String[3]
    avheadstring[0] = "$Health"
    avheadstring[1] = "$Magicka"
    avheadstring[2] = "$Stamina"
    resists = new String[8]
    resists[0] = "DamageResist"
    resists[1] = "MagicResist"
    resists[2] = "FireResist"
    resists[3] = "FrostResist"
    resists[4] = "ElectricResist"
    resists[5] = "AbsorbChance"
    resists[6] = "PoisonResist"
    resists[7] = "DiseaseResist"
    resistsname = new String[8]
    resistsname[0] = "$DamageResistOption"
    resistsname[1] = "$MagicResistOption"
    resistsname[2] = "$FireResistOption"
    resistsname[3] = "$FrostResistOption"
    resistsname[4] = "$ElectricResistOption"
    resistsname[5] = "$AbsorbChanceOption"
    resistsname[6] = "$PoisonResistOption"
    resistsname[7] = "$DiseaseResistOption"
	variousvalues = new String[6]
    variousvalues[0] = "CarryWeight"
    variousvalues[1] = "SpeedMult"
    variousvalues[2] = "UnarmedDamage"
	variousvalues[3] = "SmithingMod"
    variousvalues[4] = "AlchemyMod"
	variousvalues[5] = "EnchantingMod"
    variousvaluesname = new String[6]
    variousvaluesname[0] = "$CarryWeightOption"
	variousvaluesname[1] = "$SpeedMultOption"
    variousvaluesname[2] = "$UnarmedDamageOption"
    variousvaluesname[3] = "$SmithingModOption"
    variousvaluesname[4] = "$AlchemyModOption"
    variousvaluesname[5] = "$EnchantingModOption"
	multiplicators = new String[4]
	multiplicators[0] = "AttackDamageMult"
    multiplicators[1] = "WeaponSpeedMult"
    multiplicators[2] = "LeftWeaponSpeedMult"
    multiplicators[3] = "ShoutRecoveryMult"
	multiplicatorsname = new String[4]
    multiplicatorsname[0] = "$AttackDamageMultOption"
    multiplicatorsname[1] = "$WeaponSpeedMultOption"
    multiplicatorsname[2] = "$LeftWeaponSpeedMultOption"
    multiplicatorsname[3] = "$ShoutRecoveryMultOption"
	manacost = new String[5]
    manacost[0] = "AlterationMod"
    manacost[1] = "ConjurationMod"
    manacost[2] = "DestructionMod"
	manacost[3] = "IllusionMod"
    manacost[4] = "RestorationMod"
    manacostname = new String[5]
    manacostname[0] = "$AlterationModOption"
	manacostname[1] = "$ConjurationModOption"
    manacostname[2] = "$DestructionModOption"
    manacostname[3] = "$IllusionModOption"
    manacostname[4] = "$RestorationModOption"

	

    statsnames = new String[18]
    Int i = 0
    While i < statsnames.Length
        statsnames[i] = actorvalueinfo.GetActorValueInfobyName(stats[i]).GetName()
        i += 1
    EndWhile
    PerkOptionIDBlock = new Int[30]
    PerkOptionIDHeavyArmor = new Int[30]
    PerkOptionIDOneHanded = new Int[30]
    PerkOptionIDSmithing = new Int[30]
    PerkOptionIDTwoHanded = new Int[30]
    PerkOptionIDAlteration = new Int[30]
    PerkOptionIDConjuration = new Int[30]
    PerkOptionIDDestruction = new Int[30]
    PerkOptionIDEnchanting = new Int[30]
    PerkOptionIDIllusion = new Int[30]
    PerkOptionIDRestoration = new Int[30]
    PerkOptionIDMarksman = new Int[30]
    PerkOptionIDAlchemy = new Int[30]
    PerkOptionIDLightArmor = new Int[30]
    PerkOptionIDLockpicking = new Int[30]
    PerkOptionIDPickpocket = new Int[30]
    PerkOptionIDSneak = new Int[30]
    PerkOptionIDSpeechcraft = new Int[30]
    SkillsToggleID = new Int[18]
    AvToggleID = new Int[12]
    ResistsToggleID = new Int[8]
	MultiplicatorsToggleID = new Int[4]
	VariousValuesToggleID = new Int[6]
	ManacostToggleID = new Int[5]
    AvAdded = new Int[3]
endEvent

Event OnOptionSelect(int tid)
    If self.CurrentPage == "$SkillsPage" || self.CurrentPage == ""
        Int i = 0
        While i < SkillsToggleID.Length
            If tid == SkillsToggleID[i]
                String sInput = ((Self as Form) as TestMCMlib).ShowTextInput(statsnames[i], Player.GetBaseAV(stats[i]) as Int)
                If sInput != ""
                    int iInput = sInput as int
                    Player.SetAV(stats[i], iInput)
                    Float OldExp = game.GetPlayerExperience()
                    game.SetPlayerExperience(OldExp)
                    self.SetTextOptionValue(tid, Player.GetBaseAV(stats[i]) as Int, false)
                EndIf
            Endif
            i += 1
        EndWhile
        If tid == LevelToggleID
            String sInput = ((Self as Form) as TestMCMlib).ShowTextInput("$LevelSlid", Player.GetLevel() as Int)
            if sInput != ""
                int iInput = sInput as int
                game.SetPlayerLevel(iInput)
                self.SetTextOptionValue(tid, Player.GetLevel() as Int, false)
            EndIf
        ElseIf tid == PerkpointToggleID
            String sInput = ((Self as Form) as TestMCMlib).ShowTextInput("$PerkPointSlid", game.GetPerkPoints() as Int)
            if sInput != ""
                int iInput = sInput as int
                game.SetPerkPoints(iInput)
                self.SetTextOptionValue(tid, game.GetPerkPoints() as Int, false)
            EndIf
        ElseIf tid == DragonsoulsToggleID
            String sInput = ((Self as Form) as TestMCMlib).ShowTextInput("$DragonsoulslSlid", Player.GetAV("DragonSouls") as Int)
            if sInput != ""
                int iInput = sInput as int
                Player.ModAV("DragonSouls", -Player.GetAV("DragonSouls"))
                Player.ModAV("DragonSouls", iInput)
                self.SetTextOptionValue(tid, Player.GetAV("DragonSouls") as Int, false)
            EndIf
        EndIf
    ElseIf self.CurrentPage == "$ActorValuePage"
        Int i = 0
        While i < AvToggleID.Length
            If  tid == AvToggleID[i]
                If i >= 0 && i < 3
                    String sInput = ((Self as Form) as TestMCMlib).ShowTextInput("$Add", avadded[i] as Int)
                    If sInput != ""
                        int iInput = sInput as int
                        Player.ModAV(avstats[i], -avadded[i])
                        Player.ModAV(avstats[i], iInput)
                        avadded[i] = iInput as Int
                        self.SetTextOptionValue(tid, avadded[i] as Int, false)
                    EndIf
                ElseIf i >= 3 && i < 6
                    String sInput = ((Self as Form) as TestMCMlib).ShowTextInput("$Base", Player.GetBaseAV(avstats[i - 3]) as Int)
                    If sInput != ""
                        int iInput = sInput as int
                        Player.SetAV(avstats[i - 3], sInput as Float)
                        self.SetTextOptionValue(tid, Player.GetAV(avstats[i - 3]) as Int, false)
                    EndIf
                ElseIf i >= 6 && i < 9
                    String sInput = ((Self as Form) as TestMCMlib).ShowTextInput("$BaseRegen", Player.GetAV(avstats[i - 3]) as Int)
                    If sInput != ""
                        Float iInput = sInput as Float
                        Player.ModAV(avstats[i - 3], -Player.GetAV(avstats[i - 3]))
                        Player.ModAV(avstats[i - 3], iInput)
                        self.SetTextOptionValue(tid, Player.GetAV(avstats[i - 3]) as Float, false)
                    EndIf
                ElseIf i >= 9
                    String sInput = ((Self as Form) as TestMCMlib).ShowTextInput("$PercentRegenBonus", Player.GetAV(avstats[i - 3]) as Int)
                    If sInput != ""
                        int iInput = sInput as int
                        Player.ModAV(avstats[i - 3], -Player.GetAV(avstats[i - 3]))
                        Player.ModAV(avstats[i - 3], iInput)
                        self.SetTextOptionValue(tid, Player.GetAV(avstats[i - 3]) as Int, false)
                    EndIf
                EndIf
            EndIf
            i += 1
        EndWhile
        i = 0
        While i < resists.Length
            If tid == ResistsToggleID[i]
                String sInput = ((Self as Form) as TestMCMlib).ShowTextInput(resistsname[i], Player.GetAV(resists[i]) as Int)
                If sInput != ""
                    int iInput = sInput as int
                    Player.ModAV(resists[i], -Player.GetAV(resists[i]))
                    Player.ModAV(resists[i], iInput)
                    self.SetTextOptionValue(tid, Player.GetAV(resists[i]) as Int , false)
                endIf
            EndIf
            i += 1
        Endwhile
				i = 0
        While i < multiplicators.Length
            If tid == MultiplicatorsToggleID[i]
                String sInput = ((Self as Form) as TestMCMlib).ShowTextInput(multiplicatorsname[i], Player.GetAV(multiplicators[i]) as Int)
                If sInput != ""
                    Float iInput = sInput as Float
                    Player.ModAV(multiplicators[i], -Player.GetAV(multiplicators[i]))
                    Player.ModAV(multiplicators[i], iInput)
                    self.SetTextOptionValue(tid, Player.GetAV(multiplicators[i]) as Float , false)
                endIf
            EndIf
            i += 1
        Endwhile
		        i = 0
        While i < variousvalues.Length
            If tid == VariousValuesToggleID[i]
                String sInput = ((Self as Form) as TestMCMlib).ShowTextInput(variousvaluesname[i], Player.GetAV(variousvalues[i]) as Int)
                If sInput != ""
                    Int iInput = sInput as Int
                    Player.ModAV(variousvalues[i], -Player.GetAV(variousvalues[i]))
                    Player.ModAV(variousvalues[i], iInput)
                    self.SetTextOptionValue(tid, Player.GetAV(variousvalues[i]) as Int , false)
                endIf
            EndIf
            i += 1
        Endwhile
		        i = 0
        While i < manacost.Length
            If tid == ManacostToggleID[i]
                String sInput = ((Self as Form) as TestMCMlib).ShowTextInput(manacostname[i], Player.GetAV(manacost[i]) as Int)
                If sInput != ""
                    Int iInput = sInput as Int
                    Player.ModAV(manacost[i], -Player.GetAV(manacost[i]))
                    Player.ModAV(manacost[i], iInput)
                    self.SetTextOptionValue(tid, Player.GetAV(manacost[i]) as Int , false)
                endIf
            EndIf
            i += 1
        Endwhile
    ElseIf self.CurrentPage == "$BlockPage"
        Int i = 0
        While i < aVILists[0].GetSize()
            If tid == PerkOptionIDBlock[i]
                If Player.HasPerk(aVILists[0].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[0].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[0].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[0].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$HeavyArmorPage"
        Int i = 0
        While i < aVILists[1].GetSize()
            If tid == PerkOptionIDHeavyArmor[i]
                If Player.HasPerk(aVILists[1].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[1].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[1].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[1].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$OneHandedPage"
        Int i = 0
        While i < aVILists[2].GetSize()
            If tid == PerkOptionIDOneHanded[i]
                If Player.HasPerk(aVILists[2].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[2].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[2].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[2].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$SmithingPage"
        Int i = 0
        While i < aVILists[3].GetSize()
            If tid == PerkOptionIDSmithing[i]
                If Player.HasPerk(aVILists[3].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[3].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[3].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[3].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$TwoHandedPage"
        Int i = 0
        While i < aVILists[4].GetSize()
            If tid == PerkOptionIDTwoHanded[i]
                If Player.HasPerk(aVILists[4].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[4].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[4].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[4].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$AlterationPage"
        Int i = 0
        While i < aVILists[5].GetSize()
            If tid == PerkOptionIDAlteration[i]
                If Player.HasPerk(aVILists[5].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[5].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[5].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[5].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$ConjurationPage"
        Int i = 0
        While i < aVILists[6].GetSize()
            If tid == PerkOptionIDConjuration[i]
                If Player.HasPerk(aVILists[6].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[6].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[6].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[6].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$DestructionPage"
        Int i = 0
        While i < aVILists[7].GetSize()
            If tid == PerkOptionIDDestruction[i]
                If Player.HasPerk(aVILists[7].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[7].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[7].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[7].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$EnchantingPage"
        Int i = 0
        While i < aVILists[8].GetSize()
            If tid == PerkOptionIDEnchanting[i]
                If Player.HasPerk(aVILists[8].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[8].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[8].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[8].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$IllusionPage"
        Int i = 0
        While i < aVILists[9].GetSize()
            If tid == PerkOptionIDIllusion[i]
                If Player.HasPerk(aVILists[9].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[9].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[9].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[9].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$RestorationPage"
        Int i = 0
        While i < aVILists[10].GetSize()
            If tid == PerkOptionIDRestoration[i]
                If Player.HasPerk(aVILists[10].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[10].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[10].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[10].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$MarksmanPage"
        Int i = 0
        While i < aVILists[11].GetSize()
            If tid == PerkOptionIDMarksman[i]
                If Player.HasPerk(aVILists[11].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[11].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[11].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[11].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$AlchemyPage"
        Int i = 0
        While i < aVILists[12].GetSize()
            If tid == PerkOptionIDAlchemy[i]
                If Player.HasPerk(aVILists[12].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[12].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[12].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[12].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$LightArmorPage"
        Int i = 0
        While i < aVILists[13].GetSize()
            If tid == PerkOptionIDLightArmor[i]
                If Player.HasPerk(aVILists[13].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[13].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[13].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[13].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$LockpickingPage"
        Int i = 0
        While i < aVILists[14].GetSize()
            If tid == PerkOptionIDLockpicking[i]
                If Player.HasPerk(aVILists[14].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[14].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[14].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[14].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$PickpocketPage"
        Int i = 0
        While i < aVILists[15].GetSize()
            If tid == PerkOptionIDPickpocket[i]
                If Player.HasPerk(aVILists[15].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[15].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[15].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[15].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$SneakPage"
        Int i = 0
        While i < aVILists[16].GetSize()
            If tid == PerkOptionIDSneak[i]
                If Player.HasPerk(aVILists[16].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[16].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[16].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[16].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    ElseIf self.CurrentPage == "$SpeechcraftPage"
        Int i = 0
        While i < aVILists[17].GetSize()
            If tid == PerkOptionIDSpeechcraft[i]
                If Player.HasPerk(aVILists[17].GetAt(i) as Perk)
                    Player.RemovePerk(aVILists[17].GetAt(i) as Perk)
                Else
                    Player.AddPerk(aVILists[17].GetAt(i) as Perk)
                Endif
                self.SetToggleOptionValue(tid, Player.HasPerk(aVILists[17].GetAt(i) as Perk) as Bool, false)
            EndIf
            i += 1
        EndWhile
    EndIf
    Int i = 2
    While i < 20
        If Self.CurrentPage == Pages[i] && tid == TakeAllPerkID
            Int j = 0
            While j < aVILists[i - 2].GetSize()
                Player.AddPerk(aVILists[i - 2].GetAt(j) as Perk)
                j += 1
            EndWhile
        EndIf
        self.SetToggleOptionValue(tid, true, false)
        self.ForcePageReset()
        i += 1
    EndWhile
EndEvent

Function UpdatePerkList()
    Int i = 0
    While i < aVILists.Length
        aVILists[i].Revert()
        actorvalueinfo.GetActorValueInfobyName(stats[i]).GetPerkTree(aVILists[i], none, true, true)
        i += 1
    EndWhile
EndFunction