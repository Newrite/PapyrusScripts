scriptName REQ_MCM_Skills extends SKI_ConfigBase

req_attributesystem property data auto
req_masseffect_pc property masseffect auto
actor property Player auto

String function format_float(Float value, Int after_decimal)

	String text = value as String
	Int decimal = stringutil.Find(text, ".", 0)
	if decimal == -1
		return text
	elseIf decimal + 3 <= stringutil.GetLength(text)
		return stringutil.substring(text, 0, decimal + 3)
	else
		return text
	endIf
endFunction

function OnPageReset(String page)

	Int Flag = self.OPTION_FLAG_NONE
	Int index = -1
	self.UnloadCustomContent()
	if page == ""
		if Pages.length > 0
			self.LoadCustomContent("Requiem\\MCM_skills_background.dds", 56 as Float, 23 as Float)
		else
			self.LoadCustomContent("Requiem\\MCM_background_warning.dds", 56 as Float, 23 as Float)
		endIf
	elseIf page == "$REQ_cat_skill0"
		self.SetTitleText("$REQ_cat_skill0_header")
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetCursorPosition(0)
		self.AddHeaderOption("$REQ_overviewheader_0", 0)
		self.AddTextOptionST("DiseaseResist", "$REQ_DiseaseResist", (Player.getAV("DiseaseResist") as Int) as String + "%", 0)
		self.AddTextOptionST("PoisonResist", "$REQ_PoisonResist", (Player.getAV("PoisonResist") as Int) as String + "%", 0)
		self.AddTextOptionST("MagicResist", "$REQ_MagicResist", (Player.getAV("MagicResist") as Int) as String + "%", 0)
		self.AddTextOptionST("FireResist", "$REQ_FireResist", (Player.getAV("FireResist") as Int) as String + "%", 0)
		self.AddTextOptionST("FrostResist", "$REQ_FrostResist", (Player.getAV("FrostResist") as Int) as String + "%", 0)
		self.AddTextOptionST("ElectricResist", "$REQ_ElectricResist", (Player.getAV("ElectricResist") as Int) as String + "%", 0)
		self.AddTextOptionST("AbsorbChance", "шанс поглощения магии", (Player.getAV("AbsorbChance") as Int) as String + "%", 0)
		self.AddHeaderOption("$REQ_overviewheader_2", 0)
		self.AddTextOptionST("SpeedMult", "$REQ_SpeedMult", (Player.getAV("SpeedMult") as Int) as String + "%", 0)
		Float value = Player.getAV("MovementNoiseMult") * 100 as Float
		if value < 0.000000
			value = 0.000000
		endIf
		self.AddTextOptionST("MovementNoiseMult", "$REQ_MovementNoiseMult", (value as Int) as String + "%", 0)
		self.AddTextOptionST("SneakMod", "навык скрытности", (Player.getAV("SneakMod") as Int) as String + "%", 0)
		self.SetCursorPosition(1)
		self.AddHeaderOption("$REQ_overviewheader_1", 0)
		value = Player.getAV("HealRate") * Player.getAV("HealRateMult") / 100 as Float
		Int Floore = math.floor(value)
		value = (value - Floore as Float) * 10 as Float
		if Floore < 0
			Floore = 0
			value = 0.000000
		endIf
		self.AddTextOptionST("HealRate", "$REQ_HealRateMult", Floore as String + "." + (value as Int) as String + "%/sec", 0)
		value = Player.getAV("MagickaRate") * Player.getAV("MagickaRateMult") / 100 as Float
		Floore = math.floor(value)
		value = (value - Floore as Float) * 10 as Float
		if Floore < 0
			Floore = 0
			value = 0.000000
		endIf
		self.AddTextOptionST("MagickaRate", "$REQ_MagickaRateMult", Floore as String + "." + (value as Int) as String + "%/sec", 0)
		value = Player.getAV("StaminaRate") * Player.getAV("StaminaRateMult") / 100 as Float
		Floore = math.floor(value)
		value = (value - Floore as Float) * 10 as Float
		if Floore < 0
			Floore = 0
			value = 0.000000
		endIf
		self.AddTextOptionST("StaminaRate", "$REQ_StaminaRateMult", Floore as String + "." + (value as Int) as String + "%/sec", 0)
		self.AddHeaderOption("$REQ_overviewheader_3", 0)
		String statename = "MassTotal"
		String text = "$REQ_MassTotal"
		String display = self.format_float(Player.getAV("Mass"), 2)
		self.AddTextOptionST(statename, text, display, 0)
		statename = "MassPenalty"
		text = "$REQ_MassPenalty"
		display = self.format_float(Player.getAV("Infamy"), 2)
		self.AddTextOptionST(statename, text, display, 0)
		statename = "masseffect"
		text = "$REQ_MassEffect"
		display = self.format_float(masseffect.mod_mass, 2)
		self.AddTextOptionST(statename, text, display, 0)
		statename = "MassEffectPenalty"
		text = "$REQ_MassEffectPenalty"
		display = self.format_float(masseffect.mod_penalty, 2)
		self.AddTextOptionST(statename, text, display, 0)
	elseIf page == "$REQ_cat_skill1"
		self.SetTitleText("$REQ_cat_skill1_header")
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetCursorPosition(0)
		self.AddHeaderOption("$REQ_skillheader_0", 0)
		index = data.derived.find("DiseaseResist", 0)
		self.AddTextOptionST("DiseaseResist_bonus", "$REQ_DiseaseResist", "+" + (data.modifiers[index] as Int) as String + "%", 0)
		index = data.derived.find("PoisonResist", 0)
		self.AddTextOptionST("PoisonResist_bonus", "$REQ_PoisonResist", "+" + (data.modifiers[index] as Int) as String + "%", 0)
		index = data.derived.find("MagicResist", 0)
		self.AddTextOptionST("MagicResist_bonus", "$REQ_MagicResist", "+" + (data.modifiers[index] as Int) as String + "%", 0)
		self.AddHeaderOption("$REQ_skillheader_1", 0)
		index = data.derived.find("MagickaRateMult", 0)
		self.AddTextOptionST("MagickaRateMult_bonus", "$REQ_MagickaRateMult", "+" + (data.modifiers[index] as Int) as String + "%", 0)
		index = data.derived.find("StaminaRateMult", 0)
		self.AddTextOptionST("StaminaRateMult_bonus", "$REQ_StaminaRateMult", "+" + (data.modifiers[index] as Int) as String + "%", 0)
		index = data.derived.find("CarryWeight", 0)
		self.AddTextOptionST("CarryWeight", "$REQ_CarryWeight", "+" + (data.modifiers[index] as Int) as String, 0)
		index = data.derived.find("SpeedMult", 0)
		self.AddTextOptionST("SpeedMult_bonus", "$REQ_SpeedMult", "+" + (data.modifiers[index] as Int) as String + "%", 0)

		self.SetCursorPosition(1)
		self.AddHeaderOption("$REQ_skillheader_2", 0)
		index = data.derived.find("UnarmedDamage", 0)
		self.AddTextOptionST("UnarmedDamage", "$REQ_UnarmedDamage", "+" + (data.modifiers[index] as Int) as String, 0)
		index = data.derived.find("OneHandedPowerMod", 0)
		self.AddTextOptionST("OneHandedPowerMod", "$REQ_OneHandedPowerMod", "+" + (data.modifiers[index] as Int) as String + "%", 0)
		index = data.derived.find("TwoHandedPowerMod", 0)
		self.AddTextOptionST("TwoHandedPowerMod", "$REQ_TwoHandedPowerMod", "+" + (data.modifiers[index] as Int) as String + "%", 0)
		index = data.derived.find("MarksmanPowerMod", 0)
		self.AddTextOptionST("MarksmanPowerMod", "$REQ_MarksmanPowerMod", "+" + (data.modifiers[index] as Int) as String + "%", 0)
		index = data.derived.find("WeaponSpeedMult", 0)
		self.AddTextOptionST("WeaponSpeedMult_bonus", "скорость атаки", "+" + ((data.modifiers[index] * 100 as Float) as Int) as String + "%", 0)
		self.AddHeaderOption("$REQ_skillheader_3", 0)
		Float ShRec = Player.getAV("ShoutRecoveryMult") * 100
		if ShRec < 15
			ShRec = 15
		EndIf
		self.AddTextOptionST("ShoutRecovery", "восстановление криков", (ShRec as Int) as String + "%", 0)
	elseIf page == "$REQ_cat_skill_expertise"
		self.SetTitleText("$REQ_cat_skill_expertise_header")
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetCursorPosition(0)
		self.AddHeaderOption("$REQ_expertise_header_combat", 0)
		self.AddTextOptionST("Expertise_OneHanded", "$REQ_expertise_onehanded", (Player.getAV("OneHandedMod") as Int) as String, 0)
		self.AddTextOptionST("Expertise_Marksman", "$REQ_expertise_marksman", (Player.getAV("MarksmanMod") as Int) as String, 0)
		self.AddTextOptionST("Expertise_TwoHanded", "$REQ_expertise_twohanded", (Player.getAV("TwoHandedMod") as Int) as String, 0)
		Float WeaponSpeed = Player.getAV("WeaponSpeedMult") * 100 as Float
		self.AddTextOptionST("RightWeapSpeed", "Скорость атаки", (WeaponSpeed as Int) as String + "%", 0)
		AddHeaderOption("$REQ_expertise_header_rogue")
        AddHeaderOption("")
        AddTextOptionST("Expertise_Lockpicking", "$REQ_expertise_lockpicking", player.getAV("LockpickingMod") as Int)
		self.AddTextOptionST("Sneak_crit", "модификатор скрытных атак", (Player.getAV("sneakSkillAdvance") as Int) as String, 0)
		self.SetCursorPosition(1)
		self.AddHeaderOption("Магические навыки", 0)
		self.AddTextOptionST("DestructionMod", "стоимость заклинаний разрушения", "-" + (Player.getAV("DestructionMod") as Int) as String + "%", 0)
		self.AddTextOptionST("RestorationMod", "стоимость заклинаний востановления", "-" + (Player.getAV("RestorationMod") as Int) as String + "%", 0)
		self.AddTextOptionST("AlterationMod", "стоимость заклинаний изменения", "-" + (Player.getAV("AlterationMod") as Int) as String + "%", 0)
		self.AddTextOptionST("IllusionMod", "стоимость заклинаний иллюзии", "-" + (Player.getAV("IllusionMod") as Int) as String + "%", 0)
		self.AddTextOptionST("ConjurationMod", "стоимость заклинаний колдовства", "-" + (Player.getAV("ConjurationMod") as Int) as String + "%", 0)
		self.SetCursorPosition(1)
	elseIf page == "$REQ_cat_weapon_stats"
		self.SetTitleText("Характеристики оружия")
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetCursorPosition(0)
		Int[] Floore = new Int[8]
		Float[] WeaponStats = new Float[8]
		Weapon EqWeapR = Player.GetEquippedWeapon(false)
		Weapon EqWeapL = Player.GetEquippedWeapon(true)
		WeaponStats[0] = EqWeapR.GetBaseDamage()
		WeaponStats[1] = EqWeapR.GetSpeed()
		WeaponStats[2] = EqWeapR.GetReach()
		WeaponStats[3] = EqWeapR.GetStagger()
		WeaponStats[4] = EqWeapL.GetBaseDamage()
		WeaponStats[5] = EqWeapL.GetSpeed()
		WeaponStats[6] = EqWeapL.GetReach()
		WeaponStats[7] = EqWeapL.GetStagger()
		Int i = 0
		While i < WeaponStats.length
		Floore[i] = math.Floor(WeaponStats[i])
		WeaponStats[i] = (WeaponStats[i] - Floore[i]) * 10
		i += 1
		EndWhile
		self.AddHeaderOption("Левая рука", 0)
		If Player.GetEquippedItemType(0) == 1 || \
			Player.GetEquippedItemType(0) == 2 || \
			Player.GetEquippedItemType(0) == 3 || \
			Player.GetEquippedItemType(0) == 4

			self.AddTextOption("", "<font color='#ccc28f'>"+EqWeapL.GetName()+"</font>", 0)
			String Material = "Материал:"
			If EqWeapL.HasKeyword(game.GetForm(124696) as Keyword)
				self.AddTextOption(Material, "Железо", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(124697) as Keyword)
				self.AddTextOption(Material, "Сталь", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(1092122) as Keyword)
				self.AddTextOption(Material, "Серебро", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(124698) as Keyword)
				self.AddTextOption(Material, "Двемерик", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(124700) as Keyword)
				self.AddTextOption(Material, "Оркит", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(67265072) as Keyword)
				self.AddTextOption(Material, "Нордик", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(124699) as Keyword)
				self.AddTextOption(Material, "Эльфик", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(124701) as Keyword)
				self.AddTextOption(Material, "Стекло", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(124702) as Keyword)
				self.AddTextOption(Material, "Эбонит", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(67265071) as Keyword)
				self.AddTextOption(Material, "Сталгрим", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(124703) as Keyword)
				self.AddTextOption(Material,"Даэдрик", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(33658914) as Keyword)
				self.AddTextOption(Material, "Драконик", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(809985) as Keyword)
				self.AddTextOption(Material, "Древний нордик", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(809986) as Keyword)
				self.AddTextOption(Material, "Хороший древний нордик", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(124695) as Keyword)
				self.AddTextOption(Material, "Дерево", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(809984) as Keyword)
				self.AddTextOption(Material, "Имперское", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(809987) as Keyword)
				self.AddTextOption(Material, "Фарлмерское", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(809988) as Keyword)
				self.AddTextOption(Material, "Хорошое фарлмерское", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(595944) as Keyword)
				self.AddTextOption(Material, "Даэдрический артефакт", 0)
				Material = ""
			EndIf
			If EqWeapL.HasKeyword(game.GetForm(166466) as Keyword) || \
				EqWeapL.HasKeyword(game.GetForm(331966) as Keyword) || \
				EqWeapL.HasKeyword(game.GetForm(544029) as Keyword)
				self.AddTextOption(Material, "Призванное оружие", 0)
				Material = ""
			EndIf
			self.AddTextOption("Базовый урон", Floore[4] as String + "." + (WeaponStats[4] as Int) as String, 0)
			self.AddTextOption("Скорость", Floore[5] as String + "." + (WeaponStats[5] as Int) as String, 0)
			If Player.GetEquippedItemType(0) != 7 && \
				Player.GetEquippedItemType(0) != 12
				self.AddTextOption("Дальность", Floore[6] as String + "." + (WeaponStats[6] as Int) as String, 0)
			EndIf
			self.AddTextOption("Стаггер", Floore[7] as String + "." + (WeaponStats[7] as Int) as String, 0)
		Else
			self.AddTextOption("Не экипировано", "", OPTION_FLAG_DISABLED)
		EndIf
		self.SetCursorPosition(1)
		self.AddHeaderOption("Правая рука", 0)
		If Player.GetEquippedItemType(1) != 0 && \
			Player.GetEquippedItemType(1) != 8 && \
			Player.GetEquippedItemType(1) != 9
			
			self.AddTextOption("", "<font color='#ccc28f'>"+EqWeapR.GetName()+"</font>", 0)
			String Material = "Материал:"
			If EqWeapR.HasKeyword(game.GetForm(124696) as Keyword)
				self.AddTextOption(Material, "Железо", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(124697) as Keyword)
				self.AddTextOption(Material, "Сталь", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(1092122) as Keyword)
				self.AddTextOption(Material, "Серебро", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(124698) as Keyword)
				self.AddTextOption(Material, "Двемерик", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(124700) as Keyword)
				self.AddTextOption(Material, "Оркит", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(67265072) as Keyword)
				self.AddTextOption(Material, "Нордик", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(124699) as Keyword)
				self.AddTextOption(Material, "Эльфик", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(124701) as Keyword)
				self.AddTextOption(Material, "Стекло", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(124702) as Keyword)
				self.AddTextOption(Material, "Эбонит", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(67265071) as Keyword)
				self.AddTextOption(Material, "Сталгрим", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(124703) as Keyword)
				self.AddTextOption(Material, "Даэдрик", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(33658914) as Keyword)
				self.AddTextOption(Material, "Драконик", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(809985) as Keyword)
				self.AddTextOption(Material, "Древний нордик", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(809986) as Keyword)
				self.AddTextOption(Material, "Хороший древний нордик", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(124695) as Keyword)
				self.AddTextOption(Material, "Дерево", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(809984) as Keyword)
				self.AddTextOption(Material, "Имперское", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(809987) as Keyword)
				self.AddTextOption(Material, "Фарлмерское", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(809988) as Keyword)
				self.AddTextOption(Material, "Хорошое фарлмерское", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(595944) as Keyword)
				self.AddTextOption(Material, "Даэдрический артефакт", 0)
				Material = ""
			EndIf
			If EqWeapR.HasKeyword(game.GetForm(166466) as Keyword) || \
				EqWeapR.HasKeyword(game.GetForm(331966) as Keyword) || \
				EqWeapR.HasKeyword(game.GetForm(544029) as Keyword)
				self.AddTextOption(Material, "Призванное оружие", 0)
				Material = ""
			EndIf
			self.AddTextOption("Базовый урон", Floore[0] as String + "." + (WeaponStats[0] as Int) as String, 0)
			self.AddTextOption("Скорость", Floore[1] as String + "." + (WeaponStats[1] as Int) as String, 0)
			If Player.GetEquippedItemType(1) != 7 && \
				Player.GetEquippedItemType(1) != 12
				self.AddTextOption("Дальность", Floore[2] as String + "." + (WeaponStats[2] as Int) as String, 0)
			ElseIf Player.GetEquippedItemType(1) == 7 || Player.GetEquippedItemType(1) == 12
				If EqWeapR.HasKeyword(game.GetFormFromFile(10459412, "Requiem.esp") as Keyword) || EqWeapR.HasKeyword(game.GetFormFromFile(9018814, "Requiem.esp") as Keyword)
					self.AddTextOption("Тип:", "Тяжелый", 0)
				ElseIf EqWeapR.HasKeyword(game.GetFormFromFile(10459413, "Requiem.esp") as Keyword) || EqWeapR.HasKeyword(game.GetFormFromFile(10449273, "Requiem.esp") as Keyword)
					self.AddTextOption("Тип:", "Легкий", 0)
				EndIf
			EndIf
			self.AddTextOption("Стаггер", Floore[3] as String + "." + (WeaponStats[3] as Int) as String, 0)
		Else
			self.AddTextOption("Не экипировано", "", OPTION_FLAG_DISABLED)
		EndIf
		self.AddHeaderOption("Стрелы/Болты", 0)

		Form EquipedAmmo
		i = Player.GetNumItems() - 1
		While i >= 0
			form Item = Player.GetNthForm(i)
			if Item as Ammo && Player.IsEquipped(Item)
				EquipedAmmo = Item
			EndIf
			i -= 1
		EndWhile
		If Player.IsEquipped(EquipedAmmo)
			self.AddTextOption("", "<font color='#ccc28f'>"+EquipedAmmo.GetName()+"</font>", 0)
			String Material = "Материал:"
			If EquipedAmmo.HasKeyword(game.GetForm(124696) as Keyword)
				self.AddTextOption(Material, "Железо", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(124697) as Keyword)
				self.AddTextOption(Material, "Сталь", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(1092122) as Keyword)
				self.AddTextOption(Material, "Серебро", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(124698) as Keyword)
				self.AddTextOption(Material, "Двемерик", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(124700) as Keyword)
				self.AddTextOption(Material, "Оркит", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(67265072) as Keyword)
				self.AddTextOption(Material, "Нордик", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(124699) as Keyword)
				self.AddTextOption(Material, "Эльфик", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(124701) as Keyword)
				self.AddTextOption(Material, "Стекло", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(124702) as Keyword)
				self.AddTextOption(Material, "Эбонит", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(67265071) as Keyword)
				self.AddTextOption(Material, "Сталгрим", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(124703) as Keyword)
				self.AddTextOption(Material, "Даэдрик", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(33658914) as Keyword)
				self.AddTextOption(Material, "Драконик", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(809985) as Keyword)
				self.AddTextOption(Material, "Древний нордик", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(809986) as Keyword)
				self.AddTextOption(Material, "Хороший древний нордик", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(124695) as Keyword)
				self.AddTextOption(Material, "Дерево", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(809984) as Keyword)
				self.AddTextOption(Material, "Имперское", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(809987) as Keyword)
				self.AddTextOption(Material, "Фарлмерское", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(809988) as Keyword)
				self.AddTextOption(Material, "Хорошое фарлмерское", 0)
				Material = ""
			EndIf
			If EquipedAmmo.HasKeyword(game.GetForm(166466) as Keyword) || \
				EquipedAmmo.HasKeyword(game.GetForm(331966) as Keyword) || \
				EquipedAmmo.HasKeyword(game.GetForm(544029) as Keyword)
				self.AddTextOption(Material, "Призванное оружие", 0)
				Material = ""
			EndIf

			If !bBolt(EquipedAmmo)
				If EquipedAmmo.HasKeyword(game.GetFormFromFile(1036975, "Requiem.esp") as Keyword) ;Стрелы тир 1
					self.AddTextOption("Мастерство", "+"+(game.GetFormFromFile(11352441, "Requiem.esp") as Spell).GetNthEffectMagnitude(0) as Int, 0)
				EndIf
				If EquipedAmmo.HasKeyword(game.GetFormFromFile(1036978, "Requiem.esp") as Keyword) ;Стрелы тир 2
					self.AddTextOption("Мастерство", "+"+(game.GetFormFromFile(11352441, "Requiem.esp") as Spell).GetNthEffectMagnitude(1) as Int, 0)
				EndIf
				If EquipedAmmo.HasKeyword(game.GetFormFromFile(1036977, "Requiem.esp") as Keyword) ;Стрелы тир 3
					self.AddTextOption("Мастерство", "+"+(game.GetFormFromFile(11352441, "Requiem.esp") as Spell).GetNthEffectMagnitude(2) as Int, 0)
				EndIf
				If EquipedAmmo.HasKeyword(game.GetFormFromFile(1036976, "Requiem.esp") as Keyword) ;Стрелы тир 4
					self.AddTextOption("Мастерство", "+"+(game.GetFormFromFile(11352441, "Requiem.esp") as Spell).GetNthEffectMagnitude(3) as Int, 0)
				EndIf
				If EquipedAmmo.HasKeyword(game.GetFormFromFile(1036974, "Requiem.esp") as Keyword) ;Стрелы тир 5
					self.AddTextOption("Мастерство", "+"+(game.GetFormFromFile(11352441, "Requiem.esp") as Spell).GetNthEffectMagnitude(4) as Int, 0)
				EndIf
				If EquipedAmmo.HasKeyword(game.GetFormFromFile(11352632, "Requiem.esp") as Keyword) ;Стрелы тир 6
					self.AddTextOption("Мастерство", "+"+(game.GetFormFromFile(11352441, "Requiem.esp") as Spell).GetNthEffectMagnitude(5) as Int, 0)
				EndIf
				If EquipedAmmo.HasKeyword(game.GetFormFromFile(11352450, "Requiem.esp") as Keyword) ;Стрелы тир 7
					self.AddTextOption("Мастерство", "+"+(game.GetFormFromFile(11352441, "Requiem.esp") as Spell).GetNthEffectMagnitude(6) as Int, 0)
				EndIf
			Else
				If EquipedAmmo.HasKeyword(game.GetFormFromFile(11352449, "Requiem.esp") as Keyword) ;Болты тир 1
					self.AddTextOption("Мастерство", "+"+(game.GetFormFromFile(11352440, "Requiem.esp") as Spell).GetNthEffectMagnitude(0) as Int, 0)
				EndIf
				If EquipedAmmo.HasKeyword(game.GetFormFromFile(11352448, "Requiem.esp") as Keyword) ;Болты тир 2
					self.AddTextOption("Мастерство", "+"+(game.GetFormFromFile(11352440, "Requiem.esp") as Spell).GetNthEffectMagnitude(1) as Int, 0)
				EndIf
				If EquipedAmmo.HasKeyword(game.GetFormFromFile(11352447, "Requiem.esp") as Keyword) ;Болты тир 3
					self.AddTextOption("Мастерство", "+"+(game.GetFormFromFile(11352440, "Requiem.esp") as Spell).GetNthEffectMagnitude(2) as Int, 0)
				EndIf
				If EquipedAmmo.HasKeyword(game.GetFormFromFile(11352446, "Requiem.esp") as Keyword) ;Болты тир 4
					self.AddTextOption("Мастерство", "+"+(game.GetFormFromFile(11352440, "Requiem.esp") as Spell).GetNthEffectMagnitude(3) as Int, 0)
				EndIf
				If EquipedAmmo.HasKeyword(game.GetFormFromFile(11352445, "Requiem.esp") as Keyword) ;Болты тир 5
					self.AddTextOption("Мастерство", "+"+(game.GetFormFromFile(11352440, "Requiem.esp") as Spell).GetNthEffectMagnitude(4) as Int, 0)
				EndIf
				If EquipedAmmo.HasKeyword(game.GetFormFromFile(11352631, "Requiem.esp") as Keyword) ;Болты тир 6
					self.AddTextOption("Мастерство", "+"+(game.GetFormFromFile(11352440, "Requiem.esp") as Spell).GetNthEffectMagnitude(5) as Int, 0)
				EndIf
				If EquipedAmmo.HasKeyword(game.GetFormFromFile(11352444, "Requiem.esp") as Keyword) ;Болты тир 7
					self.AddTextOption("Мастерство", "+"+(game.GetFormFromFile(11352440, "Requiem.esp") as Spell).GetNthEffectMagnitude(6) as Int, 0)
				EndIf
			EndIf
		Else
			Self.AddTextOption("Не экипировано", "", self.OPTION_FLAG_DISABLED)
		EndIf
	endIf
endFunction

state MagickaRate

	function OnHighlightST()

		self.SetInfoText("$REQ_MagickaRateMult_highlight")
	endFunction
endState

state StaminaRateMult_bonus

	function OnHighlightST()

		self.SetInfoText("$REQ_StaminaRateMult_bonus_highlight")
	endFunction
endState

state WordsLearned

	function OnHighlightST()

		self.SetInfoText("$REQ_WordsLearned_highlight")
	endFunction
endState

state TimesShouted

	function OnHighlightST()

		self.SetInfoText("$REQ_TimesShouted_highlight")
	endFunction
endState

state MassEffectPenalty

	function OnHighlightST()

		self.SetInfoText("$REQ_MassEffectPenalty_highlight")
	endFunction
endState

state MagickaRateMult_bonus

	function OnHighlightST()

		self.SetInfoText("$REQ_MagickaRateMult_bonus_highlight")
	endFunction
endState

state FireResist

	function OnHighlightST()

		self.SetInfoText("$REQ_FireResist_highlight")
	endFunction
endState


state MovementNoiseMult

	function OnHighlightST()

		self.SetInfoText("$REQ_MovementNoiseMult_highlight")
	endFunction
endState

state MagicResist_bonus

	function OnHighlightST()

		self.SetInfoText("$REQ_MagicResist_bonus_highlight")
	endFunction
endState

state Expertise_Marksman

	function OnHighlightST()

		self.SetInfoText("$REQ_expertise_marksman_highlight")
	endFunction
endState

state FrostResist

	function OnHighlightST()

		self.SetInfoText("$REQ_FrostResist_highlight")
	endFunction
endState

state DiseaseResist_bonus

	function OnHighlightST()

		self.SetInfoText("$REQ_DiseaseResist_bonus_highlight")
	endFunction
endState

state MagicResist

	function OnHighlightST()

		self.SetInfoText("$REQ_MagicResist_highlight")
	endFunction
endState

state WordsUnlocked

	function OnHighlightST()

		self.SetInfoText("$REQ_WordsUnlocked_highlight")
	endFunction
endState

state OneHandedPowerMod

	function OnHighlightST()

		self.SetInfoText("$REQ_OneHandedPowerMod_highlight")
	endFunction
endState

state SpeedMult_bonus

	function OnHighlightST()

		self.SetInfoText("$REQ_SpeedMult_bonus_highlight")
	endFunction
endState

state DiseaseResist

	function OnHighlightST()

		self.SetInfoText("$REQ_DiseaseResist_highlight")
	endFunction
endState

state UnarmedDamage

	function OnHighlightST()

		self.SetInfoText("$REQ_UnarmedDamage_highlight")
	endFunction
endState


state MassTotal

	function OnHighlightST()

		self.SetInfoText("$REQ_MassTotal_highlight")
	endFunction
endState

state PoisonResist_bonus

	function OnHighlightST()

		self.SetInfoText("$REQ_PoisonResist_bonus_highlight")
	endFunction
endState

state Expertise_Lockpicking

	function OnHighlightST()

		self.SetInfoText("$REQ_expertise_lockpicking_highlight")
	endFunction
endState

state TwoHandedPowerMod

	function OnHighlightST()

		self.SetInfoText("$REQ_TwoHandedPowerMod_highlight")
	endFunction
endState

state ElectricResist

	function OnHighlightST()

		self.SetInfoText("$REQ_ElectricResist_highlight")
	endFunction
endState

state AbsorbChance

	function OnHighlightST()

		self.SetInfoText("Шанс поглотить весь урон заклинания и превратить его в ману")
	endFunction
endState

state Persistence

	function OnHighlightST()

		self.SetInfoText("Устойчивость снижает шанс того, что вас собьют с ног. Также позволяет вам эффективно сопротивляться ошеломлению")
	endFunction
endState

state SneakMod

	function OnHighlightST()

		self.SetInfoText("Навык скрытности отвечает за то, как враги будут вас обнаруживать")
	endFunction
endState

state masseffect

	function OnHighlightST()

		self.SetInfoText("$REQ_MassEffect_highlight")
	endFunction
endState

state MassPenalty

	function OnHighlightST()

		self.SetInfoText("$REQ_MassPenalty_highlight")
	endFunction
endState

state Expertise_OneHanded

	function OnHighlightST()

		self.SetInfoText("$REQ_expertise_onehanded_highlight")
	endFunction
endState

state SpeedMult

	function OnHighlightST()

		self.SetInfoText("$REQ_SpeedMult_highlight")
	endFunction
endState

state CarryWeight

	function OnHighlightST()

		self.SetInfoText("$REQ_CarryWeight_highlight")
	endFunction
endState

state Expertise_TwoHanded

	function OnHighlightST()

		self.SetInfoText("$REQ_expertise_twohanded_highlight")
	endFunction
endState

state StaminaRate

	function OnHighlightST()

		self.SetInfoText("$REQ_StaminaRateMult_highlight")
	endFunction
endState

state MarksmanPowerMod

	function OnHighlightST()

		self.SetInfoText("$REQ_MarksmanPowerMod_highlight")
	endFunction
endState

state PoisonResist

	function OnHighlightST()

		self.SetInfoText("$REQ_PoisonResist_highlight")
	endFunction
endState

state HealRate

	function OnHighlightST()

		self.SetInfoText("$REQ_HealRateMult_highlight")
	endFunction
endState

state WeaponSpeedMult_bonus

	function OnHighlightST()

		self.SetInfoText("Скорость атаки определяется вашим запасом сил.")
	endFunction
endState

state DestructionPowerMod_bonus

	function OnHighlightST()

		self.SetInfoText("Сила заклинаний определяется вашим запасом магии.\nИллюзия, Разрушение и Восстановление - увеличивает только силу.\nКолдовство и Изменение - увеличивает только длительность.")
	endFunction
endState

Bool Function bBolt(Form akAmmo)

	If akAmmo.HasKeyword(game.GetFormFromFile(11352449, "Requiem.esp") as Keyword)	 || \
		akAmmo.HasKeyword(game.GetFormFromFile(11352448, "Requiem.esp") as Keyword)	 || \
		akAmmo.HasKeyword(game.GetFormFromFile(11352447, "Requiem.esp") as Keyword)	 || \
		akAmmo.HasKeyword(game.GetFormFromFile(11352446, "Requiem.esp") as Keyword)	 || \
		akAmmo.HasKeyword(game.GetFormFromFile(11352445, "Requiem.esp") as Keyword)	 || \
		akAmmo.HasKeyword(game.GetFormFromFile(11352631, "Requiem.esp") as Keyword)	 || \
		akAmmo.HasKeyword(game.GetFormFromFile(11352444, "Requiem.esp") as Keyword)
		Return true
	Else
		Return false
	EndIf
EndFunction