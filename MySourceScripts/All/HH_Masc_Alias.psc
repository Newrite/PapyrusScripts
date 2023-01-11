Scriptname HH_Masc_Alias extends ReferenceAlias  

Formlist[] Property RequiredRace Auto

ReferenceAlias[] Property FactionAlias Auto

Armor Property HH_ArmorBanditHelmet Auto; Бандиты

Armor Property HH_ArmorBanditCuirass Auto; Бандиты

Armor Property HH_ArmorElvenHelmet Auto; Талморцы

Armor Property HH_ArmorElvenLightCuirass Auto ; Талморцы

Armor Property HH_ClothesNecromancerRobes_hood Auto ; Некроманты 

Armor Property HH_ForswornHelmet Auto ; Изгои

Armor Property HH_ForswornCuirass Auto ; Изгои

Armor Property HH_Warlock_robes Auto ; Колдуны

Armor Property HH_Vamp_Armor Auto ; Вампиры

KeyWord Property Vampire Auto 

KeyWord Property HH_Masc_Item Auto 

int blockKeyCode_M = 208	

GlobalVariable Property HH_Press_Massc Auto

GlobalVariable Property HH_MASCARAD_CHECK Auto

Actor Property PlayerRef  Auto

bool onMasc = false

Perk Property HH_Pickpocket_Masc Auto

Perk Property HH_Pickpocket1 Auto

Event Oninit()
	InitializeMod()
EndEvent


Function InitializeMod()
								;Debug.Notification("Initialization started")
	RegisterForKey(blockKeyCode_M)
      RegisterForKey(1)
								;Debug.Notification("BlockKeyCode Registered")
								;Debug.Notification("Right Attack/Block registered")
      setBlockKeyCode()
EndFunction

Function setBlockKeyCode()
								;Debug.Notification("setBlockKeyCode started")
	UnregisterForKey(blockKeyCode_M)
								;Debug.Notification("unregistered previous key")
	if HH_Press_Massc.GetValueInt()!=0
	   blockKeyCode_M = HH_Press_Massc.GetValueInt()
	RegisterForKey(blockKeyCode_M)
      endif
								;Debug.Notification("registered new key")
	EndFunction

Event OnKeyDown(Int KeyCode)
	if KeyCode==1
		setBlockKeyCode()
	endif
	if !Utility.IsInMenuMode() && KeyCode==blockKeyCode_M && onMasc == false && (PlayerRef.HasPerk(HH_Pickpocket_Masc) || PlayerRef.HasPerk(HH_Pickpocket1))
		if PlayerRef.IsEquipped(HH_ArmorBanditHelmet) && PlayerRef.IsEquipped(HH_ArmorBanditCuirass)
			FactionAlias[6].ForceRefTo(PlayerRef)
			onMasc = true
			HH_MASCARAD_CHECK.SetValueInt(1)
			Game.DisablePlayerControls(false,true,false,false,false,false,false,false)
			Debug.Notification("Вы выглядите как член шайки бандитов")
		endif
		if PlayerRef.IsEquipped(HH_ForswornHelmet) && PlayerRef.IsEquipped(HH_ForswornCuirass) && (RequiredRace[0].HasForm(PlayerRef.GetRace())) && PlayerRef.HasPerk(HH_Pickpocket_Masc)
			FactionAlias[0].ForceRefTo(PlayerRef)
			onMasc = true
			Game.DisablePlayerControls(false,true,false,false,false,false,false,false)
			Debug.Notification("Вы выглядите как изгой")
			HH_MASCARAD_CHECK.SetValueInt(1)
			elseif PlayerRef.IsEquipped(HH_ArmorElvenHelmet) && PlayerRef.IsEquipped(HH_ArmorElvenLightCuirass) && (RequiredRace[4].HasForm(PlayerRef.GetRace()))
			FactionAlias[4].ForceRefTo(PlayerRef)
			onMasc = true
			Game.DisablePlayerControls(false,true,false,false,false,false,false,false)
			Debug.Notification("Вы выглядите как сторонник Доминиона")
			HH_MASCARAD_CHECK.SetValueInt(1)
			elseif PlayerRef.IsEquipped(HH_ClothesNecromancerRobes_hood)
			FactionAlias[2].ForceRefTo(PlayerRef)
			onMasc = true
			Game.DisablePlayerControls(false,true,false,false,false,false,false,false)
			Debug.Notification("Вы выглядите как Некромант")
			HH_MASCARAD_CHECK.SetValueInt(1)
			elseif PlayerRef.IsEquipped(HH_Warlock_robes)
			FactionAlias[5].ForceRefTo(PlayerRef)
			Debug.Notification("Вы выглядите как маг-ренегат")
			HH_MASCARAD_CHECK.SetValueInt(1)
			onMasc = true
			Game.DisablePlayerControls(false,true,false,false,false,false,false,false)
		endif
		if PlayerRef.IsEquipped(HH_Vamp_Armor) && PlayerRef.HasKeyWord(Vampire) 
			FactionAlias[7].ForceRefTo(PlayerRef)
			onMasc = true
			Game.DisablePlayerControls(false,true,false,false,false,false,false,false)
			Debug.Notification("Вампиры теперь дружественны к вам")
			HH_MASCARAD_CHECK.SetValueInt(1)
		endif
	elseif KeyCode==blockKeyCode_M && onMasc == true && (PlayerRef.HasPerk(HH_Pickpocket_Masc) || PlayerRef.HasPerk(HH_Pickpocket1))
	Game.EnablePlayerControls()
	FactionAlias[6].Clear()
	FactionAlias[0].Clear()
	FactionAlias[4].Clear()
	FactionAlias[5].Clear()
	FactionAlias[7].Clear()
	FactionAlias[2].Clear()
	onMasc = false
	Debug.Notification("Маскировка снята")
	HH_MASCARAD_CHECK.SetValueInt(0)
	endif
EndEvent

Event OnObjectUnEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject.HasKeyword(HH_Masc_Item) && onMasc == true && (PlayerRef.HasPerk(HH_Pickpocket_Masc) || PlayerRef.HasPerk(HH_Pickpocket1))
		Game.EnablePlayerControls()
		FactionAlias[6].Clear()
		FactionAlias[0].Clear()
		FactionAlias[4].Clear()
		FactionAlias[5].Clear()
		FactionAlias[2].Clear()
		FactionAlias[7].Clear()
		onMasc = false
		Debug.Notification("Маскировка снята")
		HH_MASCARAD_CHECK.SetValueInt(0)
	endif
EndEvent