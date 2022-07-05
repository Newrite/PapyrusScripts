Scriptname zzzSXPMonitorMagicEffectAlias Extends ReferenceAlias
;=============================================================;
;Basic Properties
;=============================================================;
Actor Property PlayerREF Auto
zzzSXPConfig Property XPConfig Auto
FormList Property zzzSXPCurrentMagicEffectFormList Auto
;=============================================================;
;Very Important Properties (VIP's)
;=============================================================;
float[] Property SXPMagicEffect Auto Hidden
float[] Property SXPMagicEffectGeneral Auto Hidden
;=============================================================;
;Generators
;=============================================================;
int[] ModSeparator
int[] FormID
string[] Modname
string[] Filename
string[] MagicEffectSkillEffectsBase
string[] MagicEffectSkillEffects
string[] EDID
float[] MagicEffectMagnitudeBase
float[] MagicEffectMagnitudeDefaultBase
;=============================================================;
;Compatibility Variables
;=============================================================;
string[] CompatibilityCheckNames
bool[] CompatibilityCheck
string ChangeMonitor
;=============================================================;
;Magic Effect Variables
;=============================================================;
float[] SXPMagicEffectBonusBase
Form[] PossibleMagicEffects
Form[] CurrentMagicEffects
int[] PossibleMagicEffectsIndex
int CurrentNumberofMagicEffects

State Empty
Event OnBeginState()
	XPConfig.SXPMagicEffectBonus = Utility.CreateFloatArray(18, 1.0)
	XPConfig.SXPMagicEffectBonusString = Utility.CreateStringArray(18, "[0%]")
	SXPMagicEffectBonusBase = Utility.CreateFloatArray(18, 1.0)
	XPConfig.UpdateSkills()
EndEvent
EndState

State Running
Event OnBeginState()
	int i = 0
	int ie = zzzSXPCurrentMagicEffectFormList.GetSize()
	CurrentNumberofMagicEffects = 0
	if ie > 0
		While i < ie
			MagicEffect akEffect = zzzSXPCurrentMagicEffectFormList.GetAt(i) as MagicEffect
			bool HasThisMagicEffect = PlayerREF.HasMagicEffect(akEffect)
			if !HasThisMagicEffect
				zzzSXPCurrentMagicEffectFormList.RemoveAddedForm(akEffect)
			else
				int iIndex = PossibleMagicEffects.Find(akEffect)
				if iIndex >= 0
					CurrentNumberofMagicEffects += 1
					SetProperSkillAdjustments(iIndex)
				endif
			endif
			i += 1
		EndWhile
	endif
	if CurrentNumberofMagicEffects > 0
		CurrentMagicEffects = zzzSXPCurrentMagicEffectFormList.ToArray()
		OnUpdate()
	else
		zzzSXPCurrentMagicEffectFormList.Revert()
		CurrentMagicEffects = zzzSXPCurrentMagicEffectFormList.ToArray()
	endif
EndEvent

Event OnPlayerLoadGame()
	CompatibilityCheck()
EndEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	UnregisterForUpdate()
	int i = PossibleMagicEffects.Find(akEffect)
	if i >= 0
		if !zzzSXPCurrentMagicEffectFormList.HasForm(akEffect)
			zzzSXPCurrentMagicEffectFormList.AddForm(akEffect)
			CurrentMagicEffects = zzzSXPCurrentMagicEffectFormList.ToArray()
			CurrentNumberofMagicEffects += 1
			SetProperSkillAdjustments(i)
		endif
	endif
	if CurrentNumberofMagicEffects > 0
		OnUpdate()
	endif
EndEvent

Event OnUpdate()
	int i = 0
	int ie = CurrentMagicEffects.Length
	While i < ie
		MagicEffect akEffect = CurrentMagicEffects[i] as MagicEffect
		bool HasThisMagicEffect = PlayerREF.HasMagicEffect(akEffect)
		if !HasThisMagicEffect
			if zzzSXPCurrentMagicEffectFormList.HasForm(akEffect)
				zzzSXPCurrentMagicEffectFormList.RemoveAddedForm(akEffect)
			endif
			int iIndex = PossibleMagicEffects.Find(akEffect)
			CurrentNumberofMagicEffects -= 1
			SetProperSkillAdjustments(iIndex, "Subtract")
		endif
		i += 1
	EndWhile
	
	if CurrentNumberofMagicEffects > 0
		CurrentMagicEffects = zzzSXPCurrentMagicEffectFormList.ToArray()
		RegisterForSingleUpdate(SXPMagicEffectGeneral[0])
	else
		zzzSXPCurrentMagicEffectFormList.Revert()
		CurrentMagicEffects = zzzSXPCurrentMagicEffectFormList.ToArray()
	endif
EndEvent

Event OnEndState()
	UnregisterForUpdate()
EndEvent
EndState

Function SetProperSkillAdjustments(int Index, string Operation = "Addition")
	string sSkill = MagicEffectSkillEffects[Index]
	float fAmount = SXPMagicEffect[Index]
	if sSkill == "All"
		sSkill = "0123456789#01234567"
	elseif sSkill == "Warrior"
		sSkill = "01234"
	elseif sSkill == "Mage"
		sSkill = "56789#0"
	elseif sSkill == "Thief"
		sSkill = "#1234567"
	endif
	int i = 0
	int ie = StringUtil.GetLength(sSkill)
	int iPosNeg = 0
	int Skill = 0
	While i < ie
		string PreInt = StringUtil.GetNthChar(sSkill, i)
		if PreInt == "#"
			Skill = 10
		else
			int iSkill = Skill + (PreInt as int)
			if Operation == "Subtract"
				fAmount = (fAmount * -1.0)
			endif			
			SXPMagicEffectBonusBase[iSkill] = SXPMagicEffectBonusBase[iSkill] + fAmount
			if CurrentNumberofMagicEffects == 0
				SXPMagicEffectBonusBase[iSkill]  = 1.0
			endif
			float fCurrent = SXPMagicEffectBonusBase[iSkill]
			float fMin = (1.0 + SXPMagicEffectGeneral[1])
			float fMax = (1.0 + SXPMagicEffectGeneral[2])
			if fCurrent < fMin
				XPConfig.SXPMagicEffectBonus[iSkill] = fMin
			elseif fCurrent > fMax
				XPConfig.SXPMagicEffectBonus[iSkill] = fMax
			else
				XPConfig.SXPMagicEffectBonus[iSkill] = SXPMagicEffectBonusBase[iSkill]
			endif
			XPConfig.UpdateSpecificSkill(iSkill)
			float PosNeg = 1.0 - XPConfig.SXPMagicEffectBonus[iSkill]
			string Prefix = ""
			if PosNeg < 0.0
				Prefix = "+["
				PosNeg = (PosNeg * 100.0) * -1.0
			elseif PosNeg > 0.0
				Prefix = "-["
				PosNeg = (PosNeg * 100.0)
			elseif PosNeg == 0.0
				Prefix = "["
			endif
			iPosneg = Math.Floor((PosNeg * 10) + 0.5) / 10 as int
			XPConfig.SXPMagicEffectBonusString[iSkill] = Prefix + iPosneg + "%]"
		endif
		i += 1
	EndWhile
EndFunction

string Function SetHLString(int Index)
	string sSkill = MagicEffectSkillEffectsBase[Index]
	int iAmount = (MagicEffectMagnitudeBase[Index] * 100) as int
	if sSkill == "All"
		return "$MagicEffect_HL_All{\n"+"}{" + iAmount + "%}"
	elseif sSkill == "Warrior"
		return "$MagicEffect_HL_Warrior{\n"+"}{" + iAmount + "%}"
	elseif sSkill == "Mage"
		return "$MagicEffect_HL_Mage{\n"+"}{" + iAmount + "%}"
	elseif sSkill == "Thief"
		return "$MagicEffect_HL_Thief{\n"+"}{" + iAmount + "%}"
	endif
	int i = 0
	int ie = StringUtil.GetLength(sSkill)
	int Skill = 0
	string HLString = ""
	While i < ie
		string PreInt = StringUtil.GetNthChar(sSkill, i)
		if PreInt == "#"
			Skill = 10
		else
			int iSkill = Skill + (PreInt as int)
			ActorValueInfo aVI = ActorValueInfo.GetActorValueInfobyName(XPConfig.GetSkillString(iSkill))
			string sSkillName = aVI.GetName()
			if i == (ie - 1)
				HLString = HLString + " " + sSkillName + "."
			else
				HLString = HLString + " " + sSkillName + ","
			endif
		endif
		i += 1
	EndWhile
	
	return "$MagicEffect_HL_Generic{" + HLString + "}{\n"+"}{" + iAmount + "%}"
EndFunction

Function UpdateSkillEffects(bool Update = True, int Index = 0)
	if GetState() != "Empty"
		GoToState("Empty")
	endif
	
	if Update
		int i = PossibleMagicEffectsIndex[Index]
		MagicEffectMagnitudeBase[i] = SXPMagicEffect[Index]
	endif
	
	if SXPMagicEffectGeneral[0] > 0.0
		GoToState("Running")
	endif
EndFunction

Function MenugeneratorFloat(string sMod, string sSaveLoad, string sFilename)
	XPConfig.MenugeneratorFloat(sMod, sSaveLoad, MagicEffectMagnitudeBase.Length, EDID, MagicEffectMagnitudeBase, sFilename)
	if sSaveLoad == "Load"
		int i = 0
		int ie = SXPMagicEffect.Length
		While i < ie
			int iBase = PossibleMagicEffectsIndex[i]
			SXPMagicEffect[i] = MagicEffectMagnitudeBase[iBase]
			i += 1
		EndWhile
	endif
EndFunction

Function SetDefaultValuesMagicEffect()
	ChangeMonitor = ""
	CurrentNumberofMagicEffects = 0
	
	ModSeparator = new int[5]
	ModSeparator[0] = 7
	ModSeparator[1] = 1
	ModSeparator[2] = 5
	ModSeparator[3] = 3
	ModSeparator[4] = 1

	Modname = new string[5]
	Modname[0] = "Skyrim"
	Modname[1] = "USLEEP"
	Modname[2] = "RND"
	Modname[3] = "iNeed"
	Modname[4] = "Herbal Tea"

	CompatibilityCheckNames = new string[5]
	CompatibilityCheckNames[0] = "Skyrim.esm"
	CompatibilityCheckNames[1] = "Unofficial Skyrim Legendary Edition Patch.esp"
	CompatibilityCheckNames[2] = "RealisticNeedsandDiseases.esp"
	CompatibilityCheckNames[3] = "iNeed.esp"
	CompatibilityCheckNames[4] = "HerbalTea.esp"

	FormID = new int[17]
	FormID[0] = 0x000E5F4B
	FormID[1] = 0x000E5F48
	FormID[2] = 0x000E5F44
	FormID[3] = 0x000E5F59
	FormID[4] = 0x0010D968
	FormID[5] = 0x0010D96B
	FormID[6] = 0x0010D96C
	FormID[7] = 0x000028C6
	FormID[8] = 0x00010677
	FormID[9] = 0x00009A64
	FormID[10] = 0x0000337D
	FormID[11] = 0x0000337E
	FormID[12] = 0x0000337F
	FormID[13] = 0x000012D5
	FormID[14] = 0x000012D6
	FormID[15] = 0x000012D7
	FormID[16] = 0x00003E1E

	Filename = new string[17]
	Filename[0] = "Skyrim.esm"
	Filename[1] = "Skyrim.esm"
	Filename[2] = "Skyrim.esm"
	Filename[3] = "Skyrim.esm"
	Filename[4] = "Skyrim.esm"
	Filename[5] = "Skyrim.esm"
	Filename[6] = "Skyrim.esm"
	Filename[7] = "Unofficial Skyrim Legendary Edition Patch.esp"
	Filename[8] = "RealisticNeedsandDiseases.esp"
	Filename[9] = "RealisticNeedsandDiseases.esp"
	Filename[10] = "RealisticNeedsandDiseases.esp"
	Filename[11] = "RealisticNeedsandDiseases.esp"
	Filename[12] = "RealisticNeedsandDiseases.esp"
	Filename[13] = "iNeed.esp"
	Filename[14] = "iNeed.esp"
	Filename[15] = "iNeed.esp"
	Filename[16] = "HerbalTea.esp"

	MagicEffectSkillEffectsBase = new string[17]
	MagicEffectSkillEffectsBase[0] = "Warrior"
	MagicEffectSkillEffectsBase[1] = "Mage"
	MagicEffectSkillEffectsBase[2] = "Thief"
	MagicEffectSkillEffectsBase[3] = "All"
	MagicEffectSkillEffectsBase[4] = "All"
	MagicEffectSkillEffectsBase[5] = "All"
	MagicEffectSkillEffectsBase[6] = "All"
	MagicEffectSkillEffectsBase[7] = "#7"
	MagicEffectSkillEffectsBase[8] = "All"
	MagicEffectSkillEffectsBase[9] = "All"
	MagicEffectSkillEffectsBase[10] = "All"
	MagicEffectSkillEffectsBase[11] = "All"
	MagicEffectSkillEffectsBase[12] = "All"
	MagicEffectSkillEffectsBase[13] = "All"
	MagicEffectSkillEffectsBase[14] = "All"
	MagicEffectSkillEffectsBase[15] = "All"
	MagicEffectSkillEffectsBase[16] = "All"

	MagicEffectMagnitudeBase = new float[17]
	MagicEffectMagnitudeBase[0] = -0.20
	MagicEffectMagnitudeBase[1] = -0.20
	MagicEffectMagnitudeBase[2] = -0.20
	MagicEffectMagnitudeBase[3] = -0.15
	MagicEffectMagnitudeBase[4] = -0.05
	MagicEffectMagnitudeBase[5] = -0.10
	MagicEffectMagnitudeBase[6] = -0.15
	MagicEffectMagnitudeBase[7] = -0.15
	MagicEffectMagnitudeBase[8] = 0.25
	MagicEffectMagnitudeBase[9] = 0.50
	MagicEffectMagnitudeBase[10] = 0.25
	MagicEffectMagnitudeBase[11] = 0.50
	MagicEffectMagnitudeBase[12] = 0.75
	MagicEffectMagnitudeBase[13] = 0.20
	MagicEffectMagnitudeBase[14] = 0.40
	MagicEffectMagnitudeBase[15] = 0.80
	MagicEffectMagnitudeBase[16] = -0.15

	EDID = new string[17]
	EDID[0] = "$MagicEffect_Skyrim_doomWarriorEffect"
	EDID[1] = "$MagicEffect_Skyrim_doomMageEffect"
	EDID[2] = "$MagicEffect_Skyrim_doomThiefEffect"
	EDID[3] = "$MagicEffect_Skyrim_doomLoverEffect"
	EDID[4] = "$MagicEffect_Skyrim_RestedSkillEffect"
	EDID[5] = "$MagicEffect_Skyrim_RestedWellSkillEffect"
	EDID[6] = "$MagicEffect_Skyrim_RestedMarriageSkillEffect"
	EDID[7] = "$MagicEffect_USLEEP_USKPMS05RewardEffect"
	EDID[8] = "$MagicEffect_RND_DiseaseWitbaneStage1Effect"
	EDID[9] = "$MagicEffect_RND_DiseaseWitbaneStage2Effect"
	EDID[10] = "$MagicEffect_RND_SleepEffect02"
	EDID[11] = "$MagicEffect_RND_SleepEffect03"
	EDID[12] = "$MagicEffect_RND_SleepEffect04"
	EDID[13] = "$MagicEffect_iNeed_SNDmgFatigueFX1"
	EDID[14] = "$MagicEffect_iNeed_SNDmgFatigueFX2"
	EDID[15] = "$MagicEffect_iNeed_SNDmgFatigueFX3"
	EDID[16] = "$MagicEffect_Herbal Tea_LHTAlchSkillrate"

	MagicEffectMagnitudeDefaultBase = new float[17]
	
	int i = 0
	int ie = MagicEffectMagnitudeDefaultBase.Length
	While i < ie
		MagicEffectMagnitudeDefaultBase[i] = MagicEffectMagnitudeBase[i]
		i += 1
	EndWhile
	
	SXPMagicEffectGeneral = new float[3]
	SXPMagicEffectGeneral[0] = 1.0
	SXPMagicEffectGeneral[1] = -0.75
	SXPMagicEffectGeneral[2] = 2.0
	
	CompatibilityCheck()
EndFunction

Function CompatibilityCheck()
	CompatibilityCheck = new bool[5]
	int ModCount = 0

	string ChangeGetter = ""
	int i = 0
	int ie = CompatibilityCheckNames.Length
	While i < ie
		int Decider = Game.GetModByName(CompatibilityCheckNames[i])
		if Decider != 255
			CompatibilityCheck[i] = True
			ModCount += 1
			ChangeGetter = ChangeGetter + "1"
		else
			ChangeGetter = ChangeGetter + "0"
		endif
		i += 1
	EndWhile
	if ChangeGetter != ChangeMonitor
		ChangeMonitor = ChangeGetter
		SetFormArray(ModCount)
	endif
EndFunction

Function SetFormArray(int ModCount)	
	int iSeparator = 0
	int iRepeat = 0
	int iIndex = 0
	int iModCount = 0
	int i = 0
	int ie = FormID.Length
	PossibleMagicEffects = Utility.CreateFormArray(ie)
	PossibleMagicEffectsIndex = Utility.CreateIntArray(ie)
	string[] MagicEffectHeaderStrings = Utility.CreateStringArray(Modname.Length)
	int[] MagicEffectHeaderIndex = Utility.CreateIntArray(ModSeparator.Length)
	string[] MagicEffectStrings = Utility.CreateStringArray(ie)
	string[] MagicEffectHLStrings = Utility.CreateStringArray(ie)
	MagicEffectSkillEffects = Utility.CreateStringArray(ie)
	SXPMagicEffect = Utility.CreateFloatArray(ie)
	float[] MagicEffectDefault = Utility.CreateFloatArray(ie)
		While i < ie
			if CompatibilityCheck[iSeparator]
				MagicEffectHeaderStrings[iModCount] = Modname[iSeparator]
				if iModCount == 0
					MagicEffectHeaderIndex[iModCount] = 0
				endif
				if (iModCount + 1) < ModCount
					MagicEffectHeaderIndex[iModCount + 1] = MagicEffectHeaderIndex[iModCount] + ModSeparator[iSeparator]
				endif
				iModCount += 1
				While iRepeat < ModSeparator[iSeparator]	
					PossibleMagicEffects[iIndex] = Game.GetFormFromFile(FormID[i], Filename[i])
					PossibleMagicEffectsIndex[iIndex] = i
					MagicEffectStrings[iIndex] = PossibleMagicEffects[iIndex].GetName()
					MagicEffectHLStrings[iIndex] = SetHLString(i)
					MagicEffectSkillEffects[iIndex] = MagicEffectSkillEffectsBase[i]
					SXPMagicEffect[iIndex] = MagicEffectMagnitudeBase[i]
					MagicEffectDefault[iIndex] = MagicEffectMagnitudeDefaultBase[i]
					iRepeat += 1
					iIndex += 1
					i += 1
				EndWhile
			else
				i += ModSeparator[iSeparator]
			endif
			iRepeat = 0
			iSeparator += 1
		EndWhile
		
	Utility.ResizeFormArray(PossibleMagicEffects, iIndex)
	Utility.ResizeIntArray(PossibleMagicEffectsIndex, iIndex)
	Utility.ResizeStringArray(MagicEffectHeaderStrings, iModCount)
	Utility.ResizeIntArray(MagicEffectHeaderIndex, iModCount)
	Utility.ResizeStringArray(MagicEffectStrings, iIndex)
	Utility.ResizeStringArray(MagicEffectHLStrings, iIndex)
	Utility.ResizeFloatArray(SXPMagicEffect, iIndex)
	Utility.ResizeFloatArray(MagicEffectDefault, iIndex)
	
	XPConfig.SetDefaultValuesMagicEffect(iIndex, MagicEffectDefault, MagicEffectHeaderStrings, MagicEffectHeaderIndex, MagicEffectStrings, MagicEffectHLStrings)
	UpdateSkillEffects(False)
EndFunction