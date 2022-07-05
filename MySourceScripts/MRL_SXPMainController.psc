ScriptName MRL_SXPMainController Extends Quest

GlobalVariable Property XPPoints Auto

Actor Property PlayerRef Auto

MRL_SXPWidget Property Widget Auto

FormList Property AVLists Auto
FormList Property QuestsList Auto
FormList Property QuestExpGlobalsList Auto

float Property GeneralXPMult = 0.8 Auto
float Property QuestXPMult = 1.0 Auto
float Property ActorXPMult = 1.0 Auto

int Property MainQuestExp = 40000 Auto
int Property DaedraQuestExp = 75000 Auto

int Property BlockId = 0 autoReadOnly
int Property HeavyArmorId = 1 autoReadOnly
int Property OneHandedId = 2 autoReadOnly
int Property SmithingId = 3 autoReadOnly
int Property TwoHandedId = 4 autoReadOnly
int Property AlterationId = 5 autoReadOnly
int Property ConjurationId = 6 autoReadOnly
int Property DestructionId = 7 autoReadOnly
int Property EnchantingId = 8 autoReadOnly
int Property IllusionId = 9 autoReadOnly
int Property RestorationId = 10 autoReadOnly
int Property MarksmanId = 11 autoReadOnly
int Property AlchemyId = 12 autoReadOnly
int Property LightArmorId = 13 autoReadOnly
int Property LockpickingId = 14 autoReadOnly
int Property PickpocketId = 15 autoReadOnly
int Property SneakId = 16 autoReadOnly
int Property SpeechcraftId = 17 autoReadOnly
int Property AllSkillsId = 18 autoReadOnly

string[] Stats
bool IsInitStats = false

bool[] QuestsCompleted
bool IsInitQuests = false

int MainQuestCounter = 0
int DaedraQuestCounter = 0

bool registerUpdate = false

string[] Function GetStatsArray()
  ;Debug.Notification("Get stats array")
  return Stats
EndFunction

; Проверка на наличие кейворда у игрока
bool Function HasKeywordForSale(Keyword kw)
  ;Debug.Notification("HasKeywordForSale kw: " + kw)
  return PlayerRef.HasMagicEffectWithKeyword(kw) || PlayerRef.WornHasKeyword(kw) || PlayerRef.HasKeyword(kw)
EndFunction

; Аккамулируем скидку, по индексу 0 должен лежать формлист с кейвордами
; По индексу 1 формлист с глобалками которые маппятся на лист с кейвордами 1 на 1
float Function AccSkillSales(FormList avList)
  ;Debug.Notification("AccSkillSales")

  FormList keywordsList = avList.GetAt(0) as FormList
  FormList globalsList = avList.GetAt(1) as FormList

  int keywordsSize = keywordsList.GetSize()
  int globalsSize = globalsList.GetSize()
  int size = keywordsSize

  if keywordsSize > globalsSize
    size = globalsSize
  endif

  float sale = 0.0

  int index = 0

  While index < size
    
    if keywordsList.GetAt(index) as Keyword && HasKeywordForSale(keywordsList.GetAt(index) as Keyword)

      if globalsList.GetAt(index) as GlobalVariable
        sale = sale + (globalsList.GetAt(index) as GlobalVariable).GetValue()
      endif

    endif

    index = index + 1

  EndWhile

  return sale

EndFunction

; Получить скидку для скила
float Function GetSkillSale(int statId)
  ;Debug.Notification("GetSkillSale statId: " + statId)

  float allSkillSale = AccSkillSales(AVLists.GetAt(AllSkillsId) as FormList)

  return allSkillSale + AccSkillSales(AVLists.GetAt(statId) as FormList)

EndFunction

; Инициализация массива со строками актор велью, маппится 1 в 1 на индeксы выше
Function StatsInit()

  ;Debug.Notification("Stats array init")

  if IsInitStats
    return
  endif

  Stats = new string[18]

	Stats[BlockId] = "Block"
	Stats[HeavyArmorId] = "HeavyArmor"
	Stats[OneHandedId] = "OneHanded"
	Stats[SmithingId] = "Smithing"
	Stats[TwoHandedId] = "TwoHanded"
	Stats[AlterationId] = "Alteration"
	Stats[ConjurationId] = "Conjuration"
	Stats[DestructionId] = "Destruction"
	Stats[EnchantingId] = "Enchanting"
	Stats[IllusionId] = "Illusion"
	Stats[RestorationId] = "Restoration"
	Stats[MarksmanId] = "Marksman"
	Stats[AlchemyId] = "Alchemy"
	Stats[LightArmorId] = "LightArmor"
	Stats[LockpickingId] = "Lockpicking"
	Stats[PickpocketId] = "Pickpocket"
	Stats[SneakId] = "Sneak"
	Stats[SpeechcraftId] = "Speechcraft"

  IsInitStats = true

EndFunction

; Инициализация массива для проверки на выполнен квест либо нет, маппится 1 в 1 на формлист квестов и формлист глобалок
Function InitQuests()

  if IsInitQuests
    return
  endif

  int size = QuestsList.GetSize()

  QuestsCompleted = Utility.CreateBoolArray(size, false)

  int index = 0

  While index < size
    
    QuestsCompleted[index] = false

    index = index + 1

  EndWhile

  IsInitQuests = true

EndFunction

; Прокачка заданного навыка по индексу до указанного значение
Function SkillAdvance(int statId, int nextSkillLevel)

  ;Debug.Notification("Skill advance")

	ActorValueInfo actorValue = ActorValueInfo.GetActorValueInfobyName(Stats[statId])

	while PlayerRef.GetBaseActorValue(Stats[statId]) as Int < nextSkillLevel
		Game.IncrementSkill(Stats[statId])
	endwhile

	actorValue.SetSkillExperience(0.0)

EndFunction

; Функция покупки скила на указанное количество
Function PurchaseSkill(int statId, int statMod, float skillSale)

  ;Debug.Notification("Purchase skill statId: " + statId + "  statMod: " + statMod)

  if statMod < 1
    return
  endif

  int skillLevel = PlayerRef.GetBaseActorValue(Stats[statId]) as Int

  if skillLevel >= 100
    ;Debug.Notification("Skill is cap")
    return
  endif

  int nextSkillLevel = skillLevel + statMod 
  if nextSkillLevel > 100
    nextSkillLevel = 100
  endif

  int expNeed = GetNextXPMulti(skillLevel, nextSkillLevel, skillSale)

  int currentXp = XPPoints.GetValue() as Int

  if expNeed > currentXp
    ;Debug.Notification("Not enough exp, expNeed: " + expNeed + " currentXp: " + currentXp)
    return
  endif

  SkillAdvance(statId, nextSkillLevel)
  UseXP(expNeed)

  ;Debug.Notification("New skill level: " + PlayerRef.GetBaseActorValue(Stats[statId]))
  PlayerRef.SetActorValue(Stats[statId], nextSkillLevel as float)

EndFunction

; Функция что бы узнать текущее количество опыта
float Function GetXP()
  ;Debug.Notification("Get xp")
	return XPPoints.GetValue()
EndFunction

; Функция увеличения опыта на заданное количество
; Применяется глобальный модификатор опыта
Function GainXP(float XPMod)
  ;Debug.Notification("Gain xp: " + XPMod)
  XPPoints.Mod(XPMod * GeneralXPMult)
  Widget.Render()
EndFunction

Function GainXPMessage(float XPMod, string xpmessage = "")
  float exp = XPMod * GeneralXPMult
  Debug.Notification(xpmessage + " " + (exp as int) + " XP")
  XPPoints.Mod(exp)
  Widget.Render()
EndFunction

; Функция для траты опыта, аргумент должен быть положительным значением
Function UseXP(float XPMod)

  ;Debug.Notification("Use xp: " + XPMod)

  if XPMod <= 0.0
    return
  endif

  XPPoints.Mod(XPMod * -1.0)
  Widget.Render()
  
EndFunction

; Рассчет количества опыта которое нужно
; Что бы прокачать навык до следующего уровня
int Function GetNextXP(int currentSkillValue, float skillSale)

  ;Debug.Notification("GetNextXP currentSkillValue: " + currentSkillValue + " Skill sale: " + skillSale)

  if skillSale >= 100.0
    return 0
  endif

  int expToNextSkillLevel = 0
  int nextSkillLevel = currentSkillValue + 1

  expToNextSkillLevel = Math.pow(nextSkillLevel, 2.5) as Int
  expToNextSkillLevel += (1000 * (1 - nextSkillLevel * 0.01)) as Int

  if expToNextSkillLevel < 0
    return 0
  endif

  if skillSale != 0.0 && skillSale > 0.0
    expToNextSkillLevel = (expToNextSkillLevel * (1 - (skillSale / 100))) as int
  endif

  if skillSale != 0.0 && skillSale < 0.0
    skillSale = Math.abs(skillSale)
    expToNextSkillLevel = (expToNextSkillLevel * (1 + (skillSale / 100))) as int
  endif

  return expToNextSkillLevel

EndFunction

; Рассчет количества опыта которое нужно что бы прокачать навык на заданное количество
int Function GetNextXPMulti(int currentSkillValue, int nextSkillLevel, float skillSale)

  int expNeed = 0

  while currentSkillValue < nextSkillLevel
    expNeed = expNeed + GetNextXP(currentSkillValue, skillSale)
    currentSkillValue = currentSkillValue + 1
  endwhile

  return expNeed

EndFunction

; Рассчет того на сколько можно вообще прокачать навык
int Function CanPurchaseSkills(int statId, float skillSale)
  int skillLevel = PlayerRef.GetBaseActorValue(Stats[statId]) as Int
  if skillLevel >= 100
    return 0
  endif

  int currentXp = XPPoints.GetValue() as Int
  int expNeed = 0
  int buyCount = 0

  while skillLevel < 100

    expNeed = expNeed + GetNextXP(skillLevel, skillSale)

    if expNeed > currentXp
      return buyCount
    endif

    buyCount = buyCount + 1
    skillLevel = skillLevel + 1

  endwhile

  return buyCount

EndFunction

Function QuestHandle()
  
  int index = 0

  int size = QuestsCompleted.Length

  ;Debug.Notification("QuestHandle index: " + index + " size: " + size)

  while index < size

    Quest q = QuestsList.GetAt(index) as Quest

    if q

      ;Debug.Notification("Is Quest: " + q.GetName() + " CompletedArray: " + QuestsCompleted[index] + " QuestCompleted: " + q.IsCompleted())

      GlobalVariable g = QuestExpGlobalsList.GetAt(index) as GlobalVariable

      if g && !QuestsCompleted[index] && q.IsCompleted()

        float exp = g.GetValue() * QuestXPMult

        GainXPMessage(exp, "Квест " + q.GetName() + " завершен:")
        QuestsCompleted[index] = true

      endif

    endif

    index = index + 1

  endwhile

EndFunction

Function MainQuestHandle(int mainQuestCompl)

  int d = mainQuestCompl - MainQuestCounter

  if d > 0

    float exp = d * MainQuestExp * QuestXPMult

    GainXPMessage(exp, "Основной сюжетный квест завершен:")
    MainQuestCounter = mainQuestCompl

  endif

EndFunction

Function DaedraQuestHandle(int daedraQuestCompl)

  int d = daedraQuestCompl - DaedraQuestCounter

  if d > 0

    float exp = d * DaedraQuestExp * QuestXPMult

    GainXPMessage(exp, "Квест принца даэдра завершен:")
    DaedraQuestCounter = daedraQuestCompl

  endif

EndFunction

; Инициализация системы
Event OnInit()
  Utility.WaitMenuMode(1.0)
  ;Debug.Notification("System exp init")
  StatsInit()
  InitQuests()
  DaedraQuestCounter = Game.QueryStat("Daedric Quests Completed")
  MainQuestCounter = Game.QueryStat("Main Quests Completed")
  Utility.WaitMenuMode(1.0)
  Widget.Render()
  registerUpdate = true
  RegisterForSingleUpdate(10.0)
EndEvent

; Обработка выполнения заданий даэдра и основного квеста
Event OnUpdate()

  ;Debug.Notification("OnUpdate system exp")

  int mainQuest = Game.QueryStat("Main Quests Completed")
  int daedreQuest = Game.QueryStat("Daedric Quests Completed")

  MainQuestHandle(mainQuest)
  DaedraQuestHandle(daedreQuest)
  QuestHandle()
  Widget.Render()

  if registerUpdate
    RegisterForSingleUpdate(10.0)
  endif

EndEvent