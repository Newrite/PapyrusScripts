ScriptName MRL_SXPKillActorWorker Extends Quest

Import Game
Import StringUtil

MRL_SXPMainController Property ExpQuest Auto
Keyword Property ImmuneParalysis Auto
FormList Property NoExpActors Auto

; Инициализация системы
Event OnInit()
  Utility.Wait(1.0)
  ;Debug.Notification("System kill exp init")
EndEvent

Function PostVictim(Actor pVictim)

	float calcXP = CalcXP(pVictim) * ExpQuest.ActorXPMult
	;Debug.Notification("Calc exp is: " + calcXP)

	if NoExpActors.Find(pVictim) > 0
		;Debug.Notification("Set calc  to 0.0")
		calcXP = 0.0
	endif

	If pVictim.GetLeveledActorBase().GetName()
		ExpQuest.GainXPMessage(calcXP, "Lv." + pVictim.GetLevel() + " " + pVictim.GetLeveledActorBase().GetName() + ":")
	Else
		ExpQuest.GainXPMessage(calcXP)
	EndIf

EndFunction

Float Function CalcXP(Actor pActor)
	
	Float SXP_MOUNT = 1 as Float
	If GetPlayer().IsOnMount()
		SXP_MOUNT = 0.75
	EndIf
	
	Float UniqueActXP = UniqueXP(pActor.GetBaseObject().GetFormID())
	If UniqueActXP > -1.0
		Return UniqueActXP * SXP_MOUNT
	EndIf
	UniqueActXP = UniqueXPMods(pActor.GetBaseObject() as Form)
	If UniqueActXP > -1.0
		Return UniqueActXP * SXP_MOUNT
	EndIf

	Race pRace = pActor.GetRace()
	If Find(pActor.GetFactions(0,127), "0002E894") >= 0 && Find(pRace, "Riekling") <= 0 || Find(pRace, "Mammoth") > 0 ;Мамонты и дичь
		Return 0.0
	EndIf

	float fBase = pActor.GetBaseActorValue("Health")
	If Find(pRace, "DragonRace") > 0 ;Фикс для мода Deadly Dragons
		fBase *= 1.75
	EndIf
	fBase += pActor.GetLevel() * 10.0
	If Find(pRace, "Vampire") > 0 && pActor.GetBaseActorValue("Health") > 1500.0 ;Эбонитовые вампиры
		fBase *= 1.8
	ElseIf Find(pRace, "HighElfRace") > 0 && pActor.GetBaseActorValue("Health") > 999.0 && Find(pRace, "Vampire") <= 0 ;Призраки фалмеров
		fBase *= 2.0
	EndIf

	float fMult = 1.0
	fMult *= 1.0 + (20.0 / 19.0) * Value(pActor, "DamageResist") * 0.0012
	fMult *= 1.0 + (5.0 / 9.0) * Value(pActor, "MagicResist") * 0.01
	fMult *= 1.0 + (5.0 / 9.0) * Value(pActor, "AbsorbChance") * 0.01
	fMult *= 1.0 + (5.0 / 27.0) * Value(pActor, "FireResist") * 0.01
	fMult *= 1.0 + (5.0 / 27.0) * Value(pActor, "ElectricResist") * 0.01
	fMult *= 1.0 + (5.0 / 27.0) * Value(pActor, "FrostResist") * 0.01
	fMult *= 1.0 + (5.0 / 45.0) * Value(pActor, "PoisonResist") * 0.01
	fMult += RaceMult(pRace, pActor)
	fMult += FactionMult(pActor.GetFactions(0,127))
	fMult += pActor.GetLevel() / 50.0
	If pRace != None
		If pRace.IsPlayable()
			If pRace.HasKeyword(ImmuneParalysis) 
				fMult += 0.1
			EndIf
			If !pRace.NoKnockdowns()
				fMult += 0.15
			EndIf
			If pRace.IsNotPushable()
				fMult += 0.1
			EndIf
		EndIf
	Endif
	Return fBase * fMult * SXP_MOUNT
EndFunction

Float Function Value(Actor pActor, String stat)
	If pActor.GetActorValue(stat) >= pActor.GetBaseActorValue(stat) && pActor.GetActorValue(stat) >= 0.0
		Return pActor.GetActorValue(stat)
	ElseIf pActor.GetBaseActorValue(stat) >= pActor.GetActorValue(stat) && pActor.GetBaseActorValue(stat) >= 0.0
		Return pActor.GetBaseActorValue(stat)
	EndIf
	Return 0.0
EndFunction

Float Function RaceMult(Race tRace, Actor pActor)
	If Find(tRace, "Mirel_RfaDK_RaceLifeGloves") > 0
		Return 1.0
	ElseIf Find(tRace, "Mirel_RfaDK_LifeWeaponRace") > 0
		Return 1.0
	ElseIf Find(tRace, "DLC1VampireBeastRace") > 0
		Return 5.0
	ElseIf Find(tRace, "AtronachFlameRace") > 0
		Return 3.0
	ElseIf Find(tRace, "AtronachFrostRace") > 0
		Return 4.0
	ElseIf Find(tRace, "AtronachStormRace") > 0
		Return 5.0
	ElseIf Find(tRace, "_00AtronachGlassRace") > 0
		Return 0.5
	ElseIf Find(tRace, "ChaurusReaperRace") > 0
		Return 2.75
	ElseIf Find(tRace, "DLC1ChaurusHunterRace") > 0 ;Корус-охотник
		Return 3.0
	ElseIf Find(tRace, "DLC1_BF_ChaurusRace") > 0 ;Замороженный корус
		Return 3.75
	ElseIf Find(tRace, "_00ChaurusCrawlerRace") > 0 ;Корус-сборщик
		Return 2.75
	ElseIf Find(tRace, "_00ChaurusHopperRace") > 0 ;Корус-прыгун
		Return 0.75
	ElseIf Find(tRace, "_00ChaurusWarriorRace") > 0 ;Корус-воин
		Return 2.75
	ElseIf Find(tRace, "ChaurusRace") > 0
		Return 3.0
	ElseIf Find(tRace, "DLC1DeathHoundRace") > 0
		Return 4.0
	ElseIf Find(tRace, "DLC1SabreCatGlowRace") > 0 ;Долинный саблезуб
		Return 1.75
	ElseIf Find(tRace, "SabreCatSnowyRace") > 0
		Return 1.75
	ElseIf Find(tRace, "SabreCatRace") > 0
		Return 1.75
	ElseIf Find(tRace, "DLC1SoulCairnKeeperRace") > 0 ;Смотритель
		Return 5.0
	ElseIf Find(tRace, "DLC1BlackSkeletonRace") > 0 ;Костяной человек
		Return 1.75
	ElseIf Find(tRace, "DLC1SoulCairnSkeletonArmorRace") > 0 ;Яростный человек
		Return 1.75
	ElseIf Find(tRace, "DLC1SoulCairnSkeletonNecroRace") > 0 ;Туманный человек
		Return 1.75
	ElseIf Find(tRace, "DLC1SoulCairnSoulWispRace") > 0 ;Шепчущий дух
		Return 0.5
	ElseIf Find(tRace, "dlc2AshGuardianRace") > 0 ;Пепельный страж
		Return 0.5
	ElseIf Find(tRace, "DLC2AshHopperRace") > 0 ;Пепельный прыгун
		Return 0.2
	ElseIf Find(tRace, "DLC2AshSpawnRace") > 0 ;Порождение пепла
		Return 0.5
	ElseIf Find(tRace, "_00AshHunterRace") > 0 ;Пепельный охотник
		Return 0.75
	ElseIf Find(tRace, "DLC2BoarRace") > 0 ;Щетиноспины, дурзоги
		Return 0.3
	ElseIf Find(tRace, "DLC2DwarvenBallistaRace") > 0
		Return 0.75
	ElseIf Find(tRace, "DLC2LurkerRace") > 0
		Return 2.0
	ElseIf Find(tRace, "DLC2MountedRieklingRace") > 0 ;Риклинг-наездник
		Return 6.0
	ElseIf Find(tRace, "DLC2Netch") > 0
		Return 0.0
	ElseIf Find(tRace, "DLC2SeekerRace") > 0 ;Искатель
		Return 1.2
	ElseIf Find(tRace, "DLC2SprigganBurntRace") > 0 ;Горелый спригган
		Return 1.5
	ElseIf Find(tRace, "SprigganEarthMotherRace") > 0
		Return 1.5
	ElseIf Find(tRace, "SprigganMatronRace") > 0
		Return 1.5
	ElseIf Find(tRace, "_00AncientSprigganRace") > 0
		Return 1.5
	ElseIf Find(tRace, "SprigganRace") > 0
		Return 2.5
	ElseIf Find(tRace, "WerebearBeast") > 0 ;Медведь-оборотень
		Return 10.0
	ElseIf Find(tRace, "BearBlackRace") > 0 ;Пещерный медведь
		Return 1.75
	ElseIf Find(tRace, "BearBrownRace") > 0 ;Обычный медведь
		Return 1.75
	ElseIf Find(tRace, "BearSnowRace") > 0 ;Белый медведь
		Return 2.0
	ElseIf Find(tRace, "DragonPriestRace") > 0 ;Обычные драконьи жрецы
		Return 2.5
	ElseIf Find(tRace, "DraugrMagicRace") > 0
		Return 0.9
	ElseIf Find(tRace, "_00DraugrDwarvenRace") > 0 ;Двемерская конструкция, двемерский рабочий
		Return 0.3
	ElseIf Find(tRace, "DremoraRace") > 0
		Return 3.0
	ElseIf Find(tRace, "DwarvenCenturionRace") > 0
		Return 2.5
	ElseIf Find(tRace, "DwarvenSphereRace") > 0
		Return 2.0
	ElseIf Find(tRace, "DwarvenSpider") > 0
		Return 1.5
	ElseIf Find(tRace, "FalmerFrozenVampRace") > 0 ;Замороженные фалмеры
		Return 0.75
	ElseIf Find(tRace, "FalmerRace") > 0
		Return 2.0
	ElseIf Find(tRace, "SpiderRaceGiant") > 0
		Return 2.5
	ElseIf Find(tRace, "SpiderRace") > 0
		Return 1.5
	ElseIf Find(tRace, "HagravenRace") > 0
		Return 0.3
	ElseIf Find(tRace, "InvisibleRace") > 0
		Return 5.0
	ElseIf Find(tRace, "SkeletonNecroRace") > 0 ;Порченые тени по квесту Меридии
		Return 1.25
	ElseIf Find(tRace, "_00DreughRace") > 0
		Return 5.0
	ElseIf Find(tRace, "_00DurzogRace") > 0
		Return 1.0
	ElseIf Find(tRace, "_00DwarvenKeeperRace") > 0 ;Двемерский хранитель
		Return 2.0
	ElseIf Find(tRace, "_00DwarvenPunisherRace") > 0 ;Двемерский каратель
		Return 3.0
	ElseIf Find(tRace, "_00DwarvenSweeperRace") > 0 ;Двемерский уборщик
		Return 1.0
	ElseIf Find(tRace, "_00DwemerRace") > 0 ;Призрак двемера
		Return 2.0
	ElseIf Find(tRace, "ShoggothRace") > 0
		Return 2.0
	ElseIf Find(tRace, "_00FrostBruteRace") > 0 ;Морозный великан
		Return 2.0
	ElseIf Find(tRace, "_00GiantBruteRace") > 0 ;Дикий великан, дикий великан-берсерк
		Return 2.0
	ElseIf Find(tRace, "_00GiantFrostRace") > 0 ;Ледяной великан
		Return 2.0
	ElseIf Find(tRace, "_00GoldenSaintRace") > 0 ;Золотой святоша
		Return 3.0
	ElseIf Find(tRace, "_00LichRace") > 0
		Return 1.25
	ElseIf Find(tRace, "_00MechaDragonRace") > 0
		Return 3.0
	ElseIf Find(tRace, "_00SkeletonPriestRace") > 0
		Return 1.5
	ElseIf Find(tRace, "_00WereSkeeverBeastRace") > 0 ;Злокрыс-оборотень
		Return 10.0
	ElseIf Find(tRace, "_00WingedTwilightRace") > 0 ;Крылатый сумрак
		Return 3.0
	ElseIf Find(tRace, "_00WrathBruteRace") > 0 ;Яростный ужас
		Return 5.0
	ElseIf Find(tRace, "DragonRace") > 0
		Return 3.0
	ElseIf Find(tRace, "WolfRace") > 0
		Return 2.0
	ElseIf Find(tRace, "Vampire") > 0
		Return 4.0
	ElseIf Find(tRace, "Gargoyle") > 0
		Return 3.0
	ElseIf Find(tRace, "Riekling") > 0
		Return 4.0
	ElseIf Find(tRace, "Troll") > 0
		Return 2.25
	ElseIf Find(tRace, "Werewolf") > 0
		Return 10.0
	ElseIf Find(tRace, "Wisp") > 0 ;Мать-Дымок
		Return 6.5
	ElseIf Find(tRace, "Draugr") > 0
	;debug.messagebox("Draugr")
		Return 0.05
	ElseIf Find(tRace, "IceWraithRace") > 0
		Return 10.0
	ElseIf Find(tRace, "Race_BoneAcolyte") > 0 ; Гриди мобс
		Return 0.5
	ElseIf Find(tRace, "SkeletonDeathKnight") > 0 ; Гриди мобс
		Return 0.5
	ElseIf Find(tRace, "SkeletonDungeon_NPC") > 0 ; Гриди мобс
	;debug.messagebox("SkeletonDungeon_NPC")
		Return 0.5
	ElseIf Find(tRace, "Skeleton") > 0
	;debug.messagebox("Skeleton")
		Return 1.8
	ElseIf Find(tRace, "Giant") > 0
		Return 0.0
	ElseIf Find(tRace, "Mirel_RfaDK_DeepElfRace") > 0
		Return 1.2
	EndIf
	;debug.messagebox("000")
	Return 0.0
EndFunction

Float Function FactionMult(Faction[] tFactions)
	If Find(tFactions, "0001BCC0") >= 0 	;Бандиты
		Return 6.5
	ElseIf Find(tFactions, "000622E6") >= 0 ;Атар и наемники возле шахты Карварстен
		Return 6.5
	ElseIf Find(tFactions, "0001C9FC") >= 0 ;ГражданскаяВойна - Имперцы
		Return 3.0
	ElseIf Find(tFactions, "0001C9FD") >= 0 ;ГражданскаяВойна - ББ
		Return 3.0
	ElseIf Find(tFactions, "000215D3") >= 0 ;АликИрцы - по квесту Садии
		Return 1.25
	ElseIf Find(tFactions, "00026724") >= 0 ;Фракция Колдунов (Warlock) - Многие маги
		Return 4.0
	ElseIf Find(tFactions, "00028848") >= 0 ;CrimeFactionImperial - предположительно имперский легион
		Return 3.0
	ElseIf Find(tFactions, "00028849") >= 0 ;CrimeFactionSons - предположительно браться бури
		Return 3.0
	ElseIf Find(tFactions, "0002A451") >= 0 ;Наемники и обитатели поместья Златоцвет
		Return 1.0
	ElseIf Find(tFactions, "0002BF9A") >= 0 ;Снова имперский легион
		Return 3.0
	ElseIf Find(tFactions, "0002BF9B") >= 0 ;Снова братья бури
		Return 3.0
	ElseIf Find(tFactions, "0002EB13") >= 0 ;Вампирские Треллы
		Return 5.0
	ElseIf Find(tFactions, "00034B74") >= 0 ;Некроманты
		Return 4.0
	ElseIf Find(tFactions, "000C0637") >= 0 ;Охрана северной сторожевой крепости
		Return 7.0
	ElseIf Find(tFactions, "00039F26") >= 0 ;Талмор
		Return 7.0
	ElseIf Find(tFactions, "00043599") >= 0 ;Изгои
		Return 5.5
	ElseIf Find(tFactions, "000E3609") >= 0 ;Изгои из пещеры Друадах
		Return 5.5
	ElseIf Find(tFactions, "00043AB7") >= 0 ;Одержимые по квесту Оркендора
		Return 4.75
	ElseIf Find(tFactions, "00058B3D") >= 0 ;Кемату и АликрИрцы Кемату
		Return 3.0
	ElseIf Find(tFactions, "00068C8C") >= 0 ;Наемники Черного Вереска
		Return 3.25
	ElseIf Find(tFactions, "0006BB1E") >= 0 ;Стража фортов гражданской войны (чубзики что сидят в захваченных фортах)
		Return 3.0
	ElseIf Find(tFactions, "00073543") >= 0 ;Ингвильдские призраки и драугр+Арондил
		Return 0.75
	ElseIf Find(tFactions, "0007A509") >= 0 ;Жрецы вермины
		Return 4.0
	ElseIf Find(tFactions, "0007A50A") >= 0 ;Жрецы вермины
		Return 4.0
	ElseIf Find(tFactions, "00088EE4") >= 0 ;Бандиты черной крови
		Return 3.5
	ElseIf Find(tFactions, "000A2CB0") >= 0 ;МейлинВарен и стража мясника
		Return 5.0
	ElseIf Find(tFactions, "000AA0A4") >= 0 ;Серебряная рука
		Return 6.0
	ElseIf Find(tFactions, "000B3292") >= 0 ;Дозорные стендарра
		Return 1.5
	ElseIf Find(tFactions, "000BC033") >= 0 ;Призраки гробницы Исграмора
		Return 5.0
	ElseIf Find(tFactions, "000BA1E9") >= 0 ;Орки по квесту вермины
		Return 3.5
	ElseIf Find(tFactions, "000C0160") >= 0 ;Бандиты с туманной заставы
		Return 3.5
	ElseIf Find(tFactions, "000DEED5") >= 0 ;Соловьи-Стражи в сумеречной гробнице
		Return 2.0
	ElseIf Find(tFactions, "000E16CA") >= 0 ;Орки по квесту вермины
		Return 3.5
	ElseIf Find(tFactions, "020135BD") >= 0 ;Очарованные дозорные, это по квесту даунгарда
		Return 3.5
	ElseIf Find(tFactions, "0402929A") >= 0 ;Мораг Тонг
		Return 2.0
	ElseIf Find(tFactions, "04034FBC") >= 0 ;Культисты Мираака
		Return 5.0
	ElseIf Find(tFactions, "0004359E") >= 0 ; карги и ворожеи
		Return 4.0
	ElseIf Find(tFactions, "040200E7") >= 0 ;НПЦ что обладают иммунитетом к крику Подчинение воли
		Return 5.0
	EndIf
	Return 0.0
EndFunction

Float Function UniqueXP(Int BaseID)
	If BaseID == 67258601		;Азидал
		Return 250000.0
	ElseIf BaseID == 207764		;Алдуин
		Return 500000.0
	ElseIf BaseID == 208285		;Алдуин
		Return 500000.0
	ElseIf BaseID == 276351		;Алдуин
		Return 500000.0
	ElseIf BaseID == 279114		;Алдуин
		Return 500000.0
	ElseIf BaseID == 582897		;Алдуин
		Return 500000.0
	ElseIf BaseID == 321980		;Алдуин
		Return 500000.0
	ElseIf BaseID == 110708		;Ален Дюфон
		Return 15000.0
	ElseIf BaseID == 124887		;Анкано
		Return 100000.0
	ElseIf BaseID == 228736		;Арондил
		Return 50000.0
	ElseIf BaseID == 668650		;Башнаг
		Return 60000.0
	ElseIf BaseID == 866292		;Бледная Леди
		Return 30000.0
	ElseIf BaseID == 841292		;Брандиш
		Return 30000.0
	ElseIf BaseID == 67226325	;Валок Тюремщик
		Return 250000.0
	ElseIf BaseID == 106470		;Валс Веран
		Return 75000.0
	ElseIf BaseID == 33570051	;Ваник
		Return 100000.0
	ElseIf BaseID == 482431		;Велек Сейн
		Return 75000.0
	ElseIf BaseID == 67207812	;Вендил Северин
		Return 50000.0
	ElseIf BaseID == 374832		;Вигхар
		Return 100000.0
	ElseIf BaseID == 33568648	;Викарий Виртур
		Return 300000.0
	ElseIf BaseID == 206786		;Вокун
		Return 200000.0
	ElseIf BaseID == 361219		;Волчий дух Кодлака
		Return 75000.0
	ElseIf BaseID == 268592		;Вольсунг
		Return 150000.0
	ElseIf BaseID == 33623705	;Восларум
		Return 175000.0
	ElseIf BaseID == 518855		;Вультурьйол
		Return 150000.0
	ElseIf BaseID == 315974		;Вызывающая
		Return 75000.0
	ElseIf BaseID == 82216		;Галмор Каменный Кулак
		Return 50000.0
	ElseIf BaseID == 853360		;Галмор Каменный Кулак
		Return 50000.0
	ElseIf BaseID == 959874		;Галмор Каменный Кулак
		Return 50000.0
	ElseIf BaseID == 78462		;Генерал Туллий
		Return 50000.0
	ElseIf BaseID == 853367		;Генерал Туллий
		Return 50000.0
	ElseIf BaseID == 67216740	;Генерал Фалкс Карий
		Return 75000.0
	ElseIf BaseID == 78477		;Джари-Ра
		Return 30000.0
	ElseIf BaseID == 78440		;Диджа
		Return 50000.0
	ElseIf BaseID == 652128		;Дознаватель крепости
		Return 50000.0
	ElseIf BaseID == 596268		;Дракон-скелет
		Return 125000.0
	ElseIf BaseID == 67258593	;Дукан
		Return 250000.0
	ElseIf BaseID == 943661		;Дух-страж волка
		Return 40000.0
	ElseIf BaseID == 943659		;Дух-страж грязевого краба
		Return 40000.0
	ElseIf BaseID == 943662		;Дух-страж злокрыса
		Return 40000.0
	ElseIf BaseID == 949935		;Дух-страж мамонта
		Return 50000.0
	ElseIf BaseID == 949929		;Дух-страж медведя
		Return 50000.0
	ElseIf BaseID == 949933		;Дух-страж саблезуба
		Return 50000.0
	ElseIf BaseID == 949938		;Дух-страж тролля
		Return 60000.0
	ElseIf BaseID == 33566936	;Дюрневир
		Return 250000.0
	ElseIf BaseID == 33605402	;Дюрневир (призванный)
		Return 0.0
	ElseIf BaseID == 33662782	;Жнец
		Return 50000.0
	ElseIf BaseID == 67258600	;Закрисош
		Return 150000.0
	ElseIf BaseID == 67204923	;Илдари Саротрил
		Return 75000.0
	ElseIf BaseID == 119993		;Император
		Return 100000.0
	ElseIf BaseID == 119994		;Император, фэйк
		Return 10000.0
	ElseIf BaseID == 123787		;Капитан Харгар
		Return 50000.0
	ElseIf BaseID == 67212901	;Карстааг
		Return 75000.0
	ElseIf BaseID == 1055174	;Квенел (босс Волундруда)
		Return 60000.0
	ElseIf BaseID == 136705		;Кемату
		Return 50000.0
	ElseIf BaseID == 236471		;Корнал
		Return 50000.0
	ElseIf BaseID == 792840		;Красный Орел
		Return 60000.0
	ElseIf BaseID == 1050471	;Кросис
		Return 100000.0
	ElseIf BaseID == 297813		;Куралмил
		Return 60000.0
	ElseIf BaseID == 78497		;Легат Рикке
		Return 50000.0
	ElseIf BaseID == 853363		;Легат Рикке
		Return 50000.0
	ElseIf BaseID == 513657		;Линви
		Return 35000.0
	ElseIf BaseID == 33617151	;Локил
		Return 75000.0
	ElseIf BaseID == 33569703	;Лорд Харкон
		Return 500000.0
	ElseIf BaseID == 33614876	;Лорд Харкон
		Return 500000.0
	ElseIf BaseID == 33614986	;Лорд Харкон
		Return 500000.0
	ElseIf BaseID == 33663293	;Лорд Харкон
		Return 500000.0
	ElseIf BaseID == 144186		;Луа Аль-Скавен
		Return 75000.0
	ElseIf BaseID == 33570053	;Малк
		Return 75000.0
	ElseIf BaseID == 641894		;Малкоран
		Return 60000.0
	ElseIf BaseID == 33641473	;Мастер-Кузнец
		Return 200000.0
	ElseIf BaseID == 165106		;Мастер Ритуалов
		Return 50000.0
	ElseIf BaseID == 166611		;Мейлин Варен
		Return 50000.0
	ElseIf BaseID == 110716		;Мерсер Фрей
		Return 60000.0
	ElseIf BaseID == 702207		;Микрул Голдурсон
		Return 60000.0
	ElseIf BaseID == 33634339	;Минорна
		Return 30000.0
	ElseIf BaseID == 67205430	;Мирак
		Return 500000.0
	ElseIf BaseID == 67205432	;Мирак
		Return 500000.0
	ElseIf BaseID == 67207037	;Мирак
		Return 500000.0
	ElseIf BaseID == 67207041	;Мирак
		Return 500000.0
	ElseIf BaseID == 67238296	;Мирак
		Return 500000.0
	ElseIf BaseID == 67238808	;Мирак
		Return 500000.0
	ElseIf BaseID == 67240153	;Мирак
		Return 500000.0
	ElseIf BaseID == 572305		;Моварт
		Return 75000.0
	ElseIf BaseID == 1001836	;Морокеи
		Return 200000.0
	ElseIf BaseID == 1016987	;Накрин
		Return 250000.0
	ElseIf BaseID == 272294		;Нарис Порочный
		Return 50000.0
	ElseIf BaseID == 33623708	;Насларум
		Return 175000.0
	ElseIf BaseID == 67238288	;Огненный змей
		Return 0.0
	ElseIf BaseID == 286584		;Оркендор
		Return 75000.0
	ElseIf BaseID == 630575		;Освобожденный дремора
		Return 50000.0
	ElseIf BaseID == 1062043	;Останки Потемы
		Return 75000.0
	ElseIf BaseID == 226874		;Отар Безумный
		Return 175000.0
	ElseIf BaseID == 217937		;Рагот
		Return 250000.0
	ElseIf BaseID == 237343		;Рулиндил
		Return 50000.0
	ElseIf BaseID == 115941		;Себастьян Лорт
		Return 50000.0
	ElseIf BaseID == 682050		;Сигдис Голдурсон
		Return 60000.0
	ElseIf BaseID == 682056		;Сигдис Голдурсон (подделка)
		Return 0.0
	ElseIf BaseID == 307374		;Сильвия
		Return 50000.0
	ElseIf BaseID == 334207		;Сильд Чернокнижник
		Return 50000.0
	ElseIf BaseID == 79532		;Синдинг, оборотень
		Return 25000.0
	ElseIf BaseID == 67228910	;Смотритель Нчардака
		Return 100000.0
	ElseIf BaseID == 401704		;Старый орк
		Return 50000.0
	ElseIf BaseID == 225886		;Страж Сирек
		Return 60000.0
	ElseIf BaseID == 225841		;Страж Торстен
		Return 60000.0
	ElseIf BaseID == 966190		;Тень Малкорана
		Return 60000.0
	ElseIf BaseID == 213503		;Торек
		Return 50000.0
	ElseIf BaseID == 684859		;Туран
		Return 125000.0
	ElseIf BaseID == 82253		;Ульфрик Буревестник
		Return 50000.0
	ElseIf BaseID == 853365		;Ульфрик Буревестник
		Return 50000.0
	ElseIf BaseID == 959873		;Ульфрик Буревестник
		Return 50000.0
	ElseIf BaseID == 591673		;Фьола
		Return 40000.0
	ElseIf BaseID == 67216243	;Хакнир Печать Смерти
		Return 150000.0
	ElseIf BaseID == 121860		;Халдин
		Return 50000.0
	ElseIf BaseID == 317159		;Хевнорак
		Return 125000.0
	ElseIf BaseID == 412444		;Холдир
		Return 60000.0
	ElseIf BaseID == 537854		;Чемпион Боэтии
		Return 75000.0
	ElseIf BaseID == 67274179	;Эбонитовый воин
		Return 250000.0
	ElseIf BaseID == 216471		;Эстормо
		Return 75000.0
	ElseIf BaseID == 79481	;Гунзул
		Return 40000.0
	ElseIf BaseID == 113448		;Юрик Голдурсон
		Return 60000.0
	ElseIf BaseID == 548164		;Орини Дрел
		Return 15000.0
	ElseIf BaseID == 548161		;Сартис Идрен
		Return 15000.0 
	ElseIf BaseID == 997637		; Спригган-матрона
		Return 20000.0 
	ElseIf BaseID == 885310		; Мясник по квесту скумы. 0009FF4C 655180
		Return 15000.0 
	ElseIf BaseID == 655180		; Изгой с красным орлом
		Return 25000.0 
	ElseIf BaseID == 1062162		; Разбийник 1
		Return 7500.0
	ElseIf BaseID == 1062163		; Разбийник 2
		Return 7500.0
	ElseIf BaseID == 1062164		; Разбийник 3
		Return 7500.0
	ElseIf BaseID == 1062165		; Разбийник 4
		Return 7500.0
	ElseIf BaseID == 724615		; Подсос боэтии
		Return 45000.0
	ElseIf BaseID == 1062119		; Разбийник 
		Return 7500.0
	ElseIf BaseID == 116994		; нетрезвый
		Return 15000.0 
	EndIf
	Return -1.1
EndFunction

Float Function UniqueXPMods(Form BaseForm)
	If BaseForm == GetFormFromFile(2294695, "Requiem - Breaking Bad.esp") ;Агнар Железная Борода
		Return 60000.0
	ElseIf BaseForm == GetFormFromFile(77431, "tbmchrysamere.esp") ;Браннсгит
		Return 120000.0
	ElseIf BaseForm == GetFormFromFile(490084, "Requiem.esp") ;Гигантская рыба убийца со щитом Дагона
		Return 75000.0
	ElseIf BaseForm == GetFormFromFile(288609, "Requiem.esp") ;Гигантский краб на острове
		Return 35000.0
	ElseIf BaseForm == GetFormFromFile(281586, "Requiem.esp") ;Горак Убийца троллей
		Return 40000.0
	ElseIf BaseForm == GetFormFromFile(116994, "Requiem.esp") ; Нетрезвый
		Return 15000.0
	ElseIf BaseForm == GetFormFromFile(2163270, "Requiem.esp") ;Гром
		Return 50000.0
	ElseIf BaseForm == GetFormFromFile(148228, "Requiem for a Dream - Kelpie.esp") ;Этеринавт в Кагрензеле КЭЛПИ
		Return 35000.0
	ElseIf BaseForm == GetFormFromFile(4922794, "Requiem.esp") ;Джон Безумец
		Return 50000.0
	ElseIf BaseForm == GetFormFromFile(1848181, "Fozars_Dragonborn_-_Requiem_Patch.esp") ;За
		Return 40000.0
	ElseIf BaseForm == GetFormFromFile(148214, "Requiem for a Dream - Kelpie.esp") ;Зел-Мзбаин КЭЛПИ
		Return 40000.0
	ElseIf BaseForm == GetFormFromFile(148207, "Requiem for a Dream - Kelpie.esp") ;Кадак Мезалф КЭЛПИ
		Return 40000.0
	ElseIf BaseForm == GetFormFromFile(11352255, "Requiem.esp") ;Король Олаф Одноглазый
		Return 60000.0
	ElseIf BaseForm == GetFormFromFile(1848183, "Fozars_Dragonborn_-_Requiem_Patch.esp") ;Крий
		Return 40000.0
	ElseIf BaseForm == GetFormFromFile(283006, "Requiem.esp") ;Кру'ул
		Return 30000.0
	ElseIf BaseForm == GetFormFromFile(148221, "Requiem for a Dream - Kelpie.esp") ;Мзарк
		Return 50000.0
	ElseIf BaseForm == GetFormFromFile(3481934, "Requiem.esp") ;Рагнок
		Return 70000.0
	ElseIf BaseForm == GetFormFromFile(471506, "Requiem.esp") ;Рон Ворон
		Return 15000.0
	ElseIf BaseForm == GetFormFromFile(148216, "Requiem for a Dream - Kelpie.esp") ;Смотрящий Мтансела КЭЛПИ
		Return 35000.0
	ElseIf BaseForm == GetFormFromFile(3836959, "Requiem.esp") ;Снег
		Return 20000.0
	ElseIf BaseForm == GetFormFromFile(1848186, "Fozars_Dragonborn_-_Requiem_Patch.esp") ;Сош
		Return 40000.0
	ElseIf BaseForm == GetFormFromFile(127448, "Requiem for a Dream - Kelpie.esp") ;Тень Ингола КЭЛПИ
		Return 50000.0
	ElseIf BaseForm == GetFormFromFile(2294700, "Requiem - Breaking Bad.esp") ;Тилоре Малорен
		Return 65000.0
	ElseIf BaseForm == GetFormFromFile(283002, "Requiem.esp") ;Улик
		Return 30000.0
	ElseIf BaseForm == GetFormFromFile(169051, "Requiem for a Dream - Kelpie.esp")	;Gathrik КЭЛПИ
		Return 50000.0
	ElseIf BaseForm == GetFormFromFile(169042, "Requiem for a Dream - Kelpie.esp")	;BleakFallsBarrowAmbushBoss КЭЛПИ
		Return 50000.0
	ElseIf BaseForm == GetFormFromFile(169052, "Requiem for a Dream - Kelpie.esp")	;Borgas КЭЛПИ
		Return 50000.0
	ElseIf BaseForm == GetFormFromFile(169057, "Requiem for a Dream - Kelpie.esp")	;Паладин Улондил КЭЛПИ
		Return 75000.0
	ElseIf BaseForm == GetFormFromFile(105824, "Requiem for a Dream - Lichdom patch.esp")	;Порченая тень
		Return 0.0
	ElseIf BaseForm == GetFormFromFile(105828, "Requiem for a Dream - Lichdom patch.esp")	;Порченая тень
		Return 0.0
	ElseIf BaseForm == GetFormFromFile(189798, "Requiem for a Dream - Kelpie.esp")	;Брурид
		Return 30000.0
	ElseIf BaseForm == GetFormFromFile(2049, "Requiem for a Dream - Lichdom patch.esp")	;Валиндра Шедоумантл
		Return 75000.0
	ElseIf BaseForm == GetFormFromFile(2065, "Requiem for a Dream - Lichdom patch.esp")	;Валиндра Шедоумантл
		Return 75000.0
	ElseIf BaseForm == GetFormFromFile(293753, "Requiem for a Dream - Kelpie.esp")	;Ригель Сильная Рука
		Return 15000.0
	ElseIf BaseForm == GetFormFromFile(293723, "Requiem for a Dream - Kelpie.esp")	;До'Сакхар
		Return 15000.0
	ElseIf BaseForm == GetFormFromFile(293735, "Requiem for a Dream - Kelpie.esp")	; "Шаглак"  
		Return 15000.0
	ElseIf BaseForm == GetFormFromFile(314511, "Requiem for a Dream - Kelpie.esp")	; "Зачарованный двемерский паук"  
		Return 50000.0
	ElseIf BaseForm == GetFormFromFile(501629, "Requiem for a Dream - Kelpie.esp")	; Изгой чорт
		Return 25000.0
	ElseIf BaseForm == GetFormFromFile(189331, "Requiem - Beware The Dead.esp")	; "Анахорет Червей"
		Return 100000.0
	ElseIf BaseForm == GetFormFromFile(211003, "Requiem - Beware The Dead.esp")	; "Юрген Призыватель Ветра"
		Return 50000.0
	ElseIf BaseForm == GetFormFromFile(210632, "Requiem - Beware The Dead.esp")	; "Лорд ужаса"
		Return 100000.0
	ElseIf BaseForm == GetFormFromFile(157239, "Dragonborn.esm")	; "Зачарованная Сфера из ДБ"
		Return 60000.0
	ElseIf BaseForm == GetFormFromFile(3713685, "Requiem.esp")	; "Зачарованная Сфера" REQ_Actor_EnchantedSphere "Зачарованная сфера" [NPC_:0938AA95]
		Return 60000.0
	ElseIf BaseForm == GetFormFromFile(680124, "Requiem.esp")	; "Зачарованная Сфера" REQ_Actor_EnchantedSphere_DeepFolkCrossing [NPC_:090A60BC]
		Return 60000.0
	ElseIf BaseForm == GetFormFromFile(3723844, "Requiem.esp")	; "Зачарованная Сфера" REQ_Actor_EnchantedSphere_Mzark [NPC_:0938D244]
		Return 60000.0
	ElseIf BaseForm == GetFormFromFile(3348500, "Requiem.esp")	; "Зачарованная Сфера" REQ_Actor_EnchantedSphere_Mzulft [NPC_:09331814]
		Return 60000.0
	ElseIf BaseForm == GetFormFromFile(11351779, "Requiem.esp") ;Элси Спайкер
		Return 20000.0
	EndIf
	Return -1.1
EndFunction