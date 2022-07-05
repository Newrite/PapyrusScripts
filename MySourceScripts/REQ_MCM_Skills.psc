scriptname REQ_MCM_Skills extends SKI_ConfigBase

REQ_AttributeSystem Property data Auto
REQ_MassEffect_PC Property masseffect Auto
Actor Property Player Auto

String Function format_float(Float value, int after_decimal)
	String text = value as String
	Int decimal = StringUtil.Find(text, ".")
	if decimal == -1 
		return text
	elseif decimal + 3 <= StringUtil.GetLength(text)
		return StringUtil.substring(text, 0, decimal +3)
	else
		return text
	endif
EndFunction

Event OnPageReset(String page)
	Int Flag = OPTION_FLAG_NONE
	Int index = -1
	String statename
	String text
	String display
	Float value
	Int floored
	UnloadCustomContent()
    If page == ""
        If pages.length > 0
            LoadCustomContent("Requiem\\MCM_skills_background.dds", 56, 23)
        Else
            LoadCustomContent("Requiem\\MCM_background_warning.dds", 56, 23)
        Endif
	ElseIf page == "$REQ_cat_skill0" 
		;=======================================================================
		;resistance etc overview
		;=======================================================================
		SetTitleText("$REQ_cat_skill0_header")
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		;resistances
		SetCursorPosition(0)
		AddHeaderOption("$REQ_overviewheader_0")
		AddTextOptionST("DiseaseResist", "$REQ_DiseaseResist", player.getAV("DiseaseResist") as Int + "%")
		AddTextOptionST("PoisonResist", "$REQ_PoisonResist", player.getAV("PoisonResist") as Int + "%")
		AddTextOptionST("MagicResist", "$REQ_MagicResist", player.getAV("MagicResist") as Int + "%")
		AddTextOptionST("FireResist", "$REQ_FireResist", player.getAV("FireResist") as Int + "%")
		AddTextOptionST("FrostResist", "$REQ_FrostResist", player.getAV("FrostResist") as Int + "%")
		AddTextOptionST("ElectricResist", "$REQ_ElectricResist", player.getAV("ElectricResist") as Int + "%")
		AddTextOptionST("AbsorbChance", "$REQ_AbsorbChance", player.getAV("AbsorbChance") as Int + "%")

		;movement
		AddHeaderOption("$REQ_overviewheader_2")
		AddTextOptionST("SpeedMult", "$REQ_SpeedMult", player.getAV("SpeedMult") as Int + "%")
		value = player.getAV("MovementNoiseMult") * 100
		If value < 0.0
			value = 0.0
		EndIf
		AddTextOptionST("MovementNoiseMult", "$REQ_MovementNoiseMult", value as Int + "%")
		
		;regeneration rates		
		SetCursorPosition(1)
		AddHeaderOption("$REQ_overviewheader_1")
		value = player.getAV("HealRate") * player.getAV("HealRateMult") / 100
		floored = Math.floor(value)
		value = (value - floored) * 10
		if floored < 0
			floored = 0
			value = 0.0
		endif
		AddTextOptionST("HealRate", "$REQ_HealRateMult", floored + "." + value as Int + "%/sec")
		value = player.getAV("MagickaRate") * player.getAV("MagickaRateMult") / 100
		floored = Math.floor(value)
		value = (value - floored) * 10
		if floored < 0
			floored = 0
			value = 0.0
		endif
		AddTextOptionST("MagickaRate", "$REQ_MagickaRateMult", floored + "." + value as Int + "%/sec")
		value = player.getAV("StaminaRate") * player.getAV("StaminaRateMult") / 100
		floored = Math.floor(value)
		value = (value - floored) * 10
		if floored < 0
			floored = 0
			value = 0.0
		endif
		AddTextOptionST("StaminaRate", "$REQ_StaminaRateMult", floored + "." + value as Int + "%/sec")
		
		;mass effect core variables
		AddHeaderOption("$REQ_overviewheader_3")
		statename = "MassTotal"
		text = "$REQ_MassTotal"
		display = format_float(player.getAV("Mass"), 2)
		AddTextOptionST(statename, text, display)
		statename = "MassPenalty"
		text = "$REQ_MassPenalty"
		display = format_float(player.getAV("Infamy"), 2)
		AddTextOptionST(statename, text, display)
		statename = "MassEffect"
		text = "$REQ_MassEffect"
		display = format_float(masseffect.mod_mass, 2)
		AddTextOptionST(statename, text, display)
		statename = "MassEffectPenalty"
		text = "$REQ_MassEffectPenalty"
		display = format_float(masseffect.mod_penalty, 2)
		AddTextOptionST(statename, text, display)

		;combat
		AddHeaderOption("$REQ_overviewheader_4")
		AddTextOptionST("CritDamage", "$OneHandedSkillAdvance", player.getAV("OneHandedSkillAdvance") as Int + "%")
		AddTextOptionST("CritChance", "$TwoHandedSkillAdvance", player.getAV("TwoHandedSkillAdvance") as Int + "%")
		AddTextOptionST("EnchReduceCost", "$ConjurationSkillAdvance", player.getAV("ConjurationSkillAdvance") as Int + "%")
		AddTextOptionST("EnchDamageBust", "$DestructionSkillAdvance", player.getAV("DestructionSkillAdvance") as Int + "%")
		AddTextOptionST("ShoutResist", "$SmithingSkillAdvance", player.getAV("SmithingSkillAdvance") as Int + "%")
		
    ElseIf page == "$REQ_cat_skill1" 
		;=======================================================================
		;derived stats bonuses
		;=======================================================================
		SetTitleText("$REQ_cat_skill1_header")
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		SetCursorPosition(0)
		;========================
		;
		;========================
		AddHeaderOption("$REQ_skillheader_0") ; Бонусы Стамины
		; Скорость
		index = data.derived.find("SpeedMult")
		AddTextOptionST("SpeedMult_bonus", "$REQ_SpeedMult", "+" + data.modifiers[index] as Int + "%")
		; Скорость атаки
		index = data.derived.find("WeaponSpeedMult") ;
		AddTextOptionST("WeaponSpeedMult_bonus", "$REQ_WeaponSpeedMult", "+" + (data.modifiers[index] * 100) as Int + "%")
		; Урон оружием
		index = data.derived.find("OneHandedPowerMod")
		AddTextOptionST("OneHandedPowerMod", "$REQ_OneHandedPowerMod", "+" + data.modifiers[index] as Int + "%")
		; Реген запаса сил
		index = data.derived.find("StaminaRateMult")
		AddTextOptionST("StaminaRateMult_bonus", "$REQ_StaminaRateMult", "+" + data.modifiers[index] as Int + "%")
		;========================
		;
		;========================
		AddHeaderOption("$REQ_skillheader_1") ; Бонусы Здоровья 
		;Переносимый вес
		index = data.derived.find("CarryWeight")
		AddTextOptionST("CarryWeight", "$REQ_CarryWeight", "+" + data.modifiers[index] as Int )
		;Резист к яду
		index = data.derived.find("PoisonResist") ; Сопротивление яду
		AddTextOptionST("PoisonResist_bonus", "$REQ_PoisonResist", "+" + data.modifiers[index] as Int + "%")
		;удешевление силовых атак
		index = data.derived.find("MarksmanSkillAdvance") ; Дешевле силовые атаки
		AddTextOptionST("MarksmanSkillAdvance_bonus", "$MarksmanSkillAdvance", "+" + data.modifiers[index] as Int + "%")
		;Регенерации здоровья
		index = data.derived.find("HealRateMult") ;Регенерации здоровья
		AddTextOptionST("HealRateMult_bonus", "$HealRateMult", "+" + data.modifiers[index] as Int + "%")
		;========================
		;
		;========================
		SetCursorPosition(1)
		AddHeaderOption("$REQ_skillheader_2") ; Бонусы Маны
		;Сопротивления магии
		index = data.derived.find("MagicResist")
		AddTextOptionST("MagicResist_bonus", "$REQ_MagicResist", "+" + data.modifiers[index] as Int + "%")
		;Снижения манакоста всех школ магии
		index = data.derived.find("RestorationMod")
		AddTextOptionST("RestorationMod_bonus", "$RestorationMod", "+" + data.modifiers[index] as Int + "%")
		;Снижение скорости расхода чар в снаряжении
		index = data.derived.find("ConjurationSkillAdvance")
		AddTextOptionST("ConjurationSkillAdvance_bonus", "$ConjurationSkillAdvance", "+" + data.modifiers[index] as Int + "%")	
		;Регенерации магии
		index = data.derived.find("MagickaRateMult")
		AddTextOptionST("MagickaRateMult_bonus", "$REQ_MagickaRateMult", "+" + data.modifiers[index] as Int + "%")
		; rescale value because the base line value is set to 1.5 in REQ_AttributeSystem
		;AddHeaderOption("$REQ_skillheader_3")
		;AddTextOptionST("WordsLearned", "$REQ_WordsLearned", "+" + (-data.Mods_Shout[1]/1.5*100) as Int + "%")
		;AddTextOptionST("WordsUnlocked", "$REQ_WordsUnlocked", "+" + (-data.Mods_Shout[2]/1.5*100) as Int + "%")
		;AddTextOptionST("TimesShouted", "$REQ_TimesShouted", "+" + (-data.Mods_Shout[0]/1.5*100) as Int + "%")

    ElseIf page == "$REQ_cat_skill_expertise"
        ;=======================================================================
        ;derived stats bonuses
        ;=======================================================================
        SetTitleText("$REQ_cat_skill_expertise_header")
        SetCursorFillMode(LEFT_TO_RIGHT)

        SetCursorPosition(0)
        AddHeaderOption("$REQ_expertise_header_combat")
        AddHeaderOption("")
        AddTextOptionST("Expertise_OneHanded", "$REQ_expertise_onehanded", player.getAV("OneHandedMod") as Int)
        AddTextOptionST("Expertise_TwoHanded", "$REQ_expertise_twohanded", player.getAV("TwoHandedMod") as Int)
        AddTextOptionST("Expertise_Marksman", "$REQ_expertise_marksman", player.getAV("MarksmanMod") as Int)
		AddTextOptionST("Expertise_Block", "$REQ_expertise_block", player.getAV("BlockMod") as Int)

        SetCursorPosition(7)
        AddHeaderOption("$REQ_expertise_header_rogue")
        AddHeaderOption("")
        AddTextOptionST("Expertise_Lockpicking", "$REQ_expertise_lockpicking", player.getAV("LockpickingMod") as Int)
    EndIf
EndEvent

;===============================================================================
;stats overview menu highlights
;===============================================================================

;===============================================================================
;resistances
;===============================================================================

State DiseaseResist
	Event OnHighlightST()
        SetInfoText("$REQ_DiseaseResist_highlight")
    EndEvent
EndState

State PoisonResist
	Event OnHighlightST()
        SetInfoText("$REQ_PoisonResist_highlight")
    EndEvent
EndState

State MagicResist
	Event OnHighlightST()
        SetInfoText("$REQ_MagicResist_highlight")
    EndEvent
EndState

State FireResist
	Event OnHighlightST()
        SetInfoText("$REQ_FireResist_highlight")
    EndEvent
EndState

State FrostResist
	Event OnHighlightST()
        SetInfoText("$REQ_FrostResist_highlight")
    EndEvent
EndState

State ElectricResist
	Event OnHighlightST()
        SetInfoText("$REQ_ElectricResist_highlight")
    EndEvent
EndState

State AbsorbChance
	Event OnHighlightST()
        SetInfoText("$REQ_AbsorbChance_highlight")
    EndEvent
EndState

;===============================================================================
;combat
;===============================================================================

State CritDamage
	Event OnHighlightST()
        SetInfoText("$REQ_OneHandedSkillAdvance_highlight")
    EndEvent
EndState

State CritChance
	Event OnHighlightST()
        SetInfoText("$REQ_TwoHandedSkillAdvance_highlight")
    EndEvent
EndState

State EnchReduceCost
	Event OnHighlightST()
        SetInfoText("$REQ_ConjurationSkillAdvance_highlight")
    EndEvent
EndState

State EnchDamageBust
	Event OnHighlightST()
        SetInfoText("$REQ_DestructionSkillAdvance_highlight")
    EndEvent
EndState

State ShoutResist
	Event OnHighlightST()
        SetInfoText("$REQ_SmithingSkillAdvance_highlight")
    EndEvent
EndState

;===============================================================================
;movement related stuff
;===============================================================================

State SpeedMult
	Event OnHighlightST()
        SetInfoText("$REQ_SpeedMult_highlight")
    EndEvent
EndState

State MovementNoiseMult
	Event OnHighlightST()
        SetInfoText("$REQ_MovementNoiseMult_highlight")
    EndEvent
EndState

;===============================================================================
;regeneration rates
;===============================================================================

State HealRate
	Event OnHighlightST()
        SetInfoText("$REQ_HealRateMult_highlight")
    EndEvent
EndState
State MagickaRate
	Event OnHighlightST()
        SetInfoText("$REQ_MagickaRateMult_highlight")
    EndEvent
EndState

State StaminaRate
	Event OnHighlightST()
        SetInfoText("$REQ_StaminaRateMult_highlight")
    EndEvent
EndState

;===============================================================================
;mass effect core variables
;===============================================================================

State MassTotal
	Event OnHighlightST()
        SetInfoText("$REQ_MassTotal_highlight")
    EndEvent
EndState

State MassPenalty
	Event OnHighlightST()
        SetInfoText("$REQ_MassPenalty_highlight")
    EndEvent
EndState

State MassEffect
	Event OnHighlightST()
        SetInfoText("$REQ_MassEffect_highlight")
    EndEvent
EndState

State MassEffectPenalty
	Event OnHighlightST()
        SetInfoText("$REQ_MassEffectPenalty_highlight")
    EndEvent
EndState

;===============================================================================
;derived stats menu highlights
;===============================================================================

;===============================================================================
;resistances
;===============================================================================

State DiseaseResist_bonus
	Event OnHighlightST()
        SetInfoText("$REQ_DiseaseResist_bonus_highlight")
    EndEvent
EndState

State PoisonResist_bonus
	Event OnHighlightST()
        SetInfoText("$REQ_PoisonResist_bonus_highlight")
    EndEvent
EndState

State MagicResist_bonus
	Event OnHighlightST()
        SetInfoText("$REQ_MagicResist_bonus_highlight")
    EndEvent
EndState
State RestorationMod_bonus
	Event OnHighlightST()
        SetInfoText("$RestorationMod_bonus")
    EndEvent
EndState
State ConjurationSkillAdvance_bonus
	Event OnHighlightST()
        SetInfoText("$ConjurationSkillAdvance_bonus")
    EndEvent
EndState

State MarksmanSkillAdvance_bonus
	Event OnHighlightST()
        SetInfoText("$MarksmanSkillAdvance_bonus_highlight")
    EndEvent
EndState
State HealRateMult_bonus
	Event OnHighlightST()
        SetInfoText("$HealRateMult_bonus")
    EndEvent
EndState
;===============================================================================
;regeneration and conditioning
;===============================================================================

State MagickaRateMult_bonus
	Event OnHighlightST()
        SetInfoText("$REQ_MagickaRateMult_bonus_highlight")
    EndEvent
EndState

State StaminaRateMult_bonus
	Event OnHighlightST()
        SetInfoText("$REQ_StaminaRateMult_bonus_highlight")
    EndEvent
EndState

State CarryWeight
	Event OnHighlightST()
        SetInfoText("$REQ_CarryWeight_highlight")
    EndEvent
EndState

State SpeedMult_bonus
	Event OnHighlightST()
        SetInfoText("$REQ_SpeedMult_bonus_highlight")
    EndEvent
EndState

State WeaponSpeedMult_bonus
	Event OnHighlightST()
        SetInfoText("$REQ_WeaponSpeedMult_bonus_highlight")
    EndEvent
EndState
;===============================================================================
;damage
;===============================================================================

State UnarmedDamage
	Event OnHighlightST()
        SetInfoText("$REQ_UnarmedDamage_highlight")
    EndEvent
EndState

State OneHandedPowerMod
	Event OnHighlightST()
        SetInfoText("$REQ_OneHandedPowerMod_highlight")
    EndEvent
EndState

State TwoHandedPowerMod
	Event OnHighlightST()
        SetInfoText("$REQ_TwoHandedPowerMod_highlight")
    EndEvent
EndState

State MarksmanPowerMod
	Event OnHighlightST()
        SetInfoText("$REQ_MarksmanPowerMod_highlight")
    EndEvent
EndState

;===============================================================================
;shouts
;===============================================================================

State WordsLearned
	Event OnHighlightST()
        SetInfoText("$REQ_WordsLearned_highlight")
    EndEvent
EndState

State WordsUnlocked
	Event OnHighlightST()
        SetInfoText("$REQ_WordsUnlocked_highlight")
    EndEvent
EndState

State TimesShouted
	Event OnHighlightST()
        SetInfoText("$REQ_TimesShouted_highlight")
    EndEvent
EndState

;===============================================================================
; Expertise explanations
;===============================================================================

State Expertise_OneHanded
	Event OnHighlightST()
        SetInfoText("$REQ_expertise_onehanded_highlight")
    EndEvent
EndState

State Expertise_TwoHanded
	Event OnHighlightST()
        SetInfoText("$REQ_expertise_twohanded_highlight")
    EndEvent
EndState

State Expertise_Marksman
	Event OnHighlightST()
        SetInfoText("$REQ_expertise_marksman_highlight")
    EndEvent
EndState

State Expertise_Block
	Event OnHighlightST()
        SetInfoText("$REQ_expertise_block_highlight")
    EndEvent
EndState

State Expertise_Lockpicking
	Event OnHighlightST()
        SetInfoText("$REQ_expertise_lockpicking_highlight")
    EndEvent
EndState